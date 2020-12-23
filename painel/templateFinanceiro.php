<?php

    include('../includeConstantes.php');
    $sql = MySql::conectar();

?>

<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    h2{
        padding: 8px;
        background-color: #333;
        color: white;
    }

    .box{
        width: 900px;
        margin: 0 auto;
    }

    table{
        width: 900px;
        margin-top: 15px;
        border-collapse: collapse;
    }

    table td{
        padding: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
    }
</style>

<div class="box">

    <?php
        $nome = (isset($_GET['pagamento']) && $_GET['pagamento'] == 'concluidos') ?'Concluidos' : 'Pendentes';
    ?>

    <h2><i class="fas fa-id-card"></i> Pagamentos <?php echo $nome ?></h2>

    <div class="wraper__table">
    <table>
    <tr style="background-color:#ccc;">
            <td style="font-weight:bold;border:1px solid black">Cliente</td>
            <td style="font-weight:bold;border:1px solid black">Nome do pagamento</td>
            <td style="font-weight:bold;border:1px solid black">Valor</td>
            <td style="font-weight:bold;border:1px solid black">Vencimento</td>
        </tr>

        <?php
            if($nome == 'Pendentes')
                $nome = 0;
            else
                $nome = 1;
            $sql = MySql::conectar()->prepare("SELECT * FROM `tb_admin.financeiro` WHERE status = $nome ORDER BY vencimento DESC");
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
</div><!--box-->