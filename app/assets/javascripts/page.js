// глобальная переменная "открытый в данный момент комментарий"
// следит, что бы только 1 окошечко для написания комментария
// было открыто в данный момент
var opened_comment = null;
function process_comment_field(elem, comment_id) {
    var current_comment_id = 'comment'+comment_id;
    var write_comment_area =
        '<form id="'+current_comment_id+'" action="/add/comment" method="POST">' +
        '<textarea name="message" id="textarea" autofocus>' +
        '</textarea>' +
        '<br>' +
        '<input type="button" value="📤 (shift+alt+s)" accesskey="s" onclick="process_send()">' +
        '<input type="hidden" name="perent_comment_id" value="' + comment_id + '">' +
        '</form>';
//если где-то открыт комментарий
    if(opened_comment){
        //если он в другом месте - удаляем там и создаём здесь
        if (opened_comment !== current_comment_id){
            document.getElementById(opened_comment).remove();
            opened_comment = null;
            elem.insertAdjacentHTML('beforeBegin', write_comment_area);
            opened_comment = current_comment_id;
        } else { //если он в этом месте - удаляем здесь
            document.getElementById(opened_comment).remove();
            opened_comment = null;
        }
    } else { //если комментарий не открыт нигде - создаём тут
        elem.insertAdjacentHTML('beforeBegin', write_comment_area);
        opened_comment = current_comment_id;
    }
}
// функция будет отправлять комментарий post запросом
// и подгружать пришедший html как новый комментарий
function process_send () {
    var massage = document.getElementById("textarea").value;
    var perent_comment_id = parseInt(opened_comment.replace(/\D+/, ''));
//Создание экземпляра объекта XMLHttpRequest
    var Httpreq = new XMLHttpRequest();
//Открытие соединения
    var url = "/add/comment";
    Httpreq.open("POST", url, true);//true - асинхронный
    Httpreq.setRequestHeader("Content-Type", "application/json");
//Установка обработчика события (нужно делать после открытия и до отправки в IE)
    Httpreq.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            // Просто перезагрузим страницу
            location.replace('/comment/'+perent_comment_id);
        }
    };
//Отправка запроса.
    Httpreq.send(JSON.stringify({'message': massage, 'perent_comment_id': perent_comment_id}));
}