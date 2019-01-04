package com.abc.cakeonline.user.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abc.cakeonline.entity.Users;
import com.abc.cakeonline.user.service.UserServiceImpl;

@Controller
public class UserControl {
	@Resource
	private UserServiceImpl userService;

	/**
	 * ���������Ƿ���ȷ���ܷ�������¼
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkLogin")
	public void checkLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �����ַ�������
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("EmailAddress");
		String pwd = request.getParameter("password");
		Users user = userService.getUserByEmail(email);
		String result;
		if (pwd.equals(user.getPassword())) {
			result = "ok";
		} else {
			result = "fail";
		}
		JSONObject json = new JSONObject();

		json.put("result", result);
		json.put("nickname", user.getNickname());
		json.put("email", user.getEmail());
		// д������
		response.getWriter().print(json);

		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			session.setAttribute("user", user);
		}
	}

	/**
	 * �ж������Ƿ����
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/judgeUseEmail")
	public void judgeUseEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("EmailAddress");
		Users user = userService.getUserByEmail(email);
		if (user == null) {
			response.getWriter().print("ok");
		} else {
			response.getWriter().print("fail");
		}
	}

	/**
	 * �ж��ǳ��Ƿ����
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/judgeUseName")
	public void judgeUseName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		Users user = userService.getUserByNickName(name);
		if (user == null) {
			response.getWriter().print("ok");
		} else {
			response.getWriter().print("fail");
		}
	}

	@RequestMapping("/register")
	public String register(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("EmailAddress");
		String nickname = request.getParameter("NickName");
		String pwd = request.getParameter("password1");
		// ע��ɹ���������ҳ�����򣬷���ע��ҳ��
		if (userService.insertUser(email, nickname, pwd)) {
			Timestamp time = new Timestamp(System.currentTimeMillis());
			Users user = new Users();
			user.setEmail(email);
			user.setNickname(nickname);
			user.setPassword(pwd);
			user.setTime(time);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return "redirect:index.jsp";
		} else {
			return "redirect:account.jsp";
		}
	}
}
