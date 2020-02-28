/**
 * 
 */
package org.perscholas.springdrinkApp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.JpsRepository.AccountRepository;
import org.perscholas.springdrinkApp.JpsRepository.LikeRepository;
import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.entity.Like;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author kevinbusch
 *
 */
@Controller
public class UserController {

	@Autowired
	private AccountRepository acc;
	
	@Autowired
	private LikeRepository lkr;
	
	@RequestMapping("/userPage")
	public ModelAndView userPage(@RequestParam("id")Long id, HttpSession session) {
		//other user page of none current account
		ModelAndView mav = new ModelAndView("user");
		if(id!=null) {
		Account aa = acc.findByid(id);
		System.out.println(aa.getUser_Name());
		mav.addObject("account", aa);
		
		//user page 
		}else {
			Account ac = (Account) session.getAttribute("user");
			mav.addObject("account",ac);
		}
		return mav;
	}
	@RequestMapping("/favorites")
	public ModelAndView favorites(@RequestParam("id")Long id) {
	ModelAndView mav = new ModelAndView("favorites");
	List<Like> likes = lkr.findByuserId(id);
	mav.addObject("like", likes);
	return mav;
	}
	
}
