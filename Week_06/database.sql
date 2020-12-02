-- DATABASE
create database eplat;

use eplat;
-- 用户表
create table t_user
(
    id                    integer(10) not null primary key comment '用户ID',
    name                  varchar(5) comment '用户名称',
    nickname              varchar(8) comment '用户昵称',
    authentication_string varchar(50) comment '密码',
    avatar                varchar(30) comment '头像',
    age                   integer(3) comment '年龄',
    sex                   integer(2) comment '性别',
    phone                 varchar(16) comment '手机号',
    email                 varchar(50) comment '邮箱',
    brith                 varchar(10) comment '出生日期',
    real_flg              tinyint(4) comment '实名认证标识',
    real_name_id          integer(10) comment '实名认证ID',
    sing_data             timestamp comment '注册时间',
    last_login_time       timestamp comment '上次登录时间'
);
alter table t_user
    comment '用户表';

-- 实名认证表
create table t_real_authentication
(
    id          integer(10) not null primary key comment 'ID',
    first_name  varchar(4)  not null comment '名称',
    last_name   varchar(2)  not null comment '姓氏',
    identity_no varchar(18) not null unique comment '身份证号码',
    country     varchar(20) not null comment '国家',
    sheng       varchar(6) comment '省',
    shi         varchar(6) comment '市',
    xian        varchar(6) comment '县/区',
    zhen        varchar(6) comment '乡/镇',
    address     varchar(30) comment '详细地址'
);
alter table t_real_authentication
    comment '实名认证表';

-- 收货地址表
create table t_delivery_address
(
    id      integer(10) not null primary key comment '地址ID',
    user_id integer(10) not null comment '用户ID',
    country varchar(20) comment '国家',
    sheng   varchar(6) comment '省',
    shi     varchar(6) comment '市',
    xian    varchar(6) comment '县/区',
    zhen    varchar(6) comment '乡/镇',
    address varchar(30) comment '详细地址'
);
alter table t_delivery_address
    comment '收货地址表';

-- 商品表
create table t_goods
(
    id             integer(10) not null primary key comment '商品ID',
    goods_sn       varchar(20) comment '商品编号',
    goods_name     varchar(50) comment '商品名',
    goods_ims      varchar(150) comment '商品图片',
    maked_price    decimal(11, 2) comment '市场价',
    shop_price     decimal(11, 2) comment '门店价',
    goods_unit     varchar(10) comment '单位',
    warn_stock     integer(5) comment '库存警告量',
    is_sale        tinyint(4) comment '是否上架',
    is_best        tinyint(4) comment '是否精品',
    is_hot         tinyint(4) comment '是否热销',
    is_new         tinyint(4) comment '是否新品',
    goods_class_id integer(10) comment '商品种类ID',
    goods_brand_id integer(10) comment '商品品牌ID',
    descreption    text comment '商品描述',
    sale_time      integer(13) comment '上市时间',
    delete_flg     tinyint(4) comment '删除标志',
    create_time    integer(13) comment '上架时间'
);
alter table t_goods
    comment '商品表';

-- 优惠活动表
create table t_preferential_active
(
    id           integer(10) unique primary key comment '活动ID',
    goods_id     integer(10) comment '商品ID',
    pre_style    tinyint(4) comment '优惠方式',
    pre_limite   tinyint(4) comment '优惠限制条件',
    pre_power    decimal(11, 2) comment '优惠力度',
    active_title varchar(50) comment '优惠活动标题',
    active_desc  varchar(200) comment '优惠活动描述'
);
alter table t_preferential_active
    comment '优惠活动表';

-- 商品快照表
create table t_goods_snapshot
(
    id           integer(10) unique primary key comment '快照ID',
    goods_id     integer(10) comment '商品ID',
    user_id      integer(10) comment '用户ID',
    active_id    integer(10) comment '活动ID',
    origin_price decimal(11, 2) comment '原价',
    new_price    decimal(11, 2) comment '优惠后价格',
    create_time  int(13) comment '快照时间'
);
alter table t_goods_snapshot
    comment '商品快照表';

-- 订单表
drop table t_order;
create table t_order
(
    id          integer(10) unique primary key comment '订单ID',
    user_id     integer(10) comment '用户ID',
    addr_id     integer(10) comment '收货地址',
    goods_id    integer(10) comment '商品ID',
    unit_price  decimal(11, 2) comment '单价',
    price_type  tinyint(4) comment '单价类型',
    quantity    int(10) comment '数量',
    amount      decimal(11, 2) comment '总金额',
    tax_rate    decimal(11, 6) comment '税率',
    tax_amount  decimal(11, 2) comment '税额',
    actice_id   integer(10) comment '活动ID',
    snapshot_id integer(10) comment '商品快照ID',
    real_price  decimal(11, 2) comment '实际单价',
    real_amount decimal(11, 2) comment '实际总金额'
);
alter table t_order
    comment '订单表';

-- 提交
commit;
