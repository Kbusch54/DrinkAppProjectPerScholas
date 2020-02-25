package org.perscholas.springdrinkApp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.JpsRepository.AlcoholRepository;
import org.perscholas.springdrinkApp.JpsRepository.CommentRepository;
import org.perscholas.springdrinkApp.JpsRepository.StarRepository;
import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.entity.Alcohol;
import org.perscholas.springdrinkApp.entity.Comment;
import org.perscholas.springdrinkApp.entity.Star;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author kevinbusch
 *
 */
@Controller
public class SearchController {
	@Autowired
	private AlcoholRepository alc;

	@Autowired 
	private CommentRepository cmr;
	
	@Autowired
	private StarRepository str;
	
	@RequestMapping("/searchMain")
	public ModelAndView searchAll(@RequestParam("alcohol")String name, HttpSession session) {
		ModelAndView mav = new ModelAndView("results");
		List<Alcohol> alcohol = alc.findByNameLKeyword(name);
		mav.addObject("alc", alcohol);
		
		Account user = (Account)session.getAttribute("user");
		List<Star> star = user.getStars();
		Map<Long,Integer> userStar = new HashMap<Long, Integer>();
		int starNumber =0;
		Long alcoholId = (long) 0;
		for (Star star2 : star) {
			starNumber = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getNumber();
			alcoholId = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getAlcoholId();
			userStar.put(alcoholId, starNumber);
		}
		mav.addObject("star", userStar);

		return mav;
	}
	@RequestMapping("/searchAgain")
	public ModelAndView searchAgain(@RequestParam("alcohol")String name, HttpSession session) {
		ModelAndView mav = new ModelAndView("results");
		List<Alcohol> alcohol = alc.findByNameLKeyword(name);
		mav.addObject("alc", alcohol);
		return mav;
	}
	
	@RequestMapping("/addAlcohol")
	public void addAlc(@RequestParam("name")String name, @RequestParam("type")String type, 
		@RequestParam("description")String description, @RequestParam("pic")String pic, HttpSession session) {
		Alcohol alch = new Alcohol();
		alch.setName(name);
		alch.setType(type);
		alch.setDescription(description);
		if(pic!=null) {
		alch.setPic(pic);
		}else {
			alch.setPic(null);
		}
		Account acco = (Account) session.getAttribute("user");
		if(acco!=null) {
		System.out.println(acco.getId());
		alch.setUserId(acco.getId());
		}
		alc.save(alch);	
	}
	@GetMapping("/addComment")
	public void addCom(@RequestParam("text")String text, @RequestParam("alchId")Long alchId, HttpSession session) {
		//comment set
		Comment com = new Comment();
//		Long alcoholId = Long.parseLong(alchId);
		com.setAlcoholId(alchId);
		com.setText(text);
		Account acc = new Account();
		acc = (Account) session.getAttribute("user");
		Long userId = acc.getId();
		com.setUserId(userId);
		cmr.save(com);
		//star rating set
		List<Star> star = acc.getStars();
		System.out.println(star.get(0));
		for (Star star2 : star) {
			System.out.println(star2);
		}
	}

}
