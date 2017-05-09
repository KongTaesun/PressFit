package kr.co.pressfit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
 
import kr.co.pressfit.utill.UploadFileUtils;

import kr.co.pressfit.service.JoinService;
import kr.co.pressfit.utill.MediaUtils;
import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.MemberVO;

 
@Controller 
public class JoinController {
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Inject  
	JoinService joinService;
	
	@RequestMapping("member/list.do") 
	public String memberList(Model model){

		List<MemberVO> list=joinService.memberList();
		model.addAttribute("list", list); 
		return "member/member_list";
	}
	@RequestMapping("member/write.do")
	public String write(){
		return "member/write"; 
	}
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberVO vo){
	
		joinService.insertMember(vo);
		return "redirect:/index.jsp"; 
	}	

	@RequestMapping("member/mypage.do")
	public String mypage(@RequestParam  String id, Model model){
		
		logger.info("�겢由��븳 �븘�씠�뵒:"+id);
		model.addAttribute("vo", joinService.mypage(id));
		
		return "member/mypage";
	}
	@RequestMapping("member/updatepage.do")
	public String updatepage(@RequestParam  String id, Model model){
		
		logger.info("�겢由��븳 �븘�씠�뵒:"+id);
		model.addAttribute("vo", joinService.updatepage(id));
		
		return "member/updatepage";
	}
	
	
	@RequestMapping("member/update.do") 
	public String update(@ModelAttribute MemberVO vo, Model model){
	
			joinService.updateMember(vo);
			return "redirect:/member/mypage.do";  
		}
	 
	@RequestMapping("member/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pw, Model model){ 

		
			joinService.deleteMember(id);
			return "redirect:/index"; 
				
	}
	
	
	 @RequestMapping("member/imageUpload.do")
	    public void imageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload, HttpSession session) throws Exception {
	    	response.setCharacterEncoding("utf-8");
	    	response.setContentType("text/html");
	    	String id = (String) session.getAttribute("id");
	    	MemberVO vo = new MemberVO();
	    	OutputStream out = null;
	    	PrintWriter printwriter = null;
	    	String fileName = upload.getOriginalFilename();
	    	vo.setId(id);
	    	vo.setCpicture(fileName);
	    	
	    	joinService.addAttach(vo);
	    
	    	byte[] bytes = upload.getBytes();
	    	String uploadPath = "C:/Users/bit/PressFit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PressFit/resources/upload/"+fileName;
	    	out = new FileOutputStream(new File(uploadPath));
	    	out.write(bytes);
	    	String callback = request.getParameter("CKEditorFuncNum");
	    	printwriter = response.getWriter();
	    	String fileUrl = request.getContextPath()+"/resources/upload/"+fileName;
	    	printwriter.println("<script> window.parent.CKEDITOR.tools.callFunction("
	    			+callback+",'"+fileUrl+"','Success')"
	    					+ "</script>");
	    	printwriter.flush();
	    	out.close();
	    }
	 
}















