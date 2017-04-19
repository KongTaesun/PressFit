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
        return folder+"/write"; // write.jsp濡� �씠�룞
    }
    
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute TMouseVO vo, HttpSession session) throws Exception{
        // session�뿉 ���옣�맂 userId瑜� writer�뿉 ���옣
        String crea_id = (String) session.getAttribute("id");
        vo.setCrea_id(crea_id);
        tmouseservice.create(vo);
        return "redirect:list.do";
    }
    
    // 03. 寃뚯떆湲� �긽�꽭�궡�슜 議고쉶, 寃뚯떆湲� 議고쉶�닔 利앷� 泥섎━
    // @RequestParam : get/post諛⑹떇�쑝濡� �쟾�떖�맂 蹂��닔 1媛�
    // HttpSession �꽭�뀡媛앹껜
 // 03. 寃뚯떆湲� �긽�꽭�궡�슜 議고쉶, 寃뚯떆湲� 議고쉶�닔 利앷� 泥섎━
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int idx, @RequestParam int curPage, @RequestParam String searchOption,
                            @RequestParam String keyword, HttpSession session) throws Exception{
    	tmouseservice.increaseViewcnt(idx, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(folder+"/view");
        // �뙎湲��쓽 �닔瑜� 留듭뿉 ���옣 : �뙎湲��씠 議댁옱�븯�뒗 寃뚯떆臾쇱쓽 �궘�젣泥섎━ 諛⑹��븯湲� �쐞�빐 
        mav.addObject("count", tmouseservice.replycount(idx)); 
        mav.addObject("dto", tmouseservice.read(idx));
        mav.addObject("curPage", curPage);
        mav.addObject("searchOption", searchOption);
        mav.addObject("keyword", keyword);
        logger.info("mav:", mav);
        return mav;
    }
    
    // 04. 寃뚯떆湲� �닔�젙
    // �뤌�뿉�꽌 �엯�젰�븳 �궡�슜�뱾�� @ModelAttribute BoardVO vo濡� �쟾�떖�맖
    @RequestMapping(value="update.do", method=RequestMethod.GET)
    public ModelAndView update(@ModelAttribute TMouseVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/update");
    	mav.addObject("dto", tmouseservice.read(vo.getIdx()));
    	logger.info("mav:", mav);
        return mav;
    }
 // 04. 寃뚯떆湲� �닔�젙
    // �뤌�뿉�꽌 �엯�젰�븳 �궡�슜�뱾�� @ModelAttribute BoardVO vo濡� �쟾�떖�맖
    @RequestMapping(value="cmt.do", method=RequestMethod.GET)
    public ModelAndView cmt(@ModelAttribute TMouseVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/cmt");
    	TMouseVO a = tmouseservice.read(vo.getIdx());
    	logger.info("mav:", mav);
        return mav;
    }
    @RequestMapping(value="updateinsert.do", method=RequestMethod.POST)
    public String updateinsert(@ModelAttribute TMouseVO vo) throws Exception{
        tmouseservice.update(vo);
        return "redirect:view.do?idx="+vo.getIdx()+"&curPage=1&searchOption=&keyword=";
    }

    // 05. 寃뚯떆湲� �궘�젣
    @RequestMapping("delete.do")
    public String delete(@RequestParam int idx) throws Exception{
        tmouseservice.delete(idx);
        return "redirect:list.do";
    }
    // 寃뚯떆湲� 泥⑤��뙆�씪 紐⑸줉 留ㅽ븨
    @RequestMapping("/getAttach/{idx}")
    @ResponseBody // view媛� �븘�땶 data瑜� 由ы꽩
    public List<String> getAttach(@PathVariable("idx") int idx){
        return tmouseservice.getAttach(idx);
    }
    
    @RequestMapping("imageUpload.do")
    public void iageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload) throws Exception {
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

    // 4. Ajax�뾽濡쒕뱶 �럹�씠吏� 留ㅽ븨
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.GET)
    public void uploadAjax(){
        // uploadAjax.jsp濡� �룷�썙�뵫
    }

    // 5. Ajax�뾽濡쒕뱶 泥섎━ 留ㅽ븨
    // �뙆�씪�쓽 �븳湲�泥섎━ : produces="text/plain;charset=utf-8"
    @ResponseBody // view媛� �븘�땶 data由ы꽩
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
        logger.info("originalName : "+file.getOriginalFilename());
        logger.info("size : "+file.getSize());
        logger.info("contentType : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
    
    // 6. �씠誘몄� �몴�떆 留ㅽ븨
    @ResponseBody // view媛� �븘�땶 data由ы꽩
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // �꽌踰꾩쓽 �뙆�씪�쓣 �떎�슫濡쒕뱶�븯湲� �쐞�븳 �뒪�듃由�
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // �솗�옣�옄瑜� 異붿텧�븯�뿬 formatName�뿉 ���옣
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 異붿텧�븳 �솗�옣�옄瑜� MediaUtils�겢�옒�뒪�뿉�꽌  �씠誘몄��뙆�씪�뿬遺�瑜� 寃��궗�븯怨� 由ы꽩諛쏆븘 mType�뿉 ���옣
            MediaType mType = MediaUtils.getMediaType(formatName);
            // �뿤�뜑 援ъ꽦 媛앹껜(�쇅遺��뿉�꽌 �뜲�씠�꽣瑜� 二쇨퀬諛쏆쓣 �븣�뿉�뒗 header�� body瑜� 援ъ꽦�빐�빞�븯湲� �븣臾몄뿉)
            HttpHeaders headers = new HttpHeaders();
            // InputStream �깮�꽦
            in = new FileInputStream(uploadPath + fileName);
            // �씠誘몄� �뙆�씪�씠硫�
            if (mType != null) { 
                headers.setContentType(mType);
            // �씠誘몄�媛� �븘�땲硫�
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // �떎�슫濡쒕뱶�슜 而⑦뀗�듃 ���엯
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 諛붿씠�듃諛곗뿴�쓣 �뒪�듃留곸쑝濡� : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 �꽌�쑀�읇�뼵�뼱, �겙 �뵲�샂�몴 �궡遺��뿉  " \" �궡�슜 \" "
                // �뙆�씪�쓽 �븳湲� 源⑥쭚 諛⑹�
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 諛붿씠�듃諛곗뿴, �뿤�뜑, HTTP�긽�깭肄붾뱶
            entity = new ResponseEntity<byte[]>(IOUtil.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP�긽�깭 肄붾뱶()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //�뒪�듃由� �떕湲�
        }
        return entity;
    }

    // 7. �뙆�씪 �궘�젣 留ㅽ븨
    @ResponseBody // view媛� �븘�땶 �뜲�씠�꽣 由ы꽩
    @RequestMapping(value = "/upload/deleteFile.do", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // �뙆�씪�쓽 �솗�옣�옄 異붿텧
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // �씠誘몄� �뙆�씪 �뿬遺� 寃��궗
        MediaType mType = MediaUtils.getMediaType(formatName);
        // �씠誘몄��쓽 寃쎌슦(�뜽�꽕�씪 + �썝蹂명뙆�씪 �궘�젣), �씠誘몄�媛� �븘�땲硫� �썝蹂명뙆�씪留� �궘�젣
        // �씠誘몄� �뙆�씪�씠硫�
        if (mType != null) {
            // �뜽�꽕�씪 �씠誘몄� �뙆�씪 異붿텧
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // �뜽�꽕�씪 �씠誘몄� �궘�젣
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // �썝蹂� �뙆�씪 �궘�젣
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // �젅肄붾뱶 �궘�젣
        tmouseservice.deleteFile(fileName);

        // �뜲�씠�꽣�� http �긽�깭 肄붾뱶 �쟾�넚
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    // 1_2. �뙎湲��엯�젰 (@RestController諛⑹떇�쑝濡� json�쟾�떖�븯�뿬 �뙎湲��엯�젰)
    // @ResponseEntity : �뜲�씠�꽣 + http status code
    // @ResponseBody : 媛앹껜瑜� json�쑝濡� (json - String)
    // @RequestBody : json�쓣 媛앹껜濡�
    @RequestMapping(value="/reply/insertRest.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // �꽭�뀡�뿉 ���옣�맂 �쉶�썝�븘�씠�뵒瑜� �뙎湲��옉�꽦�옄�뿉 �꽭�똿
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // �뙎湲��엯�젰 硫붿꽌�뱶 �샇異�
            tmouseservice.replycreate(vo);
            // �뙎湲��엯�젰�씠 �꽦怨듯븯硫� �꽦怨듬찓�떆吏� ���옣
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // �뙎湲��엯�젰�씠 �떎�뙣�븯硫� �떎�뙣硫붿떆吏� ���옣
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // �엯�젰 泥섎━ HTTP �긽�깭 硫붿떆吏� 由ы꽩
        return entity;
    }
    @RequestMapping(value="/reply/insertRestcmt.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRestcmt(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // �꽭�뀡�뿉 ���옣�맂 �쉶�썝�븘�씠�뵒瑜� �뙎湲��옉�꽦�옄�뿉 �꽭�똿
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // �뙎湲��엯�젰 硫붿꽌�뱶 �샇異�
            System.out.println(vo);
            ReplyVO pa = tmouseservice.replydetail(vo.getIdx());
            vo.setRef(pa.getRef());
            vo.setTurn(pa.getTurn());
            vo.setLevel(pa.getLevel());
            System.out.println(vo);
            tmouseservice.replycreatecmt(vo);
            // �뙎湲��엯�젰�씠 �꽦怨듯븯硫� �꽦怨듬찓�떆吏� ���옣
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // �뙎湲��엯�젰�씠 �떎�뙣�븯硫� �떎�뙣硫붿떆吏� ���옣
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // �엯�젰 泥섎━ HTTP �긽�깭 硫붿떆吏� 由ы꽩
        return entity;
    }
    // ** Controller 異붽� �궗�빆 - Rest諛⑹떇�쑝濡� �뙎湲� 紐⑸줉, �닔�젙, �궘�젣 泥섎━
    
    // 2_3. �뙎湲� 紐⑸줉(@RestController諛⑹떇 :  json�쑝濡� �쟾�떖�븯�뿬 紐⑸줉�깮�꽦)
    // /reply/list/1 => 1踰� 寃뚯떆臾쇱쓽 �뙎湲� 紐⑸줉 由ы꽩
    // /reply/list/2 => 2踰� 寃뚯떆臾쇱쓽 �뙎湲� 紐⑸줉 由ы꽩
    // @PathVariable : url�뿉 �엯�젰�맆 蹂��닔媛� 吏��젙
    @RequestMapping(value="/reply/list/{idx}/{curPage}", method=RequestMethod.GET)
    public ModelAndView replyList(@PathVariable("idx") int idx, @PathVariable int curPage, ModelAndView mav, HttpSession session){
        // �럹�씠吏� 泥섎━
        int count = tmouseservice.replycount(idx); // �뙎湲� 媛��닔
        ReplyPager replyPager = new ReplyPager(count, curPage);
        // �쁽�옱 �럹�씠吏��쓽 �럹�씠吏� �떆�옉 踰덊샇
        int start = replyPager.getPageBegin();
        // �쁽�옱 �럹�씠吏��쓽 �럹�씠吏�  �걹 踰덊샇
        int end = replyPager.getPageEnd();
        List<ReplyVO> list = tmouseservice.replylist(idx, start, end, session);
        System.out.println(list);
        // 酉곗씠由� 吏��젙
        mav.setViewName(folder+"/replyList");
        // 酉곗뿉 �쟾�떖�븷 �뜲�씠�꽣 吏��젙
        mav.addObject("boardno", idx);
        mav.addObject("list", list);
        mav.addObject("replyPager", replyPager);
        // replyList.jsp濡� �룷�썙�뵫
        return mav;
    }
    
    // 3. �뙎湲� �긽�꽭 蹂닿린
    // /reply/detail/1 => 1踰� �뙎湲��쓽 �긽�꽭�솕硫� 由ы꽩
    // /reply/detail/2 => 2踰� �뙎湲��쓽 �긽�꽭�솕硫� 由ы꽩
    // @PathVariable : url�뿉 �엯�젰�맆 蹂��닔媛� 吏��젙
    @RequestMapping(value="/reply/detail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        ReplyVO vo = tmouseservice.replydetail(idx);
        // 酉곗씠由� 吏��젙
        mav.setViewName(folder+"/replyDetail");
        // 酉곗뿉 �쟾�떖�븷 �뜲�씠�꽣 吏��젙
        mav.addObject("vo", vo);
        // replyDetail.jsp濡� �룷�썙�뵫
        return mav;
    }
    // 3. �뙎湲� �긽�꽭 蹂닿린
    // /reply/detail/1 => 1踰� �뙎湲��쓽 �긽�꽭�솕硫� 由ы꽩
    // /reply/detail/2 => 2踰� �뙎湲��쓽 �긽�꽭�솕硫� 由ы꽩
    // @PathVariable : url�뿉 �엯�젰�맆 蹂��닔媛� 吏��젙
    @RequestMapping(value="/reply/Cmtdetail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyCmtDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        // 酉곗씠由� 吏��젙
    	mav.addObject("idx",idx);
    	mav.addObject("cmt","cmt");
    	mav.addObject("boardno",boardno);
        mav.setViewName(folder+"/replyDetail");
        return mav;
    }
    
    // 4. �뙎湲� �닔�젙 泥섎━ - PUT:�쟾泥� �닔�젙, PATCH:�씪遺��닔�젙
    // RequestMethod瑜� �뿬�윭 諛⑹떇�쑝濡� �꽕�젙�븷 寃쎌슦 {}�븞�뿉 �옉�꽦
    @RequestMapping(value="/reply/update/{idx}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> replyUpdate(@PathVariable("idx") Integer idx, @RequestBody ReplyVO vo){
        ResponseEntity<String> entity = null;
        try {
            vo.setIdx(idx);
            tmouseservice.replyupdate(vo);
            // �뙎湲� �닔�젙�씠 �꽦怨듯븯硫� �꽦怨� �긽�깭硫붿떆吏� ���옣
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // �뙎湲� �닔�젙�씠 �떎�뙣�븯硫� �떎�뙣 �긽�깭硫붿떆吏� ���옣
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // �닔�젙 泥섎━ HTTP �긽�깭 硫붿떆吏� 由ы꽩
        return entity;
    }
    
    // 5. �뙎湲� �궘�젣泥섎━
    @RequestMapping(value="/reply/delete/{idx}")
    public ResponseEntity<String> replyDelete(@PathVariable("idx") Integer idx){
        ResponseEntity<String> entity = null;
        try {
            tmouseservice.replydelete(idx);
            // �뙎湲� �궘�젣媛� �꽦怨듯븯硫� �꽦怨� �긽�깭硫붿떆吏� ���옣
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // �뙎湲� �궘�젣媛� �떎�뙣�븯硫� �떎�뙣 �긽�깭硫붿떆吏� ���옣
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // �궘�젣 泥섎━ HTTP �긽�깭 硫붿떆吏� 由ы꽩
        return entity;
    }
}