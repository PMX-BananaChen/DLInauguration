﻿

/**
* 验证身份证格式有效性
* @param type $id_card
* @return boolean
*/
function validation_filter_id_card($id_card) {

    var len = $id_card.length;
    if (len == 18) {
        return idcard_checksum18($id_card);
    } else {
        return false;
    }
    //身份證號碼長度為15位的不考慮
    //else if ((len == 15)) {
    //    $id_card = idcard_15to18($id_card);
    //    return idcard_checksum18($id_card);
    //}

}

// 计算身份证校验码，根据国家标准GB 11643-1999
function idcard_verify_number($idcard_base) {
    var len = $idcard_base.length;
    if (len != 17) {
        return false;
    }
    //加权因子
    $factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    //校验码对应值
    $verify_number_list = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
    $checksum = 0;
    for ($i = 0; $i < len; $i++) {
        $checksum += $idcard_base.substr($i, 1) * $factor[$i];
    }
    $mod = $checksum % 11;
    $verify_number = $verify_number_list[$mod];
    return $verify_number;
}

// 将15位身份证升级到18位
function idcard_15to18($idcard) {
    var len = $idcard.length;

    if (len != 15) {
        return false;
    } else {
        // 如果身份证顺序码是996 997 998 999，这些是为百岁以上老人的特殊编码
        if (array_search(substr($idcard, 12, 3), array('996', '997', '998', '999')) !== false) {
            $idcard = substr($idcard, 0, 6) + '18' + substr($idcard, 6, 9);
        } else {
            $idcard = substr($idcard, 0, 6) + '19' + substr($idcard, 6, 9);
        }
    }
    $idcard = $idcard.idcard_verify_number($idcard);
    return $idcard;
}

// 18位身份证校验码有效性检查
function idcard_checksum18($idcard) {
    var len = $idcard.length;
    if (len != 18) {
        return false;
    }
    $idcard_base = $idcard.substr(0, 17);
    if (idcard_verify_number($idcard_base) != $idcard.substr(17, 1).toUpperCase()) {
        return false;
    } else {
        return true;
    }
}