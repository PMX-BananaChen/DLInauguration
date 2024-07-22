function initRelationship(obj) {
    var arrValue = ['配偶', '子女', '父亲', '母亲', '兄弟姐妹', '祖父母', '孙子女', '外祖父母', '外子孙女',
                    '曾祖父母', '外曾祖父母', '叔叔/婶婶', '伯父/伯母', '姑姑/姑父', '舅舅/舅妈', '侄子女',
                    '外甥子女', '其他'];
    var arrIndex = ['1', '2', '11', '12', '16', '21', '22', '23', '24', '25',
                    '26','27','28','29','30','31','32','99'];
    $(obj).append("<option value='0'>请选择</option>");
    var len = arrValue.length;
    for (var i = 0; i < len; i++) {
        var str = "<option value='" + arrIndex[i] + "'>" + arrValue[i] + "</option>";
        $(obj).append(str);
    }
}