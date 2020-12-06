package com.example.readwriteseparationv1.service;

import com.example.readwriteseparationv1.domain.TUser;
import com.example.readwriteseparationv1.exception.ServiceException;
import com.example.readwriteseparationv1.repository.DynamicUserRepository;
import com.example.readwriteseparationv1.utils.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@Slf4j
public class DynamicUserService {
    @Autowired
    protected DynamicUserRepository dynamicUserRepository;

    @Transactional(readOnly=true)
    public TUser editPrimary(int id) {
        TUser user=null;
        try {
            user=dynamicUserRepository.findById(id).get();
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            log.error("user:编辑错误 {}", e.getMessage());
            throw new ServiceException(ResultCode.INTERNAL_SERVER_QUERY_ERROR.getCode(), e.getMessage());

        }
        return user;

    }
    @Transactional(readOnly=true)
//    @Transactional(propagation = Propagation.REQUIRES_NEW)，
    public TUser editSecond(int id) {
        TUser user=null;
        try {
            user=dynamicUserRepository.findById(id).get();
        }catch (Exception e) {
            // TODO: handle exception
            log.error("user:编辑错误 {}", e.getMessage());
            throw new ServiceException(ResultCode.INTERNAL_SERVER_QUERY_ERROR.getCode(), e.getMessage());

        }
        return user;

    }
}
