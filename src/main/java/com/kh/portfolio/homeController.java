package com.kh.portfolio;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
public class homeController {


	@GetMapping("/")
	public String welcome() {
		
		return "index";
	}
	
	@GetMapping("/bookList")
	public String bookListForm() {
		return "/book/bookList";
	}
}
