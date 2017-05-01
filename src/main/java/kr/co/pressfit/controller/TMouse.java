package kr.co.pressfit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.plexus.util.IOUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.common.BoardPager;
import kr.co.pressfit.common.ReplyPager;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.utill.MediaUtils;
import kr.co.pressfit.utill.UploadFileUtils;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.TMouseVO;

@Controller 
@RequestMapping("/tmouse/*")
public class TMouse {
	private static final Logger logger = LoggerFactory.getLogger(TMouse.class);

    @Inject
    TMouseService tmouseservice;
    String folder = "tmouse";

    @Resource(name="uploadPath")
    String uploadPath;
    
    @RequestMapping("list.do")
 
    public ModelAndView list(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int minPrice,
			@RequestParam(defaultValue = "200000") int maxPrice, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session)throws Exception {
		String id = (String) session.getAttribute("id");
		int count = tmouseservice.countArticle(searchOption, keyword, id);

		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		List<TMouseVO> list = tmouseservice.listAll(start, end, searchOption, keyword, minPrice, maxPrice, id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(folder + "/list");

		return mav;
	}

    @RequestMapping(value="write.do", method=RequestMethod.GET)
    public String write(){
        return folder+"/write"; // write.jsp嚥∽옙 占쎌뵠占쎈짗
    }
    
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute TMouseVO vo, HttpSession session) throws Exception{
        // session占쎈퓠 占쏙옙占쎌삢占쎈쭆 userId�몴占� writer占쎈퓠 占쏙옙占쎌삢
        String crea_id = (String) session.getAttribute("id");
        vo.setCrea_id(crea_id);
        tmouseservice.create(vo);
        return "redirect:list.do";
    }
    
    
    // 03. 野껊슣�뻻疫뀐옙 占쎄맒占쎄쉭占쎄땀占쎌뒠 鈺곌퀬�돳, 野껊슣�뻻疫뀐옙 鈺곌퀬�돳占쎈땾 筌앹빓占� 筌ｌ꼶�봺
    // @RequestParam : get/post獄쎻뫗�뻼占쎌몵嚥∽옙 占쎌읈占쎈뼎占쎈쭆 癰귨옙占쎈땾 1揶쏉옙
    // HttpSession 占쎄쉭占쎈�▼첎�빘猿�
 // 03. 野껊슣�뻻疫뀐옙 占쎄맒占쎄쉭占쎄땀占쎌뒠 鈺곌퀬�돳, 野껊슣�뻻疫뀐옙 鈺곌퀬�돳占쎈땾 筌앹빓占� 筌ｌ꼶�봺
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int idx, @RequestParam int curPage, @RequestParam String searchOption,
                            @RequestParam String keyword, HttpSession session) throws Exception{
    	tmouseservice.increaseViewcnt(idx, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(folder+"/view");
        mav.addObject("count", tmouseservice.replycount(idx)); 
        mav.addObject("dto", tmouseservice.read(idx));
        TMouseVO vo = tmouseservice.read(idx);
        
        System.out.println("vo:"+vo);
        mav.addObject("curPage", curPage);
        mav.addObject("searchOption", searchOption);
        mav.addObject("keyword", keyword);
        logger.info("mav:", mav);
        return mav;
    }
    
    // 04. 野껊슣�뻻疫뀐옙 占쎈땾占쎌젟
    // 占쎈쨲占쎈퓠占쎄퐣 占쎌뿯占쎌젾占쎈립 占쎄땀占쎌뒠占쎈굶占쏙옙 @ModelAttribute BoardVO vo嚥∽옙 占쎌읈占쎈뼎占쎈쭡
    @RequestMapping(value="update.do", method=RequestMethod.GET)
    public ModelAndView update(@ModelAttribute TMouseVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/update");
    	mav.addObject("dto", tmouseservice.read(vo.getIdx()));
    	logger.info("mav:", mav);
        return mav;
    }
 // 04. 野껊슣�뻻疫뀐옙 占쎈땾占쎌젟 
    // 占쎈쨲占쎈퓠占쎄퐣 占쎌뿯占쎌젾占쎈립 占쎄땀占쎌뒠占쎈굶占쏙옙 @ModelAttribute BoardVO vo嚥∽옙 占쎌읈占쎈뼎占쎈쭡
    @RequestMapping(value="cmt.do", method=RequestMethod.GET)
    public ModelAndView cmt(@ModelAttribute TMouseVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/cmt");
    	TMouseVO a = tmouseservice.read(vo.getIdx());
    	logger.info("mav:", mav);
        return mav;
    }
    @RequestMapping(value="updateinsert.do", method=RequestMethod.POST)
    public String updateinsert(TMouseVO vo, HttpSession session) throws Exception {
    	String crea_id = (String) session.getAttribute("id");
        vo.setCrea_id(crea_id);
    	tmouseservice.update(vo);
    	return "redirect:view.do?idx="+vo.getIdx()+"&curPage=1&searchOption=&keyword=";
    }


    // 05. 野껊슣�뻻疫뀐옙 占쎄텣占쎌젫
    @RequestMapping("delete.do")
    public String delete(@RequestParam int idx) throws Exception{
        System.out.println(idx);
    	tmouseservice.delete(idx);
        
        return "redirect:list.do";
    }
    // 野껊슣�뻻疫뀐옙 筌ｂ뫀占쏙옙�솁占쎌뵬 筌뤴뫖以� 筌띲끋釉�
    @RequestMapping("/getAttach/{idx}")
    @ResponseBody // view揶쏉옙 占쎈툡占쎈빒 data�몴占� �뵳�뗪쉘
    public List<String> getAttach(@PathVariable("idx") int idx){
        return tmouseservice.getAttach(idx);
    }
    
    
    
    
    @RequestMapping("imageUpload.do")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload) throws Exception {
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html");
    	OutputStream out = null;
    	PrintWriter printwriter = null;
    	String fileName = upload.getOriginalFilename();
    	tmouseservice.addAttach(fileName);
    	byte[] bytes = upload.getBytes();
    	String uploadPath = "C:/Users/bit/PressFit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PressFit/resources/upload/"+fileName;
    	out = new FileOutputStream(new File(uploadPath));
    	out.write(bytes);
    	String callback = request.getParameter("CKEditorFuncNum");
    	printwriter = response.getWriter();
    	String fileUrl = request.getContextPath()+"/resources/upload/"+fileName;
    	printwriter.println("<script> window.parent.CKEDITOR.tools.callFunction("
    			+callback+",'"+fileUrl+"','dwqwsqqq')"
    					+ "</script>");
    	printwriter.flush();
    	out.close(); 
    } 

    @RequestMapping("imageUpdate.do")
    public void imageUpdate(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload, TMouseVO vo) throws Exception {
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html");
    	OutputStream out = null;
    	PrintWriter printwriter = null;
    	String fileName = upload.getOriginalFilename();
    	int idx = vo.getIdx();
    	tmouseservice.updateAttach(fileName, idx);
    	byte[] bytes = upload.getBytes();
    	String uploadPath = "C:/Users/bit/PressFit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PressFit/resources/upload/"+fileName;
    	out = new FileOutputStream(new File(uploadPath));
    	out.write(bytes);
    	String callback = request.getParameter("CKEditorFuncNum");
    	printwriter = response.getWriter();
    	String fileUrl = request.getContextPath()+"/resources/upload/"+fileName;
    	printwriter.println("<script> window.parent.CKEDITOR.tools.callFunction("
    			+callback+",'"+fileUrl+"','dwqwsqqq')"
    					+ "</script>");
    	printwriter.flush();
    	out.close(); 
    }
    
    
    
    // 4. Ajax占쎈씜嚥≪뮆諭� 占쎈읂占쎌뵠筌욑옙 筌띲끋釉�
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.GET)
    public void uploadAjax(){
        // uploadAjax.jsp嚥∽옙 占쎈７占쎌뜖占쎈뎃
    }

    // 5. Ajax占쎈씜嚥≪뮆諭� 筌ｌ꼶�봺 筌띲끋釉�
    // 占쎈솁占쎌뵬占쎌벥 占쎈립疫뀐옙筌ｌ꼶�봺 : produces="text/plain;charset=utf-8"
    @ResponseBody // view揶쏉옙 占쎈툡占쎈빒 data�뵳�뗪쉘
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
        logger.info("originalName : "+file.getOriginalFilename());
        logger.info("size : "+file.getSize());
        logger.info("contentType : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
    
    // 6. 占쎌뵠沃섎챷占� 占쎈ご占쎈뻻 筌띲끋釉�
    @ResponseBody // view揶쏉옙 占쎈툡占쎈빒 data�뵳�뗪쉘
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 占쎄퐣甕곌쑴�벥 占쎈솁占쎌뵬占쎌뱽 占쎈뼄占쎌뒲嚥≪뮆諭띰옙釉�疫뀐옙 占쎌맄占쎈립 占쎈뮞占쎈뱜�뵳占�
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 占쎌넇占쎌삢占쎌쁽�몴占� �빊遺욱뀱占쎈릭占쎈연 formatName占쎈퓠 占쏙옙占쎌삢
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // �빊遺욱뀱占쎈립 占쎌넇占쎌삢占쎌쁽�몴占� MediaUtils占쎄깻占쎌삋占쎈뮞占쎈퓠占쎄퐣  占쎌뵠沃섎챷占쏙옙�솁占쎌뵬占쎈연�겫占썹몴占� 野껓옙占쎄텢占쎈릭�⑨옙 �뵳�뗪쉘獄쏆룇釉� mType占쎈퓠 占쏙옙占쎌삢
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 占쎈엘占쎈쐭 �뤃�딄쉐 揶쏆빘猿�(占쎌뇚�겫占쏙옙肉됵옙苑� 占쎈쑓占쎌뵠占쎄숲�몴占� 雅뚯눊�ц쳸�룇�뱽 占쎈르占쎈퓠占쎈뮉 header占쏙옙 body�몴占� �뤃�딄쉐占쎈퉸占쎈튊占쎈릭疫뀐옙 占쎈르�눧紐꾨퓠)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 占쎄문占쎄쉐
            in = new FileInputStream(uploadPath + fileName);
            // 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬占쎌뵠筌롳옙
            if (mType != null) { 
                headers.setContentType(mType);
            // 占쎌뵠沃섎챷占썲첎占� 占쎈툡占쎈빍筌롳옙
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 占쎈뼄占쎌뒲嚥≪뮆諭띰옙�뒠 �뚢뫂�쀯옙�뱜 占쏙옙占쎌뿯
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 獄쏅뗄�뵠占쎈뱜獄쏄퀣肉댐옙�뱽 占쎈뮞占쎈뱜筌띻낯�몵嚥∽옙 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 占쎄퐣占쎌�占쎌쓦占쎈섧占쎈선, 占쎄쿃 占쎈뎡占쎌긾占쎈ご 占쎄땀�겫占쏙옙肉�  " \" 占쎄땀占쎌뒠 \" "
                // 占쎈솁占쎌뵬占쎌벥 占쎈립疫뀐옙 繹먥뫁彛� 獄쎻뫗占�
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 獄쏅뗄�뵠占쎈뱜獄쏄퀣肉�, 占쎈엘占쎈쐭, HTTP占쎄맒占쎄묶�굜遺얜굡
            entity = new ResponseEntity<byte[]>(IOUtil.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP占쎄맒占쎄묶 �굜遺얜굡()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //占쎈뮞占쎈뱜�뵳占� 占쎈뼍疫뀐옙
        }
        return entity;
    }

    // 7. 占쎈솁占쎌뵬 占쎄텣占쎌젫 筌띲끋釉�
    @ResponseBody // view揶쏉옙 占쎈툡占쎈빒 占쎈쑓占쎌뵠占쎄숲 �뵳�뗪쉘
    @RequestMapping(value = "/upload/deleteFile.do", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 占쎈솁占쎌뵬占쎌벥 占쎌넇占쎌삢占쎌쁽 �빊遺욱뀱
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬 占쎈연�겫占� 野껓옙占쎄텢
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 占쎌뵠沃섎챷占쏙옙�벥 野껋럩�뒭(占쎈쑞占쎄퐬占쎌뵬 + 占쎌뜚癰귣챸�솁占쎌뵬 占쎄텣占쎌젫), 占쎌뵠沃섎챷占썲첎占� 占쎈툡占쎈빍筌롳옙 占쎌뜚癰귣챸�솁占쎌뵬筌랃옙 占쎄텣占쎌젫
        // 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬占쎌뵠筌롳옙
        if (mType != null) {
            // 占쎈쑞占쎄퐬占쎌뵬 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬 �빊遺욱뀱
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 占쎈쑞占쎄퐬占쎌뵬 占쎌뵠沃섎챷占� 占쎄텣占쎌젫
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 占쎌뜚癰귨옙 占쎈솁占쎌뵬 占쎄텣占쎌젫
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 占쎌쟿�굜遺얜굡 占쎄텣占쎌젫
        tmouseservice.deleteFile(fileName);

        // 占쎈쑓占쎌뵠占쎄숲占쏙옙 http 占쎄맒占쎄묶 �굜遺얜굡 占쎌읈占쎈꽊
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    // 1_2. 占쎈솊疫뀐옙占쎌뿯占쎌젾 (@RestController獄쎻뫗�뻼占쎌몵嚥∽옙 json占쎌읈占쎈뼎占쎈릭占쎈연 占쎈솊疫뀐옙占쎌뿯占쎌젾)
    // @ResponseEntity : 占쎈쑓占쎌뵠占쎄숲 + http status code
    // @ResponseBody : 揶쏆빘猿쒐몴占� json占쎌몵嚥∽옙 (json - String)
    // @RequestBody : json占쎌뱽 揶쏆빘猿쒏에占�
    @RequestMapping(value="/reply/insertRest.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // 占쎄쉭占쎈�∽옙肉� 占쏙옙占쎌삢占쎈쭆 占쎌돳占쎌뜚占쎈툡占쎌뵠占쎈탵�몴占� 占쎈솊疫뀐옙占쎌삂占쎄쉐占쎌쁽占쎈퓠 占쎄쉭占쎈샒
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾 筌롫뗄苑뚳옙諭� 占쎌깈�빊占�
            tmouseservice.replycreate(vo);
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾占쎌뵠 占쎄쉐�⑤벏釉�筌롳옙 占쎄쉐�⑤벉李볩옙�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾占쎌뵠 占쎈뼄占쎈솭占쎈릭筌롳옙 占쎈뼄占쎈솭筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 占쎌뿯占쎌젾 筌ｌ꼶�봺 HTTP 占쎄맒占쎄묶 筌롫뗄�뻻筌욑옙 �뵳�뗪쉘
        return entity;
    }
    @RequestMapping(value="/reply/insertRestcmt.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRestcmt(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // 占쎄쉭占쎈�∽옙肉� 占쏙옙占쎌삢占쎈쭆 占쎌돳占쎌뜚占쎈툡占쎌뵠占쎈탵�몴占� 占쎈솊疫뀐옙占쎌삂占쎄쉐占쎌쁽占쎈퓠 占쎄쉭占쎈샒
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾 筌롫뗄苑뚳옙諭� 占쎌깈�빊占�
            System.out.println(vo);
            ReplyVO pa = tmouseservice.replydetail(vo.getIdx());
            vo.setRef(pa.getRef());
            vo.setTurn(pa.getTurn());
            vo.setLevel(pa.getLevel());
            System.out.println(vo);
            tmouseservice.replycreatecmt(vo);
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾占쎌뵠 占쎄쉐�⑤벏釉�筌롳옙 占쎄쉐�⑤벉李볩옙�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 占쎈솊疫뀐옙占쎌뿯占쎌젾占쎌뵠 占쎈뼄占쎈솭占쎈릭筌롳옙 占쎈뼄占쎈솭筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 占쎌뿯占쎌젾 筌ｌ꼶�봺 HTTP 占쎄맒占쎄묶 筌롫뗄�뻻筌욑옙 �뵳�뗪쉘
        return entity;
    }
    // ** Controller �빊遺쏙옙 占쎄텢占쎈퉮 - Rest獄쎻뫗�뻼占쎌몵嚥∽옙 占쎈솊疫뀐옙 筌뤴뫖以�, 占쎈땾占쎌젟, 占쎄텣占쎌젫 筌ｌ꼶�봺
    
    // 2_3. 占쎈솊疫뀐옙 筌뤴뫖以�(@RestController獄쎻뫗�뻼 :  json占쎌몵嚥∽옙 占쎌읈占쎈뼎占쎈릭占쎈연 筌뤴뫖以됵옙源�占쎄쉐)
    // /reply/list/1 => 1甕곤옙 野껊슣�뻻�눧�눘�벥 占쎈솊疫뀐옙 筌뤴뫖以� �뵳�뗪쉘
    // /reply/list/2 => 2甕곤옙 野껊슣�뻻�눧�눘�벥 占쎈솊疫뀐옙 筌뤴뫖以� �뵳�뗪쉘
    // @PathVariable : url占쎈퓠 占쎌뿯占쎌젾占쎈쭍 癰귨옙占쎈땾揶쏉옙 筌욑옙占쎌젟
    @RequestMapping(value="/reply/list/{idx}/{curPage}", method=RequestMethod.GET)
    public ModelAndView replyList(@PathVariable("idx") int idx, @PathVariable int curPage, ModelAndView mav, HttpSession session){
        // 占쎈읂占쎌뵠筌욑옙 筌ｌ꼶�봺
        int count = tmouseservice.replycount(idx); // 占쎈솊疫뀐옙 揶쏉옙占쎈땾
        ReplyPager replyPager = new ReplyPager(count, curPage);
        // 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙占쎌벥 占쎈읂占쎌뵠筌욑옙 占쎈뻻占쎌삂 甕곕뜇�깈
        int start = replyPager.getPageBegin();
        // 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙占쎌벥 占쎈읂占쎌뵠筌욑옙  占쎄국 甕곕뜇�깈
        int end = replyPager.getPageEnd();
        List<ReplyVO> list = tmouseservice.replylist(idx, start, end, session);
        System.out.println(list);
        // �뀎怨쀬뵠�뵳占� 筌욑옙占쎌젟
        mav.setViewName(folder+"/replyList");
        // �뀎怨쀫퓠 占쎌읈占쎈뼎占쎈막 占쎈쑓占쎌뵠占쎄숲 筌욑옙占쎌젟
        mav.addObject("boardno", idx);
        mav.addObject("list", list);
        mav.addObject("replyPager", replyPager);
        // replyList.jsp嚥∽옙 占쎈７占쎌뜖占쎈뎃
        return mav;
    }
    
    // 3. 占쎈솊疫뀐옙 占쎄맒占쎄쉭 癰귣떯由�
    // /reply/detail/1 => 1甕곤옙 占쎈솊疫뀐옙占쎌벥 占쎄맒占쎄쉭占쎌넅筌롳옙 �뵳�뗪쉘
    // /reply/detail/2 => 2甕곤옙 占쎈솊疫뀐옙占쎌벥 占쎄맒占쎄쉭占쎌넅筌롳옙 �뵳�뗪쉘
    // @PathVariable : url占쎈퓠 占쎌뿯占쎌젾占쎈쭍 癰귨옙占쎈땾揶쏉옙 筌욑옙占쎌젟
    @RequestMapping(value="/reply/detail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        ReplyVO vo = tmouseservice.replydetail(idx);
        // �뀎怨쀬뵠�뵳占� 筌욑옙占쎌젟
        mav.setViewName(folder+"/replyDetail");
        // �뀎怨쀫퓠 占쎌읈占쎈뼎占쎈막 占쎈쑓占쎌뵠占쎄숲 筌욑옙占쎌젟
        mav.addObject("vo", vo);
        // replyDetail.jsp嚥∽옙 占쎈７占쎌뜖占쎈뎃
        return mav;
    }
    // 3. 占쎈솊疫뀐옙 占쎄맒占쎄쉭 癰귣떯由�
    // /reply/detail/1 => 1甕곤옙 占쎈솊疫뀐옙占쎌벥 占쎄맒占쎄쉭占쎌넅筌롳옙 �뵳�뗪쉘
    // /reply/detail/2 => 2甕곤옙 占쎈솊疫뀐옙占쎌벥 占쎄맒占쎄쉭占쎌넅筌롳옙 �뵳�뗪쉘
    // @PathVariable : url占쎈퓠 占쎌뿯占쎌젾占쎈쭍 癰귨옙占쎈땾揶쏉옙 筌욑옙占쎌젟
    @RequestMapping(value="/reply/Cmtdetail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyCmtDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        // �뀎怨쀬뵠�뵳占� 筌욑옙占쎌젟
    	mav.addObject("idx",idx);
    	mav.addObject("cmt","cmt");
    	mav.addObject("boardno",boardno);
        mav.setViewName(folder+"/replyDetail");
        return mav;
    }
    
    // 4. 占쎈솊疫뀐옙 占쎈땾占쎌젟 筌ｌ꼶�봺 - PUT:占쎌읈筌ｏ옙 占쎈땾占쎌젟, PATCH:占쎌뵬�겫占쏙옙�땾占쎌젟
    // RequestMethod�몴占� 占쎈연占쎌쑎 獄쎻뫗�뻼占쎌몵嚥∽옙 占쎄퐬占쎌젟占쎈막 野껋럩�뒭 {}占쎈툧占쎈퓠 占쎌삂占쎄쉐
    @RequestMapping(value="/reply/update/{idx}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> replyUpdate(@PathVariable("idx") Integer idx, @RequestBody ReplyVO vo){
        ResponseEntity<String> entity = null;
        try {
            vo.setIdx(idx);
            tmouseservice.replyupdate(vo);
            // 占쎈솊疫뀐옙 占쎈땾占쎌젟占쎌뵠 占쎄쉐�⑤벏釉�筌롳옙 占쎄쉐�⑨옙 占쎄맒占쎄묶筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 占쎈솊疫뀐옙 占쎈땾占쎌젟占쎌뵠 占쎈뼄占쎈솭占쎈릭筌롳옙 占쎈뼄占쎈솭 占쎄맒占쎄묶筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 占쎈땾占쎌젟 筌ｌ꼶�봺 HTTP 占쎄맒占쎄묶 筌롫뗄�뻻筌욑옙 �뵳�뗪쉘
        return entity;
    }
    
    // 5. 占쎈솊疫뀐옙 占쎄텣占쎌젫筌ｌ꼶�봺
    @RequestMapping(value="/reply/delete/{idx}")
    public ResponseEntity<String> replyDelete(@PathVariable("idx") Integer idx){
        ResponseEntity<String> entity = null;
        try {
            tmouseservice.replydelete(idx);
            // 占쎈솊疫뀐옙 占쎄텣占쎌젫揶쏉옙 占쎄쉐�⑤벏釉�筌롳옙 占쎄쉐�⑨옙 占쎄맒占쎄묶筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 占쎈솊疫뀐옙 占쎄텣占쎌젫揶쏉옙 占쎈뼄占쎈솭占쎈릭筌롳옙 占쎈뼄占쎈솭 占쎄맒占쎄묶筌롫뗄�뻻筌욑옙 占쏙옙占쎌삢
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 占쎄텣占쎌젫 筌ｌ꼶�봺 HTTP 占쎄맒占쎄묶 筌롫뗄�뻻筌욑옙 �뵳�뗪쉘
        return entity;
    }
}