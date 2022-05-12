package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.entities.ChiMucGioHang;
import com.example.demo.entities.GioHang;
import com.example.demo.entities.SanPham;

public interface ChiMucGioHangRepository extends JpaRepository<ChiMucGioHang, Long>{
	
	ChiMucGioHang findBySanPhamAndGioHang(SanPham sp,GioHang g);
	
	List<ChiMucGioHang> findByGioHang(GioHang g);
	
//	@Query("select sum(so_luong) from chi_muc_gio_hang where ma_gio_hang = :ma_gio_hang group by ma_gio_hang")
	int findSoLuongBySanPhamAndGioHang(SanPham sp,GioHang g);
}
