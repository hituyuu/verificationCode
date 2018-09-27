<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <!--javascript中定义一个点击就换图片的方法-->
    <script type="text/javascript">
        function change()
        {
            var img=document.getElementById("image");
            // 切换验证码的原理是点击就重新将src设置一下，但是浏览器有缓存，
            // 所以我们需要在后面添加一个参数来让浏览器不断发送请求，后面加的参数为时间，因为时间是不断变化的
            img.src="${pageContext.request.contextPath}/verifiCode?a="+new Date().getTime();
        }
    </script>
</head>
<body>
<h1>登陆页面</h1>
<form src="#" method="post">
    用户名:<input type="text" name="username" id ="usernaem"><br/>
    密   码:<input type="password" name="password" id="password"><br/>
    验证码:<input type="text" name="vcode" size="3" id="capatcha">
    <img src="${pageContext.request.contextPath}/verifiCode" id="image" onclick="change()">   //请求Servlet获取验证码
    <a href="javascript:change()">看不清，换一张</a>           //点击即刷新
    <br/>
    <input type="submit" value="登陆" id="submit">

</form>


<!-- 获取信息和显示错误信息 -->
<%--<script>
    String message="";
    String msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
        message=msg;
    }
</script>--%>
<span color="red">
    ${msg}
</span>
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js">
   $("#submit").on("click",function () {
       var capatchaInput = $("#capatcha").val();
       var verifiCation = ${text};
   })

    $("#capatcha").on("click",function () {

    })

</script>
</html>



