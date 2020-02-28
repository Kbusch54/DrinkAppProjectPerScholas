package org.perscholas.springdrinkApp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.JpsRepository.AlcoholRepository;
import org.perscholas.springdrinkApp.JpsRepository.CommentRepository;
import org.perscholas.springdrinkApp.JpsRepository.LikeRepository;
import org.perscholas.springdrinkApp.JpsRepository.StarRepository;
import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.entity.Alcohol;
import org.perscholas.springdrinkApp.entity.Comment;
import org.perscholas.springdrinkApp.entity.Like;
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
	
	@Autowired
	private LikeRepository lkr;
	
	@RequestMapping("/searchMain")
	public ModelAndView searchAll(@RequestParam("alcohol")String name, HttpSession session) {
		ModelAndView mav = new ModelAndView("results");
		//repository query find alcohol by name similar to
		List<Alcohol> alcohol = alc.findByNameLKeyword(name);
		//adding list of object to view
		mav.addObject("alc", alcohol);
		//getting session
		Account user = (Account)session.getAttribute("user");
		//getting user ratings
		List<Star> star = user.getStars();
		Map<Long,Integer> userStar = new HashMap<Long,Integer>();
		int starNumber = 0;
		Long alcoholId = (long) 0;
		for (Star star2 : star) {
			//getting number of star rating made by user
			starNumber = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getNumber();
			// getting alcohol Id of user star ratings made
			alcoholId = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getAlcoholId();
			//putting both into hash map 
			userStar.put(alcoholId, starNumber);
		}
		//adding object into view
		mav.addObject("star", userStar);

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
		//star ratings for current user
		List<Star> star = acc.getStars();
		System.out.println(star.get(0));
		for (Star star2 : star) {
			System.out.println(star2);
		}
	}
	@GetMapping("/addLike")
	public void addLike(@RequestParam("alchId")Long id, HttpSession session) {
		Like like = new Like();
		like.setAlcoholId(id);
		Account acc = new Account();
		acc = (Account)session.getAttribute("user");
		like.setUserId(acc.getId());
		lkr.save(like);
	}

}
