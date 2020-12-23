<div class="box__content">

    <?php
        if(isset($_GET['email'])){
            //We want to send an email notifying you of the delay
            $parcela_id = (int)$_GET['parcela'];
            $cliente_id = (int)$_GET['email'];
            if(isset($_COOKIE['cliente_'.$cliente_id])){
                Painel::alert("erro","Você já enviou um e-mail para esse cliente! Aguarde mais um pouco.");
            }else{
            //We can send the email 60*60*24*7
            $sql = MySql::conectar()->prepare("SELECT * FROM `tb_admin.financeiro` WHERE id = $parcela_id");
            $sql->execute();
            $infoFinaceiro = $sql->fetch();
            $sql = MySql::conectar()->prepare("SELECT * FROM `tb_admin.clientes` WHERE id = $cliente_id");
            $sql->execute();
            $infoCliente = $sql->fetch();
            $corpoEmail = "Olá $infoCliente[nome], você está com um saldo pendente de R$ $infoFinaceiro[valor] com o vencimento para $infoFinaceiro[vencimento]. Entre em contato conosco para quitar sua parcela!";
            $email = new Email('vps.dankicode.com','testes@dankicode.com','gui123456','guilherme');
            $email->addAdress($infoCliente['email'],$infoCliente['nome']);
            $email->formatarEmail(array('assunto'=>'Cobrança','corpo'=>$corpoEmail));
            $email->enviarEmail();
            Painel::alert("sucesso","O e-mail foi enviado com sucesso!");
            setcookie('cliente_'.$cliente_id,'true',time()+30,'/');
            }
        }

        if(isset($_GET['pago'])){
            $sql = MySql::conectar()->prepare("UPDATE `tb_admin.financeiro` SET status = 1 WHERE id = ?");
            $sql->execute(array($_GET['pago']));
            Painel::alert("sucesso","O pagamento foi quitado com sucesso!");
        }
        ?>

    <h2><i class="fas fa-id-card"></i> Pagamentos Pendentes</h2>
    
    <div class="group__btn">
        <a class="btn gray" href="<?php echo INCLUDE_PATH_PAINEL ?>gerar-pdf.php?pagamento=pendentes" target="_blank">Gerar PDF</a>
    </div><!--group__btn-->

    <div class="wraper__table">
    <table>
    <tr>
            <td>Cliente</td>
            <td>Nome do pagamento</td>
            <td>Valor</td>
            <td>Vencimento</td>
            <td>Enviar e-mail</td>
            <td>Marcar como pago</td>
        </tr>

        <?php
            $sql = MySql::conectar()->prepare("SELECT * FROM `tb_admin.financeiro` WHERE status = 0 ORDER BY vencimento ASC");
            $sql->execute();
            $pendentes = $sql->fetchAll();

            foreach($pendentes as $key => $value){
            $clienteNome = MySql::conectar()->prepare("SELECT `nome`,`id` FROM `tb_admin.clientes` WHERE id = $value[cliente_id]");
            $clienteNome->execute();
            $info = $clienteNome->fetch();
            $clienteNome = $info['nome'];
            $idCliente = $info['id'];
            $style = "";
            if(strtotime(date('Y-m-d')) >= strtotime($value['vencimento'])){
                $style = 'style="background-color:rgba(255,0,0,0.7)"';
            }
        ?>

            <tr <?php echo $style;  ?>> 
                <td><?php echo $clienteNome ?></td>
                <td><?php echo $value['nome'] ?></td>
                <td><?php echo $value['valor'] ?></td>
                <td><?php echo date('d/m/Y',strtotime($value['vencimento'])) ?></td>
                <td><a class="btn edit" href="<?php echo INCLUDE_PATH_PAINEL ?>visualizar-pagamentos?email=<?php echo $info['id']; ?>&parcela=<?php echo $value['id']; ?>"><i class="far fa-envelope"></i> E-mail</a></td>
                <td><a style="background:#00bfa5;" class="btn" href="<?php echo INCLUDE_PATH_PAINEL ?>visualizar-pagamentos?pago=<?php echo $value['id']; ?>"><i class="fas fa-check"></i> Pago</a></td>
            </tr>

        <?php } ?>

    </table>
    </div><!--wraper__table-->

    <h2><i class="fas fa-id-card"></i> Pagamentos Concluidos</h2>

    <div class="group__btn">
        <a class="btn gray" href="<?php echo INCLUDE_PATH_PAINEL ?>gerar-pdf.php?pagamento=concluidos" target="_blank">Gerar PDF</a>
    </div><!--group__btn-->

    <div class="wraper__table">
    <table>
        <tr>
            <td>Cliente</td>
            <td>Nome do pagamento</td>
            <td>Valor</td>
            <td>Vencimento</td>
        </tr>

        <?php
            $sql = MySql::conectar()->prepare("SELECT * FROM `tb_admin.financeiro` WHERE status = 1 ORDER BY vencimento DESC");
            $sql->execute();
            $pendentes = $sql->fetchAll();

            foreach($pendentes as $key => $value){
            $clienteNome = MySql::conectar()->prepare("SELECT nome FROM `tb_admin.clientes` WHERE id = $value[cliente_id]");
            $clienteNome->execute();
            $clienteNome = $clienteNome->fetch()['nome'];
        ?>

            <tr> 
                <td><?php echo $clienteNome ?></td>
                <td><?php echo $value['nome'] ?></td>
                <td><?php echo $value['valor'] ?></td>
                <td><?php echo date('d/m/Y',strtotime($value['vencimento'])) ?></td>
            </tr>

        <?php } ?>

    </table>
    </div><!--wraper__table-->

</div><!--box__content-->