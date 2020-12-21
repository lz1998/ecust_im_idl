CREATE TABLE `ecust_user`
(
    `user_id`    bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    `password`   varchar(255)    NOT NULL DEFAULT '' COMMENT '密码',
    `nickname`   varchar(255)    NOT NULL DEFAULT '' COMMENT '昵称',
    `status`     integer         NOT NULL DEFAULT false COMMENT '是否已删除',
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户信息';

CREATE TABLE `ecust_group`
(
    `group_id`   bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '群号',
    `group_name` varchar(255)    NOT NULL DEFAULT '' COMMENT '群名称',
    `owner_id`   bigint unsigned NOT NULL DEFAULT '' COMMENT '群主ID',
    `status`     integer         NOT NULL DEFAULT false COMMENT '是否已删除',
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='群信息';

CREATE TABLE `ecust_group_member`
(
    `id`         bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    `group_id`   bigint unsigned NOT NULL COMMENT '群号',
    `user_id`    bigint unsigned NOT NULL COMMENT '用户ID',
    `status`     integer         NOT NULL DEFAULT 0 COMMENT '是否在群内',
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    UNIQUE KEY `uniq_member` (`group_id`, `user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='群成员';

CREATE TABLE `ecust_friend`
(
    `id`         bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    `user_a`     bigint unsigned NOT NULL COMMENT '用户A(id较小)',
    `user_b`     bigint unsigned NOT NULL COMMENT '用户B(id较大)',
    `status`     integer         NOT NULL DEFAULT 0 COMMENT '是否是好友',
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    UNIQUE KEY `uniq_friend` (`user_a`, `user_b`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='好友关系';