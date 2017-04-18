<?php

// +----------------------------------------------------------------------
// | 自定义资料
// +----------------------------------------------------------------------
return array(
    //模块名称
    'modulename' => '自定义资料',
    //图标
    'icon' => 'http://www.com/d/file/content/2016/09/57e5432fc6fdb.png',
    //模块简介
    'introduce' => '使用自定义资料',
    //模块介绍地址
    'address' => 'http://www.com',
    //模块作者
    'author' => 'Bless',
    //作者地址
    'authorsite' => 'http://www.com',
    //作者邮箱
    'authoremail' => 'admin@tq.com',
    //版本号，请不要带除数字外的其他字符
    'version' => '1.0.4',
    //签名
    'sign' => 'b05344b0b2eecaa55328c00aeb5fd361',
    //依赖模块
    'depend' => array('Content'),
    //行为注册
    'tags' => array(
        'app_begin' => array(
            'title' => '内容添加结束行为标签',
            'type' => 1,
            'phpfile:CustomDataApi|module:CustomData',
        )
    ),
);
