<?php

    session_start();
    date_default_timezone_set('America/Sao_Paulo');
    require('vendor/autoload.php');
    $autoload = function($class){
        if($class == 'Email'){
            require_once('classes/phpmailer/PHPMailerAutoload.php');
        }
        include('classes/'.$class.'.php');
    };

    spl_autoload_register($autoload);

    define('INCLUDE_PATH','http://localhost/curso-web-master/back_end/projetos/projeto_01/');
    define('INCLUDE_PATH_PAINEL',INCLUDE_PATH.'painel/');

    define('BASE_DIR_PAINEL',__DIR__.'/painel');

    //Connect with database!
    define('HOST','localhost');
    define('USER','root');
    define('PASSWORD','');
    define('DATABASE','projeto_01');

    //Constant for control panel
    define('NOME_EMPRESA','Danki Code');