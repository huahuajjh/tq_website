<?php

// +----------------------------------------------------------------------
// | ShuipFCMS 搜索模型
// +----------------------------------------------------------------------
// | Copyright (c) 2012-2014 http://www.shuipfcms.com, All rights reserved.
// +----------------------------------------------------------------------
// | Author: 水平凡 <admin@abc3210.com>
// +----------------------------------------------------------------------

namespace CustomData\Model;

use Common\Model\Model;

class CustomDataModel extends Model {

    /**
     * 根据ID获取数据
     * @param type $config 配置数据
     * @return boolean 成功返回true
     */
    public function getById($id) {
        return $this->where(array('id' => $id))->find();
    }

    /**
     * 添加数据
     * @param type $data 数据
     * @param type $typeid 数据类型ID
     * @param type $inputtime 发布时间
     * @return boolean
     */
    public function addData($title, $data, $typeid, $inputtime) {
        if (!$data) {
            return false;
        }
        //发布时间
        $inputtime = $inputtime ? (int) $inputtime : time();
        $addData = array(
            "title" => $title,
            "adddate" => $inputtime,
            "data" => $data,
            "typeid" => $typeid
        );
        $searchid = $this->add($addData);
        return false;
    }

    /**
     * 更新搜索数据
     * @param type $id 信息id
     * @param type $data 数据
     * @param type $typeid 数据类型ID
     * @param type $inputtime 发布时间
     * @return boolean
     */
    public function saveData($id, $title, $data, $typeid, $inputtime) {
        if (!$id || !$data) {
            return false;
        }
        $info = $this->where(array("id" => $id))->find();
        if (empty($info)) {
            return false;
        }
        //发布时间
        $inputtime = $inputtime ? (int) $inputtime : time();
        $info['title'] = $title;
        $info['adddate'] = $inputtime;
        $info['data'] = $data;
        $info['typeid'] = $typeid;
        $this->save($info);
        return true;
    }

    /**
     * 删除搜索数据
     * @param type $id 信息id
     * @return boolean
     */
    public function deleteData($id) {
        if (!$id) {
            return false;
        }
        $status = $this->where(array('id' => $id))->delete();
        return $status !== false ? true : false;
    }

}
