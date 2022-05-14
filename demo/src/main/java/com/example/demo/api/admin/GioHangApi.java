package com.example.demo.api.admin;

import java.io.Console;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.entities.ChiMucGioHang;
import com.example.demo.entities.GioHang;
import com.example.demo.entities.NguoiDung;
import com.example.demo.entities.ResponseObject;
import com.example.demo.entities.SanPham;
import com.example.demo.service.ChiMucGioHangService;
import com.example.demo.service.GioHangService;
import com.example.demo.service.NguoiDungService;
import com.example.demo.service.SanPhamService;

@RestController
@RequestMapping("api/gio-hang")
@SessionAttributes("loggedInUser")
public class GioHangApi {

	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@GetMapping("/addSanPham")
	public ResponseObject addToCart(@RequestParam String id, HttpServletRequest request, HttpServletResponse response) {
		ResponseObject ro = new ResponseObject();
		SanPham sp = sanPhamService.getSanPhamById(Long.parseLong(id));
		int soLuong = 0;
		if (sp.getDonViKho() == 0) {
			ro.setStatus("false");
			return ro;
		}
		NguoiDung currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		// Cookie dung de luu so luong
		if (auth == null || auth.getPrincipal() == "anonymousUser") // Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			boolean found = false;
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals("soLuong")) {
					soLuong = Integer.parseInt(clientCookies[i].getValue());
					break;
				}
			}
			for (int i = 0; i < clientCookies.length; i++) {

				if (clientCookies[i].getName().equals(id)) // Neu san pham da co trong cookie tang so luong them 1
				{
					clientCookies[i].setValue(Integer.toString(Integer.parseInt(clientCookies[i].getValue()) + 1));
					clientCookies[i].setPath("/lazapee");
					clientCookies[i].setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(clientCookies[i]);
					soLuong++;
					found = true;
					break;
				}
			}
			if (!found) // Neu san pham ko co trong cookie,them vao cookie
			{
				Cookie c = new Cookie(id, "1");
				c.setPath("/lazapee");
				c.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(c);
				soLuong++;
			}
			Cookie cookieSoLuong = new Cookie("soLuong", soLuong + "");
			response.addCookie(cookieSoLuong);
		} else { // Su dung database de luu
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			if (g == null) {
				g = new GioHang();
				g.setSo_luong(0);
				g.setNguoiDung(currentUser);
				g = gioHangService.save(g);
			}

			ChiMucGioHang c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp, g);
			if (c == null) // Neu khong tim chi muc gio hang, tao moi
			{
				System.out.println(g.getNguoiDung().getEmail());
				System.out.println(g.getId());
				c = new ChiMucGioHang();
				c.setGioHang(g);
				c.setSanPham(sp);
				c.setSo_luong(1);
				g.setSo_luong(g.getSo_luong() + 1);
			} else // Neu san pham da co trong database tang so luong them 1
			{
				c.setSo_luong(c.getSo_luong() + 1);
				g.setSo_luong(g.getSo_luong() + 1);
			}
			c = chiMucGioHangService.saveChiMucGiohang(c);
//			quantity = chiMucGioHangService.findSoLuongBySanPhamAndGioHang(sp, g);
		}
		ro.setStatus("success");
		return ro;
	}

	@GetMapping("/changSanPhamQuanity")
	public ResponseObject changeQuanity(@RequestParam String id, @RequestParam String value, HttpServletRequest request,
			HttpServletResponse response) {
		NguoiDung currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		ResponseObject ro = new ResponseObject();
		if (auth == null || auth.getPrincipal() == "anonymousUser") // Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			int soLuong = 0;
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals("soLuong")) {
					soLuong = Integer.parseInt(clientCookies[i].getValue());
					break;
				}
			}
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals(id)) {
					clientCookies[i].setValue(value);
					clientCookies[i].setPath("/lazapee");
					clientCookies[i].setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(clientCookies[i]);
					// reset so luong san pham trong gio hang
					int soLuongCu = Integer.parseInt(clientCookies[i].getValue());
					int soLuongMoi = Integer.parseInt(value);
					if (soLuongCu > soLuongMoi) {
						soLuong --;
					} else {
						soLuong ++;
					}
					break;
				}
			}
			Cookie cookieSoLuong = new Cookie("soLuong", soLuong + "");
			response.addCookie(cookieSoLuong);
		} else // Su dung database de luu
		{
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			SanPham sp = sanPhamService.getSanPhamById(Long.parseLong(id));
			ChiMucGioHang c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp, g);
			// Thay doi so luong san pham trong gio
			int soLuongCu = c.getSo_luong();
			int soLuongMoi = Integer.parseInt(value);
			if (soLuongMoi > soLuongCu) {
				int chenhLech = soLuongMoi - soLuongCu;
				g.setSo_luong(g.getSo_luong() + chenhLech);
			} else {
				int chenhLech = soLuongCu - soLuongMoi;
				g.setSo_luong(g.getSo_luong() - chenhLech);
			}
			c.setSo_luong(Integer.parseInt(value));
			c = chiMucGioHangService.saveChiMucGiohang(c);
		}
		ro.setStatus("success");
		return ro;
	}

	@GetMapping("/deleteFromCart")
	public ResponseObject deleteSanPham(@RequestParam String id, HttpServletRequest request,
			HttpServletResponse response) {
		NguoiDung currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		ResponseObject ro = new ResponseObject();
		if (auth == null || auth.getPrincipal() == "anonymousUser") // Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			int soLuong = 0;
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals("soLuong")) {
					soLuong = Integer.parseInt(clientCookies[i].getValue());
				}
			}
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals(id)) {
					clientCookies[i].setMaxAge(0);
					clientCookies[i].setPath("/lazapee");
					System.out.println(clientCookies[i].getMaxAge());
					response.addCookie(clientCookies[i]);
					int soLuongXoa = Integer.parseInt(clientCookies[i].getValue());
					soLuong -= soLuongXoa;
					break;
				}
			}
			Cookie cookieSoLuong = new Cookie("soLuong", soLuong + "");
			response.addCookie(cookieSoLuong);
		} else // Su dung database de luu
		{
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			SanPham sp = sanPhamService.getSanPhamById(Long.parseLong(id));
			ChiMucGioHang c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp, g);
			g.setSo_luong(g.getSo_luong() - c.getSo_luong());
			chiMucGioHangService.deleteChiMucGiohang(c);
		}

		ro.setStatus("success");
		return ro;
	}

	@GetMapping("/getSanPhamQuatity")
	public ResponseObject getQuanity(HttpServletRequest request, HttpServletResponse response) {
		int quantity = 0;
		NguoiDung currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		ResponseObject ro = new ResponseObject();
		if (auth == null || auth.getPrincipal() == "anonymousUser") // Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			for (int i = 0; i < clientCookies.length; i++) {
				if (clientCookies[i].getName().equals("soLuong")) // Neu san pham da co trong cookie tang so luong them														// 1
				{
					quantity = Integer.parseInt(clientCookies[i].getValue());
					break;
				}
			}
		} else // Su dung database de luu
		{
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			quantity = g.getSo_luong();
		}
		ro.setStatus("success");
		ro.setData(quantity);
		return ro;
	}
}
