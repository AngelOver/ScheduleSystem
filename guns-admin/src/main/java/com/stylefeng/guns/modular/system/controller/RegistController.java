package com.stylefeng.guns.modular.system.controller;

import com.google.code.kaptcha.Constants;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.base.tips.Tip;
import com.stylefeng.guns.core.common.constant.state.ManagerStatus;
import com.stylefeng.guns.core.common.exception.BizExceptionEnum;
import com.stylefeng.guns.core.common.exception.InvalidKaptchaException;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.log.LogManager;
import com.stylefeng.guns.core.log.factory.LogTaskFactory;
import com.stylefeng.guns.core.node.MenuNode;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.shiro.ShiroUser;
import com.stylefeng.guns.core.util.ApiMenuFilter;
import com.stylefeng.guns.core.util.KaptchaUtil;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.factory.UserFactory;
import com.stylefeng.guns.modular.system.model.User;
import com.stylefeng.guns.modular.system.service.IMenuService;
import com.stylefeng.guns.modular.system.service.IUserService;
import com.stylefeng.guns.modular.system.transfer.UserDto;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import static com.stylefeng.guns.core.support.HttpKit.getIp;

/**
 * 注册控制器
 *
 * @author fengshuonan
 * @Date 2017年1月10日 下午8:25:24
 */
@Controller
public class RegistController extends BaseController {

    @Autowired
    private IMenuService menuService;

    @Autowired
    private IUserService userService;

    /**
     * 跳转到注册页面
     */
    @RequestMapping(value = "/regist", method = RequestMethod.GET)
    public String regist() {
            return "/regist.html";
    }
    
    /**
     * 跳转到忘记密码页面
     */
    @RequestMapping(value = "/resetPwd", method = RequestMethod.GET)
    public String resetPwd() {
            return "/resetPwd.html";
    }

    /**
     * 点击注册执行的动作
     */
    @ResponseBody
    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public Tip regist(@Valid UserDto user, BindingResult result) {
        // 判断账号是否重复
        User theUser = userService.getByAccount(user.getAccount());
        if (theUser != null) {
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }

        // 完善账号信息
        user.setSalt(ShiroKit.getRandomSalt(5));
        user.setPassword(ShiroKit.md5(user.getPassword(), user.getSalt()));
        user.setStatus(ManagerStatus.OK.getCode());
        user.setCreatetime(new Date());
        
        //设置用户角色和部门 //暂时写死
        user.setRoleid("6");
        user.setDeptid(29);

        this.userService.insert(UserFactory.createUser(user));
        return SUCCESS_TIP;
    }
    
    
    
    /**
     * 点击忘记密码执行的动作
     */
    @ResponseBody
    @RequestMapping(value = "/resetPwd", method = RequestMethod.POST)
    public Tip resetPwd(@Valid UserDto user, BindingResult result) {
    	
    	
        // 判断账号是否存在
        User theUser = userService.getByAccount(user.getAccount());
        if (theUser == null) {
            throw new GunsException(BizExceptionEnum.ACCOUNT_NO_EXIST);
        }
     
        //邮箱不匹配
        if(!user.getEmail().equals(theUser.getEmail())){
        	 throw new GunsException(BizExceptionEnum.EMAIL_NOT_MATCH);
        }

        // 修改密码
        String newMd5 = ShiroKit.md5(user.getPassword(), theUser.getSalt());
        theUser.setPassword(newMd5);
        theUser.updateById();
        return SUCCESS_TIP;
    }
    

}
