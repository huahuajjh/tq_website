<?php

class CustomDataForm {
    public static $all_field = array(
        'markdown' => 'markdown资源',
        'textarea' => '文本资源',
        'editor' => '富文本资源',
        'downfile' => '附件资源',
    );

    public static function markdown($value) {
        $isadmin = \Admin\Service\User::getInstance()->id ? 1 : 0;
        if ($isadmin) {
            $userid = \Admin\Service\User::getInstance()->id;
            $groupid = 0;
        } else {
            $userid = service('Passport')->userid;
            $groupid = service('Passport')->groupid ? service('Passport')->groupid : 8;
        }
        $sess_id = time();
        $authkey = md5(C("AUTHCODE") . $sess_id . $userid . $isadmin);
        $str = "";
        $str .= "\r\n<script type=\"text/javascript\">\r\n";
        $str .= "var markdownData = editormd('markdownData',{
                    imageUpload    : true,
                    imageFormats   : ['jpg', 'jpeg', 'gif', 'png', 'bmp', 'webp'],
                    imageUploadURL : 'index.php?g=Attachment&m=Markdown&a=run&catid=-1&isadmin={$isadmin}&module=content&uid={$userid}&groupid={$groupid}&sessid={$sess_id}&authkey={$authkey}',
                    width  : '100%',
                    height : 640,
                    path   : '" . CONFIG_SITEURL_MODEL . "statics/editor.md/lib/'
                 });";
        $str .= "\r\n</script>";
        return '<div id="markdownData"><textarea name="data" style="display:none;">' . $value . '</textarea></div>'.$str;
    }

    public static function textarea($value) {
        return '<textarea name="data" rows="10" cols="20" style="height:100px; width:80%">'.$value.'</textarea>';
    }

    public static function editor($value) {
        if (empty($value)) {
            $value = '<p></p>';
        }
        $isadmin = \Admin\Service\User::getInstance()->id ? 1 : 0;
        if ($isadmin) {
            $userid = \Admin\Service\User::getInstance()->id;
            $groupid = 0;
        } else {
            $userid = service('Passport')->userid;
            $groupid = service('Passport')->groupid ? service('Passport')->groupid : 8;
        }
        $sess_id = time();
        $authkey = md5(C("AUTHCODE") . $sess_id . $userid . $isadmin);
        $toolbar = "[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts'
        ]";
        $str = "";
        $str .= "\r\n<script type=\"text/javascript\">\r\n";
        $str .= "if(editorData) {editorData.destroy();}";
        $str .= " var editorData = UE.getEditor('editorData',{  
                            textarea:'data',
                            toolbars:[$toolbar],
                            autoHeightEnabled:false
                      });
                      editorData.ready(function(){
                        editorData.execCommand('serverparam', {
                            'catid': '-1',
                            '_https':'" . CONFIG_SITEURL_MODEL . "',
                            'isadmin':'{$isadmin}',
                            'module':'content',
                            'uid':'{$userid}',
                            'groupid':'{$groupid}',
                            'sessid':'{$sess_id}',
                            'authkey':'$authkey',
                            'allowupload':'1',
                            'allowbrowser':'1',
                            'alowuploadexts':'gif|jpg|jpeg|png|bmp'
                        });
                        editorData.setHeight(640);
                      });
                      ";
        $str .= "\r\n</script>";
        return '<script type="text/plain" id="editorData" name="data">' . $value . '</script>' . $str;
    }

    public static function downfile($value) {
        $suffix = "gif|jpg|jpeg|png|bmp|ico";
        $authkey = upload_key("1,".$suffix.",1");
        return "<input type='text' name='data' id='data' value='$value' style='width:400px;' class='input' />  <input type='button' class='button' onclick=\"flashupload('data_downfile', '附件上传','data',submit_attachment,'1,".$suffix.",1','content','-1','$authkey')\"/ value='上传文件'>";
    }
}