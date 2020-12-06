package com.example.readwriteseparationv1.domain;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

@Entity
@Table(name = "t_user")
@Data
public class TUser implements Serializable {
    @Id
    int id;
    String name;

}
