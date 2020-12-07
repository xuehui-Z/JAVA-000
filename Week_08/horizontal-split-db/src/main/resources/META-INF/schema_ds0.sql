CREATE DATABASE  IF NOT EXISTS  `ds0`  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE `ds0`;

CREATE TABLE IF NOT EXISTS `t_order01`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order02`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order03`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `t_order04`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order05`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order06`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order07`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order08`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order09`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order10`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order11`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order12`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order13`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order14`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order15`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order16`
(
    `id`          varchar(128) NOT NULL  comment '订单ID',
    `user_id`     varchar(128) NOT NULL comment '用户ID',
    `addr_id`     varchar(128) NOT NULL comment '收货地址',
    `goods_id`    varchar(128) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   varchar(128) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
