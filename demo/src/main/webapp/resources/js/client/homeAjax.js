function addToCart(id)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/lazapee/api/gio-hang/addSanPham?id="+id,
			success: function(result){
				if(result.status == "false")
				{
					$("#notification-fail").fadeIn(500).text('Thêm sản phẩm không thành công');				
			        $("#notification-fail").fadeOut(1000);
				}else
				{
					$("#notification-success").fadeIn(500).text('Sản phẩm đã được thêm vào giỏ hàng');				
			        $("#notification-success").fadeOut(1000);
			        countQuantity();
				}		
			},
			error : function(e){
				$("#notification-fail").fadeIn(500).text('Error' + e);				
			    $("#notification-fail").fadeOut(1000);
			    console.log("Error" , e );
			}
		});
	}
	
function countQuantity()
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/lazapee/api/gio-hang/getSanPhamQuatity",
			success: function(result){	
					$("#quantityOfCart").html(result.data);					
			},
			error : function(e){
				$("#notification-fail").fadeIn(500).text('Error' + e);				
			    $("#notification-fail").fadeOut(1000);
			    console.log("Error" , e );
			}
		});
	}

$(document).ready(function(){
	ajaxGet();
	countQuantity();
	function ajaxGet(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/lazapee/api/san-pham/products",
			success: function(result){
				var content;
				var section = '<div class="section group">';
				var endsection = '</div>'+'<br>';
				$.each(result, function(i, sanpham){
					
					if(i != result.length-1)
					{
						if(i%4==0)
						{
							content = '';
							content = '<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/lazapee/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
						}else 
						{
							content = content +'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/lazapee/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3><a/>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							if(i%4==3)
							{
								content = section + content + endsection;
								$('.content-grids').append(content);
							}				
						}
					}else
					{
						if(i%4==0)
						{
							content = '';
							content = '<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/lazapee/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3>></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							content = section + content + endsection;
							$('.content-grids').append(content);
						}else
						{
							content = content+'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/lazapee/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button  onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							content = section + content + endsection;
							$('.content-grids').append(content);
						}
					}
				});
			},
			error : function(e){
				$("#notification-fail").fadeIn(500).text('Erro' + e);				
			    $("#notification-fail").fadeOut(1000);
			    console.log("Error" , e );
			}
		});
	}
})
