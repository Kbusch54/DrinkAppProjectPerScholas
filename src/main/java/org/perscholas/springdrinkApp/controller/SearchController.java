package org.perscholas.springdrinkApp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.JpsRepository.AccountRepository;
import org.perscholas.springdrinkApp.JpsRepository.AlcoholRepository;
import org.perscholas.springdrinkApp.JpsRepository.CategoryRepository;
import org.perscholas.springdrinkApp.JpsRepository.CommentRepository;
import org.perscholas.springdrinkApp.JpsRepository.LikeRepository;
import org.perscholas.springdrinkApp.JpsRepository.StarRepository;
import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.entity.Alcohol;
import org.perscholas.springdrinkApp.entity.Category;
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

	@Autowired
	private CategoryRepository ctr;

	@Autowired
	private AccountRepository acc;

	@RequestMapping("/alcoholSelect")
	public ModelAndView alcSelect(@RequestParam("alcId") Long id, HttpSession session) {
		ModelAndView mav = new ModelAndView("alcohol");
		Optional<Alcohol> alcohol = alc.findById(id);
		Alcohol alc =alcohol.get();
		mav.addObject("alcohol", alc);
		// getting session
		Account user = (Account) session.getAttribute("user");
		return mav;
//		
//		//category by alcohol Id
//		Category cat = new Category();
//		Map<Long, String> categ = new HashMap<>();
//		
//			
//			cat = ctr.findByAlcoholId(alcohol.get().getId());
//			if(ctr.findByAlcoholId(alcohol.get().getId())!=null) {
//			categ.put(alcohol.get().getId(), cat.getName());
//			
//			
//		}
//		mav.addObject("cate", categ);
//		
//		//comment grab
//		ArrayList<Comment> com = new ArrayList<>();
//		List<String> comText = new ArrayList<>();
//		List<String> comUN = new ArrayList<>();
//		List<Comment> comm = new ArrayList<>();
//		Map<Long, List<String>> commentText = new HashMap<>();
//		Map<Long, List<String>> commentUserName = new HashMap<>();
//		Map<Long, List<Comment>> comment = new HashMap<>();
//		
//			com = (cmr.findByalcoholId(alcohol.get().getId()));
//			for (Comment com2 : com) {
//				comText.add(com2.getText());
//				commentText.put(com2.getAlcohol().getId(), comText);
//				comUN.add(acc.findById(com2.getUserId()).get().getUser_Name());
//				commentUserName.put(com2.getAlcoholId(), comUN);
//				
//				comm.add(com2);
//				
//				comment.put(com2.getAlcoholId(), comm);
//			}
//		
//		mav.addObject("commentText", commentText);
//		mav.addObject("commentUN", commentUserName);
//		mav.addObject("comments", comment);		
//				
//		//For user like true or false
//		List<Like> likes = user.getLikes();
//		Map<Long, Integer> userLike = new HashMap<Long, Integer>();
//		int like = 0;
//		Long alcId = (long) 0;
//		for (Like like2 : likes) {
//			//checking if user liked alcohol
//			if(lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId())!=null) {
//				//if yes then like num is 1
//				like=1;
//			}
//			//getting alcohol id of like
//			alcId = lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId()).getAlcoholId();
//			//adding to hash map
//			userLike.put(alcId, like);
//		}
//		//adding object to view
//		mav.addObject("like", userLike);
//
//		//getting user ratings
//		List<Star> star = user.getStars();
//		Map<Long,Integer> userStar = new HashMap<>();
//		int starNumber = 0;
//		Long alcoholId = (long) 0;
//		for (Star star2 : star) {
//			//getting number of star rating made by user
//			starNumber = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getNumber();
//			// getting alcohol Id of user star ratings made
//			alcoholId = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getAlcoholId();
//			//putting both into hash map 
//			userStar.put(alcoholId, starNumber);
//		}
//		//adding object into view
//		mav.addObject("star", userStar);
//
//		return mav;

	}

	@RequestMapping("/searchMain")
	public ModelAndView searchAll(@RequestParam("alcohol") String name, HttpSession session) {
		ModelAndView mav = new ModelAndView("results");
		// repository query find alcohol by name similar to
		List<Alcohol> alcohol = alc.findByNameLKeyword(name);
		// adding list of object to view
		mav.addObject("alc", alcohol);
		// getting session
		Account user = (Account) session.getAttribute("user");

		// category by alcohol Id
		Category cat = new Category();
		Map<Long, String> categ = new HashMap<>();
		for (Alcohol alcohol2 : alcohol) {

			cat = ctr.findByAlcoholId(alcohol2.getId());
			if (ctr.findByAlcoholId(alcohol2.getId()) != null) {
				categ.put(alcohol2.getId(), cat.getName());
			}

		}
		mav.addObject("cate", categ);

		// comment grab
		ArrayList<Comment> com = new ArrayList<>();
		List<String> comText = new ArrayList<>();
		List<String> comUN = new ArrayList<>();
		List<Comment> comm = new ArrayList<>();
		Map<Long, List<String>> commentText = new HashMap<>();
		Map<Long, List<String>> commentUserName = new HashMap<>();
		Map<Long, List<Comment>> comment = new HashMap<>();
		for (Alcohol alcohol2 : alcohol) {
			com = (cmr.findByalcoholId(alcohol2.getId()));
			for (Comment com2 : com) {
				comText.add(com2.getText());
				commentText.put(com2.getAlcohol().getId(), comText);
				comUN.add(acc.findById(com2.getUserId()).get().getUser_Name());
				commentUserName.put(com2.getAlcoholId(), comUN);

				comm.add(com2);

				comment.put(com2.getAlcoholId(), comm);
			}
		}
		mav.addObject("commentText", commentText);
		mav.addObject("commentUN", commentUserName);
		mav.addObject("comments", comment);

		// For user like true or false
		List<Like> likes = user.getLikes();
		Map<Long, Integer> userLike = new HashMap<Long, Integer>();
		int like = 0;
		Long alcId = (long) 0;
		for (Like like2 : likes) {
			// checking if user liked alcohol
			if (lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId()) != null) {
				// if yes then like num is 1
				like = 1;
			}
			// getting alcohol id of like
			alcId = lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId()).getAlcoholId();
			// adding to hash map
			userLike.put(alcId, like);
		}
		// adding object to view
		mav.addObject("like", userLike);

		// getting user ratings
		List<Star> star = user.getStars();
		Map<Long, Integer> userStar = new HashMap<>();
		int starNumber = 0;
		Long alcoholId = (long) 0;
		for (Star star2 : star) {
			// getting number of star rating made by user
			starNumber = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getNumber();
			// getting alcohol Id of user star ratings made
			alcoholId = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getAlcoholId();
			// putting both into hash map
			userStar.put(alcoholId, starNumber);
		}
		// adding object into view
		mav.addObject("star", userStar);

		return mav;
	}

	@RequestMapping("/addAlcohol")
	public void addAlc(@RequestParam("name") String name, @RequestParam("type") String type,
			@RequestParam("description") String description, @RequestParam("pic") String pic, HttpSession session) {
		Alcohol alch = new Alcohol();
		alch.setName(name);
		alch.setType(type);
		alch.setDescription(description);
		if (pic != null) {
			alch.setPic(pic);
		} else {
			alch.setPic(null);
		}
		Account acco = (Account) session.getAttribute("user");
		if (acco != null) {
			System.out.println(acco.getId());
			alch.setUserId(acco.getId());
		}
		alc.save(alch);
	}

	@GetMapping("/addComment")
	public void addCom(@RequestParam("text") String text, @RequestParam("alchId") Long alchId, HttpSession session) {
		// comment set
		Comment com = new Comment();
//		Long alcoholId = Long.parseLong(alchId);
		com.setAlcoholId(alchId);
		com.setText(text);
		Account acc = new Account();
		acc = (Account) session.getAttribute("user");
		Long userId = acc.getId();
		com.setUserId(userId);
		cmr.save(com);
		// star ratings for current user
		List<Star> star = acc.getStars();
		System.out.println(star.get(0));
		for (Star star2 : star) {
			System.out.println(star2);
		}
	}

	@GetMapping("/addLike")
	public void addLike(@RequestParam("alchId") Long id, HttpSession session) {
		Like like = new Like();
		like.setAlcoholId(id);
		Account acc = new Account();
		acc = (Account) session.getAttribute("user");
		if (lkr.findByuserIdAndAlcoholId(acc.getId(), id) == null) {
			like.setUserId(acc.getId());
			lkr.save(like);
		} else {
			System.out.println("already liked");
		}
	}

	@RequestMapping("/categorySearch")
	public ModelAndView serachCat(@RequestParam("catName") String name, HttpSession session) {
		ModelAndView mav = new ModelAndView("results");
		// repository query find alcohol by name similar to
		List<Alcohol> alcohol = alc.findByCatName(name);
		// adding list of object to view
		mav.addObject("alc", alcohol);
		// getting session
		Account user = (Account) session.getAttribute("user");

		// category by alcohol Id
		Category cat = new Category();
		Map<Long, String> categ = new HashMap<>();
		for (Alcohol alcohol2 : alcohol) {

			cat = ctr.findByAlcoholId(alcohol2.getId());
			if (ctr.findByAlcoholId(alcohol2.getId()) != null) {
				categ.put(alcohol2.getId(), cat.getName());
			}

		}
		mav.addObject("cate", categ);

		// comment grab
		ArrayList<Comment> com = new ArrayList<>();
		List<String> comText = new ArrayList<>();
		List<String> comUN = new ArrayList<>();
		List<Comment> comm = new ArrayList<>();
		Map<Long, List<String>> commentText = new HashMap<>();
		Map<Long, List<String>> commentUserName = new HashMap<>();
		Map<Long, List<Comment>> comment = new HashMap<>();
		for (Alcohol alcohol2 : alcohol) {
			com = (cmr.findByalcoholId(alcohol2.getId()));
			for (Comment com2 : com) {
				comText.add(com2.getText());
				commentText.put(com2.getAlcohol().getId(), comText);
				comUN.add(acc.findById(com2.getUserId()).get().getUser_Name());
				commentUserName.put(com2.getAlcoholId(), comUN);

				comm.add(com2);

				comment.put(com2.getAlcoholId(), comm);
			}
		}
		mav.addObject("commentText", commentText);
		mav.addObject("commentUN", commentUserName);
		mav.addObject("comments", comment);

		// For user like true or false
		List<Like> likes = user.getLikes();
		Map<Long, Integer> userLike = new HashMap<Long, Integer>();
		int like = 0;
		Long alcId = (long) 0;
		for (Like like2 : likes) {
			// checking if user liked alcohol
			if (lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId()) != null) {
				// if yes then like num is 1
				like = 1;
			}
			// getting alcohol id of like
			alcId = lkr.findByuserIdAndAlcoholId(like2.getUserId(), like2.getAlcoholId()).getAlcoholId();
			// adding to hash map
			userLike.put(alcId, like);
		}
		// adding object to view
		mav.addObject("like", userLike);

		// getting user ratings
		List<Star> star = user.getStars();
		Map<Long, Integer> userStar = new HashMap<>();
		int starNumber = 0;
		Long alcoholId = (long) 0;
		for (Star star2 : star) {
			// getting number of star rating made by user
			starNumber = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getNumber();
			// getting alcohol Id of user star ratings made
			alcoholId = str.findByuserIdAndAlcoholId(star2.getUserId(), star2.getAlcoholId()).getAlcoholId();
			// putting both into hash map
			userStar.put(alcoholId, starNumber);
		}
		// adding object into view
		mav.addObject("star", userStar);

		return mav;
	}

}
