<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	 <link rel="stylesheet" href="${ctp}/plugin/bootstrap-3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctp}/plugin/bootstrap-3.3.7/css/font-awesome.min.css">
	<link rel="stylesheet" href="${ctp}/plugin/bootstrap-3.3.7/css/main.css">
	
	
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

		<center><h1 style="color: red">Cellphone Information</h1></center><br/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input id="searchinput" style="width:500px" class="form-control has-success" value="${condition}" name="condition" type="text" placeholder="请输入查询条件,可通过id，价格，名称，颜色查找">
    </div>
  </div>
  <button type="button" id="searchbtn" class="btn btn-warning" ><i class="glyphicon glyphicon-search"></i>查询</button>
  <button id="backbtn" style="${empty tag==true?"display:none":"" }" type="button" id="backbtn" class="btn btn-success" ><i class="glyphicon glyphicon-backward"></i> 返回</button>
</form>
<button type="button" id="deletebtn" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<%-- ${relations[vt.index][vt2.index]==true?"checked":""} --%>
<button id="addbutton" type="button" class="btn btn-primary" style="float:right;"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <!-- <th width="30">#</th> -->
				  <th width="30"><input id="checkedAll" type="checkbox"></th>
                  <th>phone_id </th>
                  <th>phone_name</th>
                  <th>phone_price</th>
                  <th>phone_color</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${info.list}" var="phone">
              		<tr>
                <%--   <td>${phone.phoneId }</td> --%>
				  <td><input phoneid="${phone.phoneId}" class="checksingle check_one" type="checkbox"></td>
                  <td>${phone.phoneId}</td>
                  <td>${phone.phoneName }</td>
                  <td>${phone.phonePrice }</td>
                  <td>${phone.phoneColor }</td>
                  <td>
				      <button type="button" id="updatebtn" class="update btn btn-primary btn-xs">修改<i class=" glyphicon glyphicon-pencil"></i></button>
				  </td>
                </tr>
              	</c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="7" align="center">
						 <ul class="pagination">
												<!--  class="disabled" -->
												<li><a class="wunai" href="${ctp }/searchPhoneBycondition?page=${info.prePage}">上一页</a></li>
												<c:forEach items="${ info.navigatepageNums }" var="page">
													<c:if test="${ page == info.pageNum }">
														<li class="active"><a
															href="${ctp }/searchPhoneBycondition?page=${page}">${page} <span
																class="sr-only">(current)</span>
														</a></li>
													</c:if>
													<c:if test="${ page != info.pageNum }">
														<li><a class="wunai" href="${ctp }/searchPhoneBycondition?page=${page}">${ page }</a></li>
													</c:if>
												</c:forEach>

												<li><a class="wunai" href="${ctp }/searchPhoneBycondition?page=${info.nextPage}">下一页</a></li>
												
												<li class="active"><a>共${info.total}记录</a></li>

											</ul> 
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center><h4 class="modal-title" id="exampleModalLabel">添加手机</h4></center>
      </div>
      <div class="modal-body">
        <form id="form01" action="${ctp }/addphone">
          <div class="form-group">
            <label for="recipient-name" class="control-label">手机名称</label>
            <input type="text" name="phoneName" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">手机价格</label>
            <input type="text" name="phonePrice" class="form-control" id="recipient-price">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">手机颜色</label>
            <input type="text" name="phoneColor" class="form-control" id="recipient-color">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="confirmbtn" type="button" class="btn btn-primary">添加</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="updatePhone" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center><h4 class="modal-title" id="exampleModalLabel">修改手机</h4></center>
      </div>
      <div class="modal-body">
        <form id="form02" action="${ctp }/updatephone">
          <div class="form-group">
            <label for="recipient-name" class="control-label">手机名称</label>
            <input type="text" name="phoneName" class="form-control" id="recipient-name">
          </div>
          <input type="hidden" name="phoneId"/>
          <div class="form-group">
            <label for="message-text" class="control-label">手机价格</label>
            <input type="text" name="phonePrice" class="form-control" id="recipient-price">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">手机颜色</label>
            <input type="text" name="phoneColor" class="form-control" id="recipient-color">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="updatebtn01" type="button" class="btn btn-primary">修改</button>
      </div>
    </div>
  </div>
</div>



    <script src="${ctp }/script/jquery-2.1.1.min.js"></script>
    <script src="${ctp }/plugin/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctp }/layer/layer.js"></script>
	<!-- <script src="script/docs.min.js"></script> -->
        <script type="text/javascript">
            $(function(){
            	
           	 $("a").click(function(){
           		var href = $(this).attr("href");
           		href = href+"&condition="+$("#searchinput").val();
           		location.href = href;
           		return false;
           	}); 
            	
            	//alert("hhe");
            $("#addbutton").click(function(){
            	
            	$("#exampleModal").modal('show');
            	return false;
            	
            });
            $("#searchbtn").click(function(){
            	if($.trim($("#searchinput").val())==""){
            		layer.msg("请输入查询条件");
            	}else{
            		var condition = $("#searchinput").val();
            		location.href = "${ctp}/searchPhoneBycondition?condition="+condition;
            	}
            	
            	
            });
            
            $("#backbtn").click(function(){
            	location.href = "${ctp}/getAllPhone"
            });
            
				
           /* 	$("#confirmbtn").on("click",function(){
           		//发起ajax请求
           		$("#form01").submit();
           		$("#exampleModal").modal('hide');
           	}) */
            	
           		$("body").on("click","#confirmbtn",function(){
           		//发起ajax请求
           		$("#form01").submit();
           		$("#exampleModal").modal('hide');
           	})
           	
           	
           	$(".update").click(function(){
           		var id = $(this).parents("tr").find("td").first().find("input").attr("phoneid");
           		var phoneName = $(this).parents("tr").find("td").eq(2).text();
           		var phonePrice = $(this).parents("tr").find("td").eq(3).text();
           		var phoneColor = $(this).parents("tr").find("td").eq(4).text();
           		$("#form02").find(":input").eq(0).val(phoneName);
       			$("#form02").find("input").eq(1).val(id);
       			$("#form02").find(":input").eq(2).val(phonePrice);
       			$("#form02").find(":input").eq(3).val(phoneColor);
       			$("#updatePhone").modal("show");     		
           		$("body").on("click","#updatebtn01",function(){
					$("#form02").submit();
           			$("#updatePhone").modal("hide");
           		});
           		
           		
           	});
           	
           	$("#deletebtn").click(function(){
           		
           		if ($(":checked").length != 0) {
           		//alert("请选择用户！");
           			layer.confirm("您确定要删除吗？",function(){
           				
           				//判断选中的是一个还是多个
           				if ($(":checked").length ==1){
           					var phoneid = $(":checked").attr("phoneid");
                    		 location.href = "${ctp}/deletePhone?id="+phoneid;
           				}else{
           					//将选中的进行拼串
           					var array = $(".check_one:checked");
           					var ids="";
           					 $.each(array,function(){
           						ids += $(this).attr("phoneId")+",";
           					})
           					location.href="${ctp}/deletemuch?ids="+ids;
           				}
           				
           			},function(){
           				$(":checked").attr("checked",false);
           			});
           		}else{
           			layer.msg("请选择手机！");
           		}
           			
           	});
           	
           	
            })
            
            
            
            
            //全选全不选的功能
            $("#checkedAll").click(
				function() {
					$(".checksingle").prop("checked",
							$("#checkedAll").prop("checked"));
					//	$("input[type='checkbox']").prop("checked",$("#checkedAll").prop("checked"));
				});

		$(".checksingle")
				.click(
						function() {
							var result = $(".checksingle").filter(":checked").length == $(".checksingle").length
							$("#checkedAll").prop("checked", result);
						});
            
        </script>
  </body>
</html>
