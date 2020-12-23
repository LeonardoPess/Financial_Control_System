$(function(){
    $('.ajax').ajaxForm({
        dataType:'json',
        beforeSend:function(){
            $('.ajax').animate({'opacity':'0.6'});
            $('.ajax').find('input[type=submit]').attr('disabled','true');
        },
        success: function(data){
            $('.ajax').animate({'opacity':'1'});
            $('.ajax').find('input[type=submit]').removeAttr('disabled');
            $('.box__alert').remove();
            if(data.success){
                $('.ajax').prepend('<div class="box__alert sucesso"><i class="fa fa-check"></i> '+data.mensagem+' </div>');
                if($('.ajax').attr('atualizar') == undefined)
                    $('.ajax')[0].reset();
            }else{
                $('.ajax').prepend('<div class="box__alert erro"><i class="fa fa-times"></i> <b>'+data.mensagem+'</b></div>');
            }
        }
    })

    $('.btn.delete').click(function(e){
        e.preventDefault();
        var item_id = $(this).attr('item_id');
        var el = $(this).parent().parent().parent().parent();
        $.ajax({
            url:include_path+'/ajax/forms.php',
            data:{id:item_id,tipo_acao:'deletar_cliente'},
            method:'post'
        }).done(function(){
            el.fadeOut();
        })
    })

})