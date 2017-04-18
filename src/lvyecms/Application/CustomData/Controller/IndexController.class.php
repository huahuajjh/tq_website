<?php

namespace CustomData\Controller;

use Common\Controller\AdminBase;

class IndexController extends AdminBase {

    protected function _initialize() {
        parent::_initialize();
        $this->customData = D("CustomData/CustomData");
    }

    //首页
    public function index() {
        //实例化模型
        $model = M('CustomData');
        //数量统计
        $count = $model->count();

        $page = $this->page($count, 20);
        $data = $model->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "DESC"))->select();

        $this->assign('Page', $page->show())
            ->assign('count', $count)
            ->assign('data', $data);
        $this->display();
    }

    //删除
    public function delete() {
        $id = I('get.id', 0, 'intval');
        $model = M('CustomData');
        $model->delete(array('where'=>array('id' => $id)));
        $this->success('删除成功！');
    }

    // 新增
    public function add() {
        if (IS_POST) {
            $post = $_POST;
            if (empty($post)) {
                $this->error('数据不能为空！');
            }
            $this->customData->addData($post['title'], $post['data'], $post['typeid']);
            $this->success("添加成功！", U("Index/index"));
        } else {
            $this->assign('all_field', \CustomDataForm::$all_field);
            $this->display();
        }
    }

    public function edit() {
        if (IS_POST) {
            $post = $_POST;
            if (empty($post)) {
                $this->error('数据不能为空！');
            }
            $this->customData->saveData($post['id'], $post['title'], $post['data'], $post['typeid']);
            $this->success("修改成功！", U("Index/index"));
        } else {
            $id = I('get.id');
            $data = $this->customData->getById($id);
            $fieldtype = $data['typeid'];
            if(!$data) {
                $this->error('数据不存在！');
            } else {
                $this->assign('all_field', \CustomDataForm::$all_field);
                $this->assign('data', $data);
                $this->assign('dataForm', \CustomDataForm::$fieldtype($data['data']));
                $this->display();
            }
        }
    }

    public function getForm() {
        $fieldtype = I('get.fieldtype');
        echo \CustomDataForm::$fieldtype();
    }

}
