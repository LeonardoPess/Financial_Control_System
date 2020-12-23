<?php

    include('../../includeConstantes.php');

    $data['success'] = true;
    $data['mensagem'] = "";

    if(Painel::logado() == false){
        die("You're not logged in!");
    }

    //Starting the code here!
    if(isset($_POST['tipo_acao']) && $_POST['tipo_acao'] == 'cadastrar_cliente'){
        sleep(2);
        $name = $_POST['nome'];
        $email = $_POST['email'];
        $type = $_POST['tipo_cliente'];
        $cpf = '';
        $cnpj = '';
        $imagem = '';

        if($type == 'fisico'){
            $cpf = $_POST['cpf'];
        }else if($type == 'juridico'){
            $cnpj = $_POST['cnpj'];
        }

        if($name == '' || $email == '' || $type == ''){
            $data['success'] = false;
            $data['mensagem'] = " Atenção campos vázios não são permitidos!";
        }

        if(isset($_FILES['imagem'])){
            if(Painel::imagemValida($_FILES['imagem'])){
                $imagem = $_FILES['imagem'];
            }else{
                $imagem = '';
                $data['success'] = false;
                $data['mensagem'] = " Você está tentando realizar o upload com uma imagem inválida.";
            }
        }

        if($data['success']){
            if(is_array($imagem))
                $imagem = Painel::uploadFile($imagem);
            $sql = MySql::conectar()->prepare("INSERT INTO `tb_admin.clientes` VALUES (null,?,?,?,?,?)");
            $dadoFinal = ($cpf == '') ? $cnpj : $cpf;
            $sql->execute(array($name,$email,$type,$dadoFinal,$imagem));
            //All right, just register
            $data['mensagem'] = " O cliente foi cadastrado com sucesso!";
        }
    }else if(isset($_POST['tipo_acao']) && $_POST['tipo_acao'] == 'atualizar_cliente'){
        sleep(2);

        $id = $_POST['id'];
        $name = $_POST['nome'];
        $email = $_POST['email'];
        $type = $_POST['tipo_cliente'];
        $imagem = $_POST['imagem_original'];
        $cpf = '';
        $cnpj = '';

        if($type == 'fisico'){
            $cpf = $_POST['cpf'];
        }else if($type == 'juridico'){
            $cnpj = $_POST['cnpj'];
        }

        if($name == '' || $email == ''){
            $data['success'] = false;
            $data['mensagem'] = " Campos vazios não são permitidos!";
        }

        if(isset($_FILES['imagem'])){
            if(Painel::imagemValida($_FILES['imagem'])){
                @unlink('../uploads/'.$imagem);
                $imagem = $_FILES['imagem'];
            }else{
                $data['success'] = false;
                $data['mensagem'] = " Você está tentando realizar o upload com uma imagem inválida.";
            }
        }

        if($data['success']){
            if(is_array($imagem)){
                $imagem = Painel::uploadFile($imagem);
            }

            $sql = MySql::conectar()->prepare("UPDATE `tb_admin.clientes` SET nome = ?, email = ?, tipo = ?, cpf_cnpj = ?, imagem = ? WHERE id = $id");
            $dadoFinal = ($cpf == '') ? $cnpj : $cpf;
            $sql->execute(array($name,$email,$type,$dadoFinal,$imagem));

            $data['mensagem'] = " O cliente foi atualizado com sucesso!";
        }

    }else if(isset($_POST['tipo_acao']) && $_POST['tipo_acao'] == 'deletar_cliente'){
        $id = $_POST['id'];

        $sql = MySql::conectar()->prepare("SELECT imagem FROM `tb_admin.clientes` WHERE id = ?");
        $sql->execute(array($id));
        $imagem = $sql->fetch()['imagem'];
        @unlink('../uploads/'.$imagem);
        MySql::conectar()->exec("DELETE FROM `tb_admin.clientes` WHERE id = $id");
        MySql::conectar()->exec("DELETE FROM `tb_admin.financeiro` WHERE cliente_id = $id");
    }

    die(json_encode($data));