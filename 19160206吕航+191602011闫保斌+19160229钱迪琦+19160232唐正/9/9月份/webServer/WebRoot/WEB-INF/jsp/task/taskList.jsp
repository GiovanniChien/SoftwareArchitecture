<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@include file="../jessma-base.jsp" %>


  <head>
    <title>
  		APP列表1
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link  rel="stylesheet"  type="text/css" href="/css/complaints.css" />
	<script type="text/javascript" src="/js/complaints.js"></script>
	<script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/js/publicSplitePage.js"></script>
	<script type="text/javascript">
			function page(index)
			{				  
				$.ajax({
					url:"task!queryTask.action",
					type:"post",
					data:"index="+index,
					success:function(obj)
					{			
						var data = eval(obj);
						//var data=[{name:"a",age:12},{name:"b",age:11},{name:"c",age:13},{name:"d",age:14}];
						$("#fisrtTrId").nextAll().remove();
						for(var o in data)
						{
// 							$("#tableId").append('<tr name="content" id="dd"><td >'+data[o].appName+'</td><td >'+data[o].companyName+'</td><td >'+((data[o].appType == 1)?'个人':'企业')+'</td><td >'+data[o].timeInfo+'</td></tr>');
						}
					},
					error:function(){
						//alert("error");
					}
				});
			}
			
			function add()
			{
				location.href="postTask!toAddTask.action";
			}
	</script>
	
  </head>
  
  <body>
  	<div class="main">
    	<div class="first">
        	<div class="first1">
        		<div style="width:300px; height:35px; float:left">
                	<span class="thems">任务管理</span>
                </div>
                <div style=" float:right;height:35px; ">
                	<div class="addBtn" id="addIds" onclick="add()"><p style="font-size: 20px;">发布任务</div>
                </div>
        	</div>
            <div class="remind">
            	<p class="remind1"></p>
            </div>
            <div class="grayLine"></div>
        </div>        
        <form action="${basePath}/org/orgInfo.do" method="post">
        	输入：<input type="text" id="in" name="in" value="" style="width:175px;height:25px;font-size:14px;"/>
        	&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询" style="width:55px;height:25px;font-size:14px;cursor:pointer;">
        </form><br/>
        <div id="table">
        	
        <table width="100%" id="tableId">
				  
				<tr class="fisrtTr" id="fisrtTrId">
                	<th width="10%">发布者</th>
					<th width="20%">类型</th>
					<th width="40%">内容</th>
					<th width="30%">发布时间</th>					
				</tr>
				
				<c:if test="${not empty __action.list}">
    	<c:forEach items="${__action.list}" var="it" varStatus="st">
    		<tr align="center">
    			<td>${it.publisherName}&nbsp;</td>
    			<td>${it.taskTypeName}&nbsp;</td>
    			<td>${it.description}&nbsp;</td>
    			<td>${it.createTime}&nbsp;</td>
    		</tr>
    	</c:forEach>
    	</c:if>
			</table>
        </div>       
		<div  style=" padding:10px" ></div>
     	<%@ include file="/page/publicSplitePage.jsp"%>
    </div>
  </body>
</html>
