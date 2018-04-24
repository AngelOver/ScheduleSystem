package com.stylefeng.guns.modular.schedule.service.impl;

import com.stylefeng.guns.modular.system.model.Note;
import com.stylefeng.guns.modular.system.dao.NoteMapper;
import com.stylefeng.guns.modular.schedule.service.INoteService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 便签表 服务实现类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
@Service
public class NoteServiceImpl extends ServiceImpl<NoteMapper, Note> implements INoteService {

}
