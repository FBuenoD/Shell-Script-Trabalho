#!/bin/bash 
# aluno: Fernando Bueno Dansi
# Data : 27/06/2016
																																																																																																																																																																																																																					# aluno: Fernando Bueno Dansi
																																																																																																																																																																																																																					# Data : 27/06/2016

while : ; do

adduser() {
		Usuario=$( dialog --stdout --inputbox "Digite o nome do novo Usuario" 0 0)

			useradd $Usuario

		dialog --stdout --infobox "Usuario $Usuario Criado" 0 0
		sleep 2
}

configsenha() {
		Usuario=$( dialog --stdout --inputbox "Digite o nome do Usuario do qual deseja alterar a senha:" 0 0)
		senha=$( dialog --stdout --inputbox "Digite a senha" 0 0)
		senha2=$( dialog --stdout --inputbox "Confirme a Senha" 0 0)

			if [ $senha == $senha2 ]
				then
					dialog --infobox "Senha alterada com sucesso" 0 0
					sleep 2
				else
					dialog --infobox "As senhas não Corresponden tente novamente" 0 0
					sleep 2
			fi

		(echo $senha ; echo $senha) | passwd $Usuario
}

addgruop() {
		grupo=$( dialog --stdout --inputbox "Digite o nome do novo Grupo" 0 0)

			groupadd $grupo

		dialog --stdout --infobox "Grupo $grupo Criado com sucesso" 0 0
		sleep 2
}

add_UserExist_A_GrupoExist() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario ja existente:" 0 0)
		grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo ja existente:" 0 0)

			addgroup $user $grupo

		dialog --stdout --infobox "Usuario $user adicionado ao grupo $grupo" 0 0
		sleep 2
}

add_UserNovo_A_GrupoExist() {
		user=$( dialog --stdout --inputbox "Digite o nome do novo Usuario:" 0 0)
		grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo ja existente:" 0 0)

			adduser $user --ingroup $grupo

		dialog --stdout --infobox "Usuario $user criado e adicionado ao grupo $grupo ja existente" 0 0
		sleep 2
}

apagar_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja deletar:" 0 0)

			userdel -r $user

		dialog --stdout --infobox "Usuario $user deletado" 0 0
		sleep 2

}

apagar_grupo() {
		grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo que deseja deletar:" 0 0)

			groupdel $grupo

		dialog --stdout --infobox "Grupo $grupo deletado" 0 0
		sleep 2
}

info_Pessoal_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja ver as informaçoes pessoais:" 0 0)

		dialog --prgbox "finger $user" 50 100

		sleep 2
}

modifica_info_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar informaçoes pessoais:" 0 0)
		nomefull=$( dialog --stdout --inputbox "Digite o nome completo do Usuario:" 0 0)
		rua=$( dialog --stdout --inputbox "Digite o numero da Rua:" 0 0)
		workfone=$( dialog --stdout --inputbox "Digite o telefone do Trabalho" 0 0)
		homefone=$( dialog --stdout --inputbox "Digite o telefone da Casa" 0 0)

			(echo $nomefull ; echo $rua ; echo $workfone ; echo $homefone) | chfn $user

		dialog --stdout --infobox "Informações alteradas" 0 0
		sleep 2
}

config_data_modifi_senha_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
		datamod=$( dialog --stdout --inputbox "Digite a data de ultima modificação de senha (YYYY-MM-DD):" 0 0)

					chage -d $datamod $user

		dialog --stdout --infobox "Data de Modificação Configurada" 0 0
		sleep 2

}

config_num_min_dias_modif_senha_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
		diamin=$( dialog --stdout --inputbox "Digite o MÍNIMO de dias para modificação da senha do usuário:" 0 0)

			passwd -n $diamin $user

		dialog --stdout --infobox "Dia MÍNIMO Configurado" 0 0
		sleep 2
}

config_num_max_dias_modif_senha_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
		diamax=$( dialog --stdout --inputbox "Digite o MÁXIMO de dias para modificação da senha do usuário:" 0 0)

			passwd -x $diamax $user

		dialog --stdout --infobox "Dia MÁXIMO Configurado" 0 0
		sleep 2
}

config_num_dias_aviso_prazo_final_alt_senha() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
		diaaviso=$( dialog --stdout --inputbox "Digite o numero de dias de aviso antes do prazo final de alteração de senha:" 0 0)

			passwd -w $diaaviso $user

		dialog --stdout --infobox "Dia de Aviso Configurado" 0 0
		sleep 2
}

config_data_user_sera_desabilitado() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
		diaespi=$( dialog --stdout --inputbox "Digite a data na qual o usuário será desabilitado: (YYYY-MM-DD)" 0 0)

			chage -E $diaespi $user

		dialog --stdout --infobox "Data de Desabilitação Configurada" 0 0
		sleep 2
}

mostra_config_senha_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja ver as informaçoes de Senha:" 0 0)

		dialog --prgbox "chage -l $user" 50 100

		sleep 2
}

mostra_grupo_user() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja ver as informaçoes do Grupo:" 0 0)

		dialog --prgbox "groups $user" 50 100

		sleep 2
}

permite_user_admin() {
		user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja tornar administrador:" 0 0)

			addgruop $user sudo

		dialog --stdout --infobox "Usuario $user agora e administrador" 0 0
		sleep 2
}

exibe_user_util_syste() {
		dialog --title "Usuarios" --prgbox "w" 50 100

		sleep 2
}																																																																																																																																																																																																																																																																																																								# aluno: Fernando Bueno Dansi
																																																																																																																																																																																																																																																																																																												# Data : 27/06/2016
#sair() { Usuario=$( dialog --stdout --infobox "Saindo" 0 0)
#exit
#}

opcao=$( dialog --stdout --menu "################### Gerenciador de Usuario - Aluno: Fernando Bueno Dansi #################" 0 0 0 \
		1 'Add um User ao sistema'\
		2 'Configurar a senha do User'\
		3 'Add um grupo ao sistema'\
		4 'Add um User já existente a um grupo já existente'\
		5 'Criar um User e adicioná lo a um grupo já existente'\
		6 'Apagar um User'\
		7 'Apagar um grupo'\
		8 'Mostrar informações pessoais de um determinado User'\
		9 'Modificar as informações pessoais de um determinado User'\
		10 'Configurar a data de última modificação de senha do User'\
		11 'Configurar o número MÍNIMO de dias para modificação da senha do User'\
		12 'Configurar o número MÁXIMO de dias para modificação da senha do User'\
		13 'Configurar o número de dias de aviso antes do prazo final de alteração de senha'\
		14 'Configurar a data na qual o User será desabilitado'\
		15 'Mostrar as configurações de senha de um determinado User'\
		16 'Mostrar de quais grupos um dado User faz parte'\
		17 'Permitir que o User se torne administrador com a sua senha'\
		18 'Exibe os Users sistema'\
		19 'Sair' )

case $opcao in
	1) adduser ;;
	2) configsenha ;;
	3) addgruop ;;
	4) add_UserExist_A_GrupoExist ;;
	5) add_UserNovo_A_GrupoExist ;;
	6) apagar_user ;;
	7) apagar_grupo ;;
	8) info_Pessoal_user ;;
	9) modifica_info_user ;;
	10) config_data_modifi_senha_user ;;
	11) config_num_min_dias_modif_senha_user ;;
	12) config_num_max_dias_modif_senha_user ;;
	13) config_num_dias_aviso_prazo_final_alt_senha ;;
	14) config_data_user_sera_desabilitado ;;
	15) mostra_config_senha_user ;;
	16) mostra_grupo_user ;;
	17) permite_user_admin ;;
	18) exibe_user_util_syste ;;
	19) break ;;
	*) dialog --infobox 'Opção Invalida' 0 0;;
esac

done


# aluno: Fernando Bueno Dansi
# Data : 27/06/2016
