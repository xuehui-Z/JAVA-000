package com.example.readwriteseparationv1.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "t_user")
@Data
public class TUser implements Serializable {
  @Id
  private int id;
  private String name;
}
