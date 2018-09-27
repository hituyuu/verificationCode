package action;

import commons.VerifiCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by yby.
 * Date 2018/9/27 14:16.
 * Description:
 */
@Controller
public class VerificodeAction {

    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }


    @RequestMapping(value = "/verifiCode")
    public void verifiCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("控制器访问了");
        VerifiCode v=new VerifiCode();     //用我们的验证码类，生成验证码类对象
        BufferedImage image=v.getImage();  //获取验证码
        System.out.println("验证码的文本是->"+v.getText());
        request.getSession().setAttribute("text", v.getText()); //将验证码的文本存在session中

        ServletOutputStream outputStream = response.getOutputStream();
        v.output(image, outputStream);//将验证码图片响应给客户端
        outputStream.close();
        outputStream = null;



    }

}
