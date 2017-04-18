<?php

function getCustomData($id) {
    $customData = D("CustomData/CustomData");
    $data = $customData->getById($id);
    if(!$data) return "";
    return $data['data'];
}