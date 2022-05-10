$(document).ready(function(){
	$(".add-to-cart").click(function(){
		ajaxGet($("#spid").text());
	});

	function ajaxGet(id){
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

				$("#notification-success").fadeIn(500).text('Thêm sản phẩm thành công');				
			    $("#notification-success").fadeOut(1000);
				}	
			},
			error : function(e){
				$("#notification-fail").fadeIn(500).text('Error' + e);				
			    $("#notification-fail").fadeOut(1000);
			    console.log("Error" , e );
			}
		});
	}
})
