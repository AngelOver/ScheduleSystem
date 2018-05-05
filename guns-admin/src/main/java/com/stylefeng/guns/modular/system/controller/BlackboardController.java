package com.stylefeng.guns.modular.system.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.modular.system.model.User;
import com.stylefeng.guns.modular.system.service.INoticeService;
import com.stylefeng.guns.modular.system.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * 总览信息
 *
 * @author fengshuonan
 * @Date 2017年3月4日23:05:54
 */
@Controller
@RequestMapping("/blackboard")
public class BlackboardController extends BaseController {

    @Autowired
    private INoticeService noticeService;
    

    @Autowired
    private IUserService userService;

    /**
     * 跳转到黑板
     */
    @RequestMapping("")
    public String blackboard(Model model) {
        List<Map<String, Object>> notices = noticeService.list(null);
        User user = this.userService.selectById(ShiroKit.getUser().getId());
        model.addAttribute("noticeList", notices);
        model.addAttribute("linkcode", user.getLinkcode());
        return "/blackboard.html";
    }
}
