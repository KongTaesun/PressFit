package kr.co.pressfit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;

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
import kr.co.pressfit.vo.MemberVO;

 
@Controller  //�쁽�옱 �겢�옒�뒪瑜� controller bean�쑝濡� �벑濡앹떆�궡
public class JoinController {
	//import org.slf4j.Logger;
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
// MemberService 媛앹껜瑜� �뒪�봽留곸뿉�꽌 �깮�꽦�븯�뿬 二쇱엯�떆�궡
	@Inject  
	JoinService joinService;

	private String uploadPath;
	
// url pattern mapping	
	@RequestMapping("member/list.do")
	public String memberList(Model model){
// Controller => Service => DAO �슂泥�		
		List<MemberVO> list=joinService.memberList();
		model.addAttribute("list", list); 
		return "member/member_list";
	}
	//�쉶�썝�벑濡앺뤌�쑝濡� �씠�룞
	@RequestMapping("member/write.do")
	public String write(){
		return "member/write";
	}
// @ModelAttribute �뿉 �뤌�뿉�꽌 �엯�젰�븳 �뜲�씠�꽣媛� ���옣�맖	 
	//insert 泥섎━
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberVO vo){
		// �뀒�씠釉붿뿉 �젅肄붾뱶瑜� �엯�젰
		joinService.insertMember(vo);
		// member_list.jsp濡� 由щ뵒�젆�듃
//   /member/list.do 猷⑦듃 �뵒�젆�넗由� 湲곗�
//   member/list.do  �쁽�옱 �뵒�젆�넗由� 湲곗�
		return "redirect:/member/list.do"; 
	}	
	 
	@RequestMapping("member/view.do")
	public String view(@RequestParam  String id, Model model){
		//System.out.println("�겢由��븳 �븘�씠�뵒:"+userid);
// info, debug, warn, error 		
		logger.info("�겢由��븳 �븘�씠�뵒:"+id);
		// �쉶�썝�젙蹂대�� 紐⑤뜽�뿉 ���옣
		model.addAttribute("vo"
				, joinService.viewMember(id));
		// view.jsp濡� �룷�썙�뵫
		return "member/view";
	}
	@RequestMapping("member/update.do") 
	public String update(@ModelAttribute MemberVO vo, Model model){
		System.out.println(vo);
		//鍮꾨�踰덊샇 泥댄겕
		boolean result=joinService.checkPw("member1","1234");
		if(result){
			joinService.updateMember(vo);
			return "redirect:/member/list.do";  
		}else{
			//媛��엯�씪�옄,�닔�젙�궇吏�
			MemberVO vo2 = joinService.viewMember(
					vo.getId());
			vo.setRegdate(vo2.getRegdate());
			vo.setUpdatedate(vo2.getUpdatedate());
			
			model.addAttribute("vo",vo);
			model.addAttribute("message"
					,"鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
			return "member/view"; 
		}
	}
	
	 
	
// 	@RequestMapping : url mapping
//  @RequestParam : get or post 諛⑹떇�쑝濡� �쟾�떖�맂 蹂��닔媛�	
	@RequestMapping("member/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pw, Model model){ 
		//鍮꾨�踰덊샇 泥댄겕
		boolean result = joinService.checkPw(id,pw);
		if(result){
			//�궘�젣 泥섎━
			joinService.deleteMember(id);
			//�쉶�썝 紐⑸줉�쑝濡� �씠�룞
			return "redirect:/member/list.do";
		}else{
			//鍮꾨쾲�씠 ���졇�쓣 �븣
			model.addAttribute("message","鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
			model.addAttribute("vo", joinService.viewMember(id)); 
			// view.jsp濡� �룷�썙�뱶
			return "member/view"; 
		}		
		
	}
	
	@RequestMapping("member/mypage.do")
	public String mypage(@RequestParam  String id, Model model){
		
		logger.info("�겢由��븳 �븘�씠�뵒:"+id);
		model.addAttribute("vo", joinService.mypage(id));
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/upload/uploadAjax"
			, method=RequestMethod.GET)
	public void uploadAjax(){
		// uploadAjax.jsp濡� �룷�썙�뵫
	}
	
	
	
	

	@RequestMapping(value="/upload/uploadAjax"
		,method=RequestMethod.POST
		,produces="text/plan;charset=utf-8")
	public ResponseEntity<String> uploadAjax(
			MultipartFile file) throws Exception{
		logger.info(
"originalName:"+file.getOriginalFilename());
		logger.info("size:"+ file.getSize());
		logger.info(
				"contentType:"+ file.getContentType());
		
		return new ResponseEntity<String>( 
			UploadFileUtils.uploadFile(uploadPath
				,file.getOriginalFilename() 
				,file.getBytes())
				,HttpStatus.OK);
	}


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
	
	
}















