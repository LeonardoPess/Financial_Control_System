<div class="box__content">
    
    <h2><i class="fa fa-id-card"></i> Clientes Cadastrados</h2>

    <div class="busca">

        <h2><i class="fas fa-search"></i> Realizar uma busca:</h2>

        <form method="post">
            <input placeholder="Procure por: Nome, e-mail, cpf ou cnpj" type="text" name="busca">
            <input type="submit" name="acao" value="Buscar!">
        </form>

    </div><!--busca-->

    <?php
        $query = "";
        if(isset($_POST['acao'])){
            $busca = $_POST['busca'];
            $query = "WHERE nome LIKE '%$busca%' OR email LIKE '%$busca%' OR tipo LIKE '%$busca%' OR cpf_cnpj LIKE '%$busca%' ";
        }

        $clientes = MySql::conectar()->prepare("SELECT * FROM `tb_admin.clientes` $query");
        $clientes->execute();
        $clientes = $clientes->fetchAll();
        if(isset($_POST['acao']))
            echo '<div class="busca__result"><p>Foram encontrados <b>'.count($clientes).'</b> resultado(s):</p></div>';
    ?>

    <div class="boxes">

    <?php
        foreach($clientes as $value){
    ?>

        <div class="box__single__wraper w50 ">
            <div class="box__single w100">

                <div class="topo__box">
                    <?php
                        if($value['imagem'] == ''){
                    ?>
                        <h2><i class="fa fa-user"></i></h2>
                    <?php }else{ ?>
                        <img src="<?php echo INCLUDE_PATH_PAINEL ?>uploads/<?php echo $value['imagem']; ?>">
                    <?php } ?>
                </div><!--topo__box-->

                <div class="body__box">
                    <p><b><i class="fa fa-pencil-alt"></i> Nome do cliente:</b> <?php echo $value['nome'] ?></p>
                    <p><b><i class="fa fa-pencil-alt"></i> Email:</b> <?php echo $value['email'] ?></p>
                    <p><b><i class="fa fa-pencil-alt"></i> tipo:</b> <?php echo ucfirst($value['tipo']); ?></p>
                    <p><b><i class="fa fa-pencil-alt"></i> <?php 
                        if($value['tipo'] == 'fisico')
                            echo 'CPF:';
                        else
                            echo 'CNPJ:';
                    ?></b> <?php echo $value['cpf_cnpj'] ?></p>
                    <div class="group__btn">
                        <a class="btn edit" href="<?php echo INCLUDE_PATH_PAINEL ?>editar-cliente?id=<?php echo $value['id']; ?>"><i class="fas fa-pencil-alt"></i> Editar</a>
                        <a actionBtn="delete" item_id="<?php echo $value['id']; ?>" class="btn delete" href="<?php echo INCLUDE_PATH_PAINEL ?>"><i class="fas fa-times"></i> Excluir</a>
                    </div><!--group__btn-->
                </div><!--body__box-->

            </div><!--box__single-->
        </div><!--box__single__wraper-->

    <?php } ?>

    <div class="clear"></div>
    </div><!--boxes-->

</div><!--box__content-->