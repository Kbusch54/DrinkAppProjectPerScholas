/**
 * 
 */
package org.perscholas.springdrinkApp.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.JpsRepository.AccountRepository;
import org.perscholas.springdrinkApp.JpsRepository.AlcoholRepository;
import org.perscholas.springdrinkApp.JpsRepository.LikeRepository;
import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.entity.Alcohol;
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
	private AlcoholRepository alc;
	
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
//		if(aa.getLikes()!=null) {
//		List<Long> alch = alc.findLikesOfUserById(id);
//		Optional<Alcohol> alcohol = null;
//		for (Long alcho : alch) {
//			alcohol = alc.findById(alcho);
//		
//		}
//		mav.addObject("alcohol", alcohol);
//		}
		
	}
		return mav;
	}
	@RequestMapping("/userOwn")
	public ModelAndView userOwn(HttpSession session) {
		ModelAndView mav = new ModelAndView("user");
		Account aa = (Account)session.getAttribute("user");
		
		System.out.println(aa.getUser_Name());
		mav.addObject("account", aa);
		return mav;
	}
	@RequestMapping("/favorites")
	public ModelAndView favorites(@RequestParam("id")Long id) {
	ModelAndView mav = new ModelAndView("favorites");
	List<Like> likes = lkr.findByuserId(id);
	mav.addObject("like", likes);
	return mav;
	}
	@RequestMapping("/favOwn")
	public ModelAndView favoritesOwn(HttpSession session) {
		ModelAndView mav = new ModelAndView("favorites");
		Account aa = (Account)session.getAttribute("user");
		List<Like> likes = lkr.findByuserId(aa.getId());
		mav.addObject("like", likes);
		return mav;
		}
	@RequestMapping("/addAlcohol")
	public ModelAndView addAlc() {
		ModelAndView mav = new ModelAndView("addAlcohol");
		return mav;
	}
}
