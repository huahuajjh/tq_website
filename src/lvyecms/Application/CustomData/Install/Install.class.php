<?php

// +----------------------------------------------------------------------
// | ShuipFCMS 安装脚本
// +----------------------------------------------------------------------
// | Copyright (c) 2012-2014 http://www.shuipfcms.com, All rights reserved.
// +----------------------------------------------------------------------
// | Author: 水平凡 <admin@abc3210.com>
// +----------------------------------------------------------------------

namespace CustomData\Install;

use Libs\System\InstallBase;

class Install extends InstallBase {

    //安装前进行处理
    public function run() {
        return true;
    }

    //基本安装结束后的回调
    public function end() {
        return true;
    }

}
