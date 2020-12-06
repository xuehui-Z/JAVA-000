package com.example.readwriteseparationv1.repository;

import com.example.readwriteseparationv1.domain.TUser;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

@Repository
public interface DynamicUserRepository extends JpaRepository<TUser, Integer> {


}
