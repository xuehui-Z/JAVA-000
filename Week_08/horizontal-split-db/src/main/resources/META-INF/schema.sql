CREATE DATABASE  IF NOT EXISTS  `ds0`  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE `ds0`;

CREATE TABLE IF NOT EXISTS `t_order1`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order2`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order3`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `t_order4`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order5`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order6`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order7`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order8`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order9`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order10`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order11`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order12`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order13`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order14`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order15`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order16`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE DATABASE  IF NOT EXISTS  `ds1`  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE `ds1`;

CREATE TABLE IF NOT EXISTS `t_order1`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order2`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order3`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `t_order4`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order5`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order6`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order7`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order8`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order9`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order10`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order11`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order12`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order13`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order14`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order15`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_order16`
(
    `id`          int(12) NOT NULL  comment 'ID',
    `order_id`    int(12) NOT NULL comment '订单ID',
    `user_id`     int(12) NOT NULL comment '用户ID',
    `addr_id`     int(12) NOT NULL comment '收货地址',
    `goods_id`    int(12) NOT NULL comment '商品ID',
    `unit_price`  decimal(11, 2) NOT NULL comment '单价',
    `quantity`    int(10) NOT NULL comment '数量',
    `amount`      decimal(11, 2) NOT NULL comment '总金额',
    `actice_id`   int(12) comment '活动ID',
    `real_price`  decimal(11, 2) comment '实际单价',
    `real_amount` decimal(11, 2) comment '实际总金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;