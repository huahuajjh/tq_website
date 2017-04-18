<?php

// +----------------------------------------------------------------------
// |  编辑器
// +----------------------------------------------------------------------

namespace Attachment\Controller;

class MarkdownController extends AttachmentsController {

    //编辑器初始配置
    private $confing = array(
        /* 上传图片配置项 */
        'imageActionName' => 'uploadimage',
        'imageFieldName' => 'upfilesss',
        'imageMaxSize' => 0, /* 上传大小限制，单位B */
        'imageAllowFiles' => array('.png', '.jpg', '.jpeg', '.gif', '.bmp'),
        'imageCompressEnable' => true,
        'imageCompressBorder' => 1600,
        'imageInsertAlign' => 'none',
        'imageUrlPrefix' => '',
        'imagePathFormat' => '',
        /* 涂鸦图片上传配置项 */
        'scrawlActionName' => 'uploadscrawl',
        'scrawlFieldName' => 'upfile',
        'scrawlPathFormat' => '',
        'scrawlMaxSize' => 0,
        'scrawlUrlPrefix' => '',
        'scrawlInsertAlign' => 'none',
        /* 截图工具上传 */
        'snapscreenActionName' => 'uploadimage',
        'snapscreenPathFormat' => '',
        'snapscreenUrlPrefix' => '',
        'snapscreenInsertAlign' => 'none',
        /* 抓取远程图片配置 */
        'catcherLocalDomain' => array('127.0.0.1', 'localhost', 'img.baidu.com'),
        'catcherActionName' => 'catchimage',
        'catcherFieldName' => 'source',
        'catcherPathFormat' => '',
        'catcherUrlPrefix' => '',
        'catcherMaxSize' => 0,
        'catcherAllowFiles' => array('.png', '.jpg', '.jpeg', '.gif', '.bmp'),
        /* 上传视频配置 */
        'videoActionName' => 'uploadvideo',
        'videoFieldName' => 'upfile',
        'videoPathFormat' => '',
        'videoUrlPrefix' => '',
        'videoMaxSize' => 0,
        'videoAllowFiles' => array(".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg", ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid"),
        /* 上传文件配置 */
        'fileActionName' => 'uploadfile',
        'fileFieldName' => 'upfile',
        'filePathFormat' => '',
        'fileUrlPrefix' => '',
        'fileMaxSize' => 0,
        'fileAllowFiles' => array(".flv", ".swf",),
        /* 列出指定目录下的图片 */
        'imageManagerActionName' => 'listimage',
        'imageManagerListPath' => '',
        'imageManagerListSize' => 20,
        'imageManagerUrlPrefix' => '',
        'imageManagerInsertAlign' => 'none',
        'imageManagerAllowFiles' => array('.png', '.jpg', '.jpeg', '.gif', '.bmp'),
        /* 列出指定目录下的文件 */
        'fileManagerActionName' => 'listfile',
        'fileManagerListPath' => '',
        'fileManagerUrlPrefix' => '',
        'fileManagerListSize' => '',
        'fileManagerAllowFiles' => array(".flv", ".swf",),
    );

    //初始化
    protected function _initialize() {
        defined('Ueditor') or define('Ueditor', true);
        if (IS_POST) {
            $authkey = I('get.authkey');
            $sess_id = I('get.sessid', 0);
            $userid = I('get.uid');
            $this->isadmin = I('get.isadmin', 0, 'intval');
            $key = md5(C("AUTHCODE") . $sess_id . $userid . $this->isadmin);
            if ($key != $authkey) {
                exit(json_encode(array('state' => '身份认证失败！')));
            } else {
                $this->uid = $userid;
                $this->groupid = I('get.groupid');
            }
        }
        parent::_initialize();
        if ($this->isadmin) {
            //上传大小
            $this->confing['imageMaxSize'] = $this->confing['scrawlMaxSize'] = $this->confing['catcherMaxSize'] = $this->confing['videoMaxSize'] = $this->confing['fileMaxSize'] = self::$Cache['Config']['uploadmaxsize'] * 1024;
            //上传文件类型
            $uploadallowext = explode('|', self::$Cache['Config']['uploadallowext']);
            foreach ($uploadallowext as $k => $rs) {
                $uploadallowext[$k] = ".{$rs}";
            }
            $this->confing['fileAllowFiles'] = $uploadallowext;
        } else {
            $this->confing['imageMaxSize'] = $this->confing['scrawlMaxSize'] = $this->confing['catcherMaxSize'] = $this->confing['videoMaxSize'] = $this->confing['fileMaxSize'] = self::$Cache['Config']['qtuploadmaxsize'] * 1024;
            //上传文件类型
            $uploadallowext = explode('|', self::$Cache['Config']['qtuploadallowext']);
            foreach ($uploadallowext as $k => $rs) {
                $uploadallowext[$k] = ".{$rs}";
            }
            $this->confing['fileAllowFiles'] = $uploadallowext;
        }
    }

    //编辑器配置
    public function run() {
        $result = array();
        $catid = I('get.catid');
        $module = I('get.module', ($catid ? 'content' : MODULE_NAME), 'trim');
        $Attachment = service('Attachment', array('module' => $module, 'catid' => $catid, 'userid' => $this->uid, 'isadmin' => $this->isadmin));
        //设置上传类型，强制为图片类型
        $Attachment->uploadallowext = array("jpg", "png", "gif", "jpeg");
        if ($this->isadmin < 1) {
            //如果是非后台用户，进行权限判断
            $member_group = cache('Member_group');
            if ((int) $member_group[$this->groupid]['allowattachment'] < 1) {
                exit(json_encode(array('message' => '没有上传权限！', 'success' => 0)));
            }
        }
        //站点配置
        $siteConfig = cache('Config');
        //开始上传
        $Callback = false;
        if($siteConfig['watermarkenable']){
            $Callback = array(array("\\Attachment\\Controller\\AttachmentsController", "water"));
        }
        $info = $Attachment->upload($Callback);
        if ($info) {
            // 设置附件cookie
            $Attachment->upload_json($info[0]['aid'], $info[0]['url'], str_replace(array("\\", "/"), "", $info[0]['name']));
            $result = array(
                'success' => 1,
                'message' => '上传成功', //成功返回标准，否则是错误提示
                'url' => $info[0]['url'] //成功地址
            );
        } else {
            $result = array(
                'message' => $Attachment->getError()? : '上传失败', 'success' => 0
            );
        }
        exit(json_encode($result));
    }

}