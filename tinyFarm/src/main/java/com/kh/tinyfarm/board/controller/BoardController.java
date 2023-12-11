package com.kh.tinyfarm.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tinyfarm.board.service.BoardService;
import com.kh.tinyfarm.board.vo.Board;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	//페이징처리한 boardList
	@RequestMapping("list.bo")
	//@GetMapping("list.bo")
	public String selectBoardList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,Model model) {
			
		//총 게시글 리스트 개수 가져오기
		int listCount = boardService.boardListCount();
		
		int boardLimit = 5;
		int pageLimit = 5;
		
		
		PageInfo pi= Pagination.getPageInfo(listCount,currentPage,boardLimit,pageLimit);
		ArrayList<Board> blist = boardService.selectBoardList(pi);
				
		model.addAttribute("pi", pi);
		model.addAttribute("blist",blist);
		
		return "board/boardList";
	}
	
	@RequestMapping("detail.bo")
	public String boardDetail(int boardNo,Model model) {
		//조회수 증가랑 bno넘겨서 detail정보 가져오기 그 후 가져온 객체를 detailview에 보내기
		int result = boardService.boardIncreaseCount(boardNo);
		
		if(result>0) {
			Board boardInfo = boardService.boardDetail(boardNo);
			model.addAttribute("boardInfo", boardInfo);
			//System.out.println("boardInfo : "+boardInfo);
			
		}else {
			return "common/errorPage";
		}
		
		return "board/boardDetail";
	}
	
	@GetMapping("insert.bo")
	public String moveBoardEnroll() {
		return "board/boardEnroll";
	}
	
	
	@PostMapping("insert.bo")
	public String boardInsert(Board b,HttpSession session) {
		
		//System.out.println("board 객체: "+b);
		
		int result = boardService.insertBoard(b);
		
	
		
		return "board/boardList";
	}
	
	@GetMapping("update.bo")
	public String moveBoardUpdate(int boardNo) {
		System.out.println();
		
		return "board/boardUpdate";
	}
	
	
	public String boardUpdate(Board b) {
		
		return "";
	}
	
	
	
	
	
	
	/*
	@RequestMapping(value="insert.bo")
	public String insertBoard(MultipartHttpServletRequest mtfRequest,Board b,HttpSession session) {
		
		//if문으로 파일첨부가 있다면 실시하기
		List<MultipartFile> fileList = (List<MultipartFile>) mtfRequest.getFile("file");
		System.out.println("fileList : "+fileList);
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : "+src);
		
		String path = "C:\\image\\";
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			
			System.out.println("originFileName : "+originFileName);
			System.out.println("fileSize : "+fileSize);
			
			String safeFile = path + System.currentTimeMillis()+originFileName;
		
			
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			int result = boardService.insertBoard(b,fileList);
					
			if(result>0) {
				session.setAttribute("alertMsg", "성공");
				return "redirect:list.bo";
			}else {
				session.setAttribute("alrtMsg", "실패");
				return "common/errorPage";
			}
		
	
		
		
		
		
	}
	*/
	
	
	
	/*
	
	@PostMapping("insert.bo")
	public String boardInsert(Board b,MultipartFile upfile,HttpSession session) {
		
		System.out.println("board 객체: "+b);
		System.out.println("upfile : "+upfile);
		ArrayList<Attachment> list =new ArrayList<Attachment>();
		
		//System.out.println("zzzz : "+upfile.getOriginalFilename()); 없으면 빈칸으로 넘어옴
		MultipartRequest multiRequest = new MultipartRequest(saveChangeFile(upfile,session));
		
		for(int i=1;i<4;i++) {
			
			
			if(!upfile.getOriginalFilename().equals("")) {
				String changeName = saveChangeFile(upfile,session);
				b.setOriginName(upfile.getOriginalFilename());
				b.setChangeName("resources/uploadFiles/"+changeName);
			}
			
		}
		
		int result = boardService.insertBoard(b);
		
		if(result>0) {
			
		}else {
			
		}
		
		return "";
	}
	
	
	
	
	//파일저장하면서 이름바꾸기
	public String saveChangeFile(MultipartFile upfile,HttpSession session) {
		System.out.println("upfile이 제대로 넘어왔는지 확인 : "+upfile.getOriginalFilename());
		
		String originName = upfile.getOriginalFilename();
		System.out.println("originName : "+originName);
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		System.out.println("currentTime : "+currentTime);
		int randomNum = (int)(Math.random()*90000+10000);
		System.out.println("randomNum : "+randomNum);
		String ext = originName.substring(originName.lastIndexOf("."));
		System.out.println("ext : "+ext);
		String changeName = currentTime+randomNum+ext;
		
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
		System.out.println("savePath : "+savePath);
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return changeName;
	}
	
	
*/
	
	
	
}
