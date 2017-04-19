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
import kr.co.pressfit.service.FaqService;
import kr.co.pressfit.utill.MediaUtils;
import kr.co.pressfit.utill.UploadFileUtils;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.FaqVO;

@Controller    // 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/faq/*")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
    // 의존관계 주입 => BoardServiceImpl 생성
    // IoC 의존관계 역전
    @Inject
    FaqService faqservice;
    String folder = "faq";

    @Resource(name="uploadPath")
    String uploadPath;
    
    // 01. 게시글 목록
    @RequestMapping("list.do")
    // @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
    public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
                            @RequestParam(defaultValue="") String keyword,
                            @RequestParam(defaultValue="1") int curPage) throws Exception{
        
        // 레코드의 갯수 계산
        int count = faqservice.countArticle(searchOption, keyword);
        
        // 페이지 나누기 관련 처리
        BoardPager boardPager = new BoardPager(count, curPage);
        int start = boardPager.getPageBegin();
        int end = boardPager.getPageEnd();
        
        List<FaqVO> list = faqservice.listAll(start, end, searchOption, keyword);
        
        // 데이터를 맵에 저장
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list); // list
        map.put("count", count); // 레코드의 갯수
        map.put("searchOption", searchOption); // 검색옵션
        map.put("keyword", keyword); // 검색키워드
        map.put("boardPager", boardPager);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
        mav.setViewName(folder+"/list"); // 뷰를 list.jsp로 설정
        
        return mav; // list.jsp로 List가 전달된다.
    }


    
    // 02_01. 게시글 작성화면
    // @RequestMapping("board/write.do")
    // value="", method="전송방식"
    @RequestMapping(value="write.do", method=RequestMethod.GET)
    public String write(){
        return folder+"/write"; // write.jsp로 이동
    }
    
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute FaqVO vo, HttpSession session) throws Exception{
        // session에 저장된 userId를 writer에 저장
        String writer = (String) session.getAttribute("id");
        // vo에 writer를 세팅
        vo.setWriter(writer);
        faqservice.create(vo);
        return "redirect:list.do";
    }
    
    // 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
    // @RequestParam : get/post방식으로 전달된 변수 1개
    // HttpSession 세션객체
 // 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int idx, @RequestParam int curPage, @RequestParam String searchOption,
                            @RequestParam String keyword, HttpSession session) throws Exception{
    	faqservice.increaseViewcnt(idx, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(folder+"/view");
        // 댓글의 수를 맵에 저장 : 댓글이 존재하는 게시물의 삭제처리 방지하기 위해 
        mav.addObject("count", faqservice.replycount(idx)); 
        mav.addObject("dto", faqservice.read(idx));
        mav.addObject("curPage", curPage);
        mav.addObject("searchOption", searchOption);
        mav.addObject("keyword", keyword);
        logger.info("mav:", mav);
        return mav;
    }
    
    // 04. 게시글 수정
    // 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
    @RequestMapping(value="update.do", method=RequestMethod.GET)
    public ModelAndView update(@ModelAttribute FaqVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/update");
    	mav.addObject("dto", faqservice.read(vo.getIdx()));
    	logger.info("mav:", mav);
        return mav;
    }
 // 04. 게시글 수정
    // 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
    @RequestMapping(value="cmt.do", method=RequestMethod.GET)
    public ModelAndView cmt(@ModelAttribute FaqVO vo) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(folder+"/cmt");
    	FaqVO a = faqservice.read(vo.getIdx());
    	mav.addObject("ptitle", a.getTitle());
    	mav.addObject("pref", a.getRef());
    	mav.addObject("pturn", a.getTurn());
    	mav.addObject("plevel", a.getLevel());
    	logger.info("mav:", mav);
        return mav;
    }
    @RequestMapping(value="updateinsert.do", method=RequestMethod.POST)
    public String updateinsert(@ModelAttribute FaqVO vo) throws Exception{
    	faqservice.update(vo);
        return "redirect:view.do?idx="+vo.getIdx()+"&curPage=1&searchOption=&keyword=";
    }
    
    @RequestMapping(value="cmtinsert.do", method=RequestMethod.POST)
    public String cmtinsert(@ModelAttribute FaqVO vo, HttpSession session) throws Exception{
        // session에 저장된 userId를 writer에 저장
        String writer = (String) session.getAttribute("id");
        // vo에 writer를 세팅
        vo.setWriter(writer);
        faqservice.createcmt(vo);
        
        return "redirect:list.do";
    }
    
    // 05. 게시글 삭제
    @RequestMapping("delete.do")
    public String delete(@RequestParam int idx) throws Exception{
    	faqservice.delete(idx);
        return "redirect:list.do";
    }
    // 게시글 첨부파일 목록 매핑
    @RequestMapping("/getAttach/{idx}")
    @ResponseBody // view가 아닌 data를 리턴
    public List<String> getAttach(@PathVariable("idx") int idx){
        return faqservice.getAttach(idx);
    }
    
    @RequestMapping("imageUpload.do")
    public void iageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload) throws Exception {
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html");
    	OutputStream out = null;
    	PrintWriter printwriter = null;
    	String fileName = upload.getOriginalFilename();
    	byte[] bytes = upload.getBytes();
    	String uploadPath = "C:/Users/teauk/PressFit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PressFit/resources/upload/"+fileName;
    	out = new FileOutputStream(new File(uploadPath));
    	out.write(bytes);
    	String callback = request.getParameter("CKEditorFuncNum");
    	printwriter = response.getWriter();
    	String fileUrl = request.getContextPath()+"/resources/upload/"+fileName;
    	printwriter.println("<script> window.parent.CKEDITOR.tools.callFunction("
    			+callback+",'"+fileUrl+"','이미지가 업로드 되었습니다.')"
    					+ "</script>");
    	printwriter.flush();
    	out.close();
    }

    // 4. Ajax업로드 페이지 매핑
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.GET)
    public void uploadAjax(){
        // uploadAjax.jsp로 포워딩
    }

    // 5. Ajax업로드 처리 매핑
    // 파일의 한글처리 : produces="text/plain;charset=utf-8"
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping(value="/upload/uploadAjax.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
        logger.info("originalName : "+file.getOriginalFilename());
        logger.info("size : "+file.getSize());
        logger.info("contentType : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
    
    // 6. 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
            entity = new ResponseEntity<byte[]>(IOUtil.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }

    // 7. 파일 삭제 매핑
    @ResponseBody // view가 아닌 데이터 리턴
    @RequestMapping(value = "/upload/deleteFile.do", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 파일의 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 이미지 파일 여부 검사
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
        // 이미지 파일이면
        if (mType != null) {
            // 썸네일 이미지 파일 추출
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 썸네일 이미지 삭제
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 원본 파일 삭제
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 레코드 삭제
        faqservice.deleteFile(fileName);

        // 데이터와 http 상태 코드 전송
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    // 1_2. 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
    // @ResponseEntity : 데이터 + http status code
    // @ResponseBody : 객체를 json으로 (json - String)
    // @RequestBody : json을 객체로
    @RequestMapping(value="/reply/insertRest.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // 세션에 저장된 회원아이디를 댓글작성자에 세팅
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // 댓글입력 메서드 호출
            faqservice.replycreate(vo);
            // 댓글입력이 성공하면 성공메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글입력이 실패하면 실패메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 입력 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    @RequestMapping(value="/reply/insertRestcmt.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRestcmt(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // 세션에 저장된 회원아이디를 댓글작성자에 세팅
            String id = (String) session.getAttribute("id");
            vo.setReplayer(id);
            // 댓글입력 메서드 호출
            System.out.println(vo);
            ReplyVO pa = faqservice.replydetail(vo.getIdx());
            vo.setRef(pa.getRef());
            vo.setTurn(pa.getTurn());
            vo.setLevel(pa.getLevel());
            System.out.println(vo);
            faqservice.replycreatecmt(vo);
            // 댓글입력이 성공하면 성공메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글입력이 실패하면 실패메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 입력 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    // ** Controller 추가 사항 - Rest방식으로 댓글 목록, 수정, 삭제 처리
    
    // 2_3. 댓글 목록(@RestController방식 :  json으로 전달하여 목록생성)
    // /reply/list/1 => 1번 게시물의 댓글 목록 리턴
    // /reply/list/2 => 2번 게시물의 댓글 목록 리턴
    // @PathVariable : url에 입력될 변수값 지정
    @RequestMapping(value="/reply/list/{idx}/{curPage}", method=RequestMethod.GET)
    public ModelAndView replyList(@PathVariable("idx") int idx, @PathVariable int curPage, ModelAndView mav, HttpSession session){
        // 페이징 처리
        int count = faqservice.replycount(idx); // 댓글 갯수
        ReplyPager replyPager = new ReplyPager(count, curPage);
        // 현재 페이지의 페이징 시작 번호
        int start = replyPager.getPageBegin();
        // 현재 페이지의 페이징  끝 번호
        int end = replyPager.getPageEnd();
        List<ReplyVO> list = faqservice.replylist(idx, start, end, session);
        System.out.println(list);
        // 뷰이름 지정
        mav.setViewName(folder+"/replyList");
        // 뷰에 전달할 데이터 지정
        mav.addObject("boardno", idx);
        mav.addObject("list", list);
        mav.addObject("replyPager", replyPager);
        // replyList.jsp로 포워딩
        return mav;
    }
    
    // 3. 댓글 상세 보기
    // /reply/detail/1 => 1번 댓글의 상세화면 리턴
    // /reply/detail/2 => 2번 댓글의 상세화면 리턴
    // @PathVariable : url에 입력될 변수값 지정
    @RequestMapping(value="/reply/detail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        ReplyVO vo = faqservice.replydetail(idx);
        // 뷰이름 지정
        mav.setViewName(folder+"/replyDetail");
        // 뷰에 전달할 데이터 지정
        mav.addObject("vo", vo);
        // replyDetail.jsp로 포워딩
        return mav;
    }
    // 3. 댓글 상세 보기
    // /reply/detail/1 => 1번 댓글의 상세화면 리턴
    // /reply/detail/2 => 2번 댓글의 상세화면 리턴
    // @PathVariable : url에 입력될 변수값 지정
    @RequestMapping(value="/reply/Cmtdetail/{boardno}/{idx}", method=RequestMethod.GET)
    public ModelAndView replyCmtDetail(@PathVariable("idx") Integer idx,
    		@PathVariable("boardno") Integer boardno,ModelAndView mav){
        // 뷰이름 지정
    	mav.addObject("idx",idx);
    	mav.addObject("cmt","cmt");
    	mav.addObject("boardno",boardno);
        mav.setViewName(folder+"/replyDetail");
        return mav;
    }
    
    // 4. 댓글 수정 처리 - PUT:전체 수정, PATCH:일부수정
    // RequestMethod를 여러 방식으로 설정할 경우 {}안에 작성
    @RequestMapping(value="/reply/update/{idx}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> replyUpdate(@PathVariable("idx") Integer idx, @RequestBody ReplyVO vo){
        ResponseEntity<String> entity = null;
        try {
            vo.setIdx(idx);
            faqservice.replyupdate(vo);
            // 댓글 수정이 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 수정이 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 수정 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    
    // 5. 댓글 삭제처리
    @RequestMapping(value="/reply/delete/{idx}")
    public ResponseEntity<String> replyDelete(@PathVariable("idx") Integer idx){
        ResponseEntity<String> entity = null;
        try {
        	faqservice.replydelete(idx);
            // 댓글 삭제가 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 삭제가 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 삭제 처리 HTTP 상태 메시지 리턴
        return entity;
    }
}