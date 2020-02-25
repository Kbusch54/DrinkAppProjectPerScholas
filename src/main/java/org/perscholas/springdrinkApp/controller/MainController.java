/**
 * 
 */
package org.perscholas.springdrinkApp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.perscholas.springdrinkApp.entity.Account;
import org.perscholas.springdrinkApp.JpsRepository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author kevinbusch
 *
 */

@Controller
public class MainController {
	@Autowired
	private AccountRepository acc;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		List<Account> account = acc.findAll();
		for (Account accL : account) {
			System.out.println(accL);
			System.out.println(accL.getId());
		}
		mav.addObject("greeting", account);
		return mav;
	}

	@PostMapping("/signIn")
	public ModelAndView signIn(HttpSession session,@RequestParam(name = "userName") String username,
			@RequestParam(name = "password") String password) {
		ModelAndView mav = new ModelAndView();
		if (username != null && password != null) {
			if (acc.findByUserNameAndPassword(username, password) != null) {
				ModelAndView av = new ModelAndView("main");
				Account user = acc.findByUserNameAndPassword(username, password);
				mav.addObject("userM", user);
				session.setAttribute("user", user);
				System.out.println(session.getAttribute("user").toString());
				return av;
			} else {
				ModelAndView mv = new ModelAndView("index");
				String message = "Password or Username is not correct!";
				mv.addObject("msg", message);
				return mv;
			}
		}
		return mav;
	}

	@RequestMapping(value = "/createAccount")
	public ModelAndView newAccount() {
		ModelAndView mav = new ModelAndView("signUp");
		return mav;
	}

	@PostMapping("/newAccount")
	public ModelAndView newUser(@RequestParam("userName") String userName, @RequestParam("password") String password,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView("signUp");
		if(userName == null || password == null || firstName == null || lastName == null || email == null) {
			
			mav.addObject("msg", "Some of the fields have been left blank");
			return mav;
			
		}
		if (userName != null && password != null && firstName != null && lastName != null && email != null) {
			if (acc.existsByUserNameAndPassword(userName, password)) {
				ModelAndView mv = new ModelAndView("signUp");
				mv.addObject("msg",
						"Seems like you already have an account with us just sign in as you norammly would");
				return mv;
			}
			if (acc.existsByUserName(userName)) {
				ModelAndView mv = new ModelAndView("signUp");
				mv.addObject("msg", "Sorry looks like someome already has that UserName");
				return mv;
			}
			if (acc.existsByEmail(email)) {
				ModelAndView mv = new ModelAndView("signUp");
				mv.addObject("msg", "Sorry looks like that email is already associated with an account");
				return mv;
			}
			if (!acc.existsByEmail(email) && !acc.existsByUserName(userName)) {
				Account user = new Account();
				user.setUserName(userName);
				user.setPassword(password);
				user.setEmail(email);
				user.setFirst_Name(firstName);
				user.setLName(lastName);
				acc.save(user);
				ModelAndView nmv = new ModelAndView("main");
				return nmv;
			}
		}
		return mav;
	}

}
