<?php
    verificaPermissaoPagina(0);
?>
<div class="box__content">
    
    <h2><i class="fas fa-user-edit"></i> Cadastrar Clientes</h2>

    <form class="ajax" action="<?php echo INCLUDE_PATH_PAINEL ?>ajax/forms.php" method="post" enctype="multipart/form-data">

        <div class="form__group">
            <label>Nome:</label>
            <input type="text" name="nome">
        </div><!--form__group-->

        <div class="form__group">
            <label>Email:</label>
            <input type="text" name="email">
        </div><!--form__group-->

        <div class="form__group">
            <label>Tipo:</label>
            <select name="tipo_cliente">
                <option value="fisico">Físico</option>
                <option value="juridico">Jurídico</option>
            </select>
        </div><!--form__group-->

        <div ref="cpf" class="form__group">
            <label>CPF</label>
            <input type="text" name="cpf">
        </div><!--form__group-->

        <div style="display: none;" ref="cnpj" class="form__group">
            <label>CNPJ</label>
            <input type="text" name="cnpj">
        </div><!--form__group-->

        <div class="form-group">
			<label>Imagem</label>
			<input type="file" name="imagem"/>
        </div><!--form-group-->
        
        <div class="form-group">
			<input type="hidden" name="tipo_acao" value="cadastrar_cliente">
		</div><!--form-group-->

        <div class="form__group">
            <input type="submit" name="acao" value="Cadastrar!">
        </div><!--form__group-->

    </form>

</div><!--box__content-->