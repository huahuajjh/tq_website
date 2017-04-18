<?php

/**
 * 编辑器字段 表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function markdown($field, $value, $fieldinfo) {
    $setting = unserialize($fieldinfo['setting']);
    //是否禁用分页和子标题 基本没用。。。
    $disabled_page = isset($disabled_page) ? $disabled_page : 0;
    //编辑器高度
    $height = $setting['height'];
    if (empty($setting['height'])) {
        $height = 640;
    }
    //模块
    $form = \Form::markdown($field, $height, $this->catid, MODULE_NAME);
    //javascript
    $this->formJavascript .= "
            //增加编辑器验证规则
            jQuery.validator.addMethod('markdown{$field}',function(){
                return " . ($fieldinfo['minlength'] ? "markdown{$field}.getMarkdown();" : "true") . "
            });
    ";
    //错误提示
    $errortips = $this->fields[$field]['errortips'];
    //20130428 由于没有设置必须输入时，ajax提交会造成获取不到编辑器的值。所以这里强制进行验证，使其触发编辑器的sync()方法
    // if ($minlength){
    //验证规则
    $this->formValidateRules['info[' . $field . ']'] = array("markdown$field" => "true");
    //验证不通过提示
    $this->formValidateMessages['info[' . $field . ']'] = array("markdown$field" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
    // }
    
    return '<div id="' . $field . '"><textarea name="info[' . $field . ']" style="display:none;">' . $value . '</textarea></div>'.$form;
}
