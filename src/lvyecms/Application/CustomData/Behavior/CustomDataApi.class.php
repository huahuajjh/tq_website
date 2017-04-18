<?php

// +----------------------------------------------------------------------
// | ShuipFCMS 行为Api
// +----------------------------------------------------------------------

namespace CustomData\Behavior;

class CustomDataApi {

    // 导入共享方法
    public function app_begin($param) {
        include APP_PATH . 'CustomData/Lib/extends.php';
    }

}
