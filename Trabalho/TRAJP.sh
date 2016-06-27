#!/bin/bash
# aluno: Fernando Bueno Dansi
# Data : 27/06/2016
																																																																																																																																																																																																																					# aluno: Fernando Bueno Dansi
																																																																																																																																																																																																																					# Data : 27/06/2016

while : ; do

adduser() {
					Usuario=$( dialog --stdout --inputbox "Digite o nome do novo Usuario" 0 0)

						useradd $Usuario

					dialog --stdout --infobox "Usuario Criado" 0 0
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

					dialog --stdout --infobox "Grupo Criado com sucesso" 0 0
					sleep 2
}

add_UserExist_A_GrupoExist() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario ja existente:" 0 0)
					grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo ja existente:" 0 0)

						addgroup $user $grupo

					dialog --stdout --infobox "Usuario adicionado ao grupo" 0 0
					sleep 2
}

add_UserNovo_A_GrupoExist() {
					user=$( dialog --stdout --inputbox "Digite o nome do novo Usuario:" 0 0)
					grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo ja existente:" 0 0)

						adduser $user --ingroup $grupo

					dialog --stdout --infobox "Usuario criado e adicionado ao grupo ja existente" 0 0
					sleep 2

}

apagar_user() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja deletar:" 0 0)

							userdel -r $user

					dialog --stdout --infobox "Usuario deletado" 0 0
					sleep 2

}

apagar_grupo() {
					grupo=$( dialog --stdout --inputbox "Digite o nome do Grupo que deseja deletar:" 0 0)

							groupdel $grupo

					dialog --stdout --infobox "Grupo deletado" 0 0
					sleep 2

}

info_Pessoal_user() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja ver as informaçoes pessoais:" 0 0)

						dialog --prgbox "finger $user" 0 0

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

				dialog --stdout --infobox "Informações alteradas" 0 0
				sleep 2

}

config_num_min_dias_modif_senha_user() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
					diamin=$( dialog --stdout --inputbox "Digite o minimo de dias para modificação da senha do usuário:" 0 0)

						passwd -n $diamin $user

					dialog --stdout --infobox "Informações alteradas" 0 0
					sleep 2

}

config_num_max_dias_modif_senha_user() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
					diamax=$( dialog --stdout --inputbox "Digite o maximo de dias para modificação da senha do usuário:" 0 0)

						passwd -x $diamax $user

					dialog --stdout --infobox "Informações alteradas" 0 0
					sleep 2

}

config_num_dias_aviso_prazo_final_alt_senha() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
					diaaviso=$( dialog --stdout --inputbox "Digite o numero de dias de aviso antes do prazo final de alteração de senha:" 0 0)

						passwd -w $diaaviso $user

					dialog --stdout --infobox "Informações alteradas" 0 0
					sleep 2

}

config_data_user_sera_desabilitado() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja alterar:" 0 0)
					diaespi=$( dialog --stdout --inputbox "Digite a data na qual o usuário será desabilitado: (YYYY-MM-DD)" 0 0)

						chage -E $diaespi $user

					dialog --stdout --infobox "Informações alteradas" 0 0
					sleep 2

}

permite_user_admin() {
					user=$( dialog --stdout --inputbox "Digite o nome do Usuario que deseja tornar administrador:" 0 0)

						addgruop $user sudo

					dialog --stdout --infobox "Usuario agora e administrador" 0 0
					sleep 2

}

																																																																																																																																																																																																																																																																																																												# aluno: Fernando Bueno Dansi																																																																																														
																																																																																																																																																																																																																																																																																																												# Data : 27/06/2016



#sair() { Usuario=$( dialog --stdout --infobox "Saindo" 0 0)
#exit
#}

opcao=$( dialog --stdout --menu "################### Gerenciador de Usuario - Aluno: Fernando Bueno Dansi #################" 0 0 0 \
		1 'Adicionar um usuário ao sistema'\
		2 'Configure a senha do usuário'\
		3 'Adicionar um grupo ao sistema'\
		4 'Adicionar um usuário já existente a um grupo já existente'\
		5 'Criar um usuário e adicioná lo a um grupo já existente'\
		6 'Apagar um usuário'\
		7 'Apagar um grupo'\
		8 'Mostrar informações pessoais de um determinado usuário'\
		9 'Modificar as informações pessoais de um determinado usuário'\
		10 'Configurar a data de última modificação de senha do usuário'\
		11 'Configurar o número mínimo de dias para modificação da senha do usuário'\
		12 'Configurar o número máximo de dias para modificação da senha do usuário'\
		13 'Configurar o número de dias de aviso antes do prazo final de alteração de senha'\
		14 'Configurar a data na qual o usuário será desabilitado'\
		15 'Mostrar as configurações de senha de um determinado usuário'\
		16 'Mostrar de quais grupos um dado usuário faz parte'\
		17 'Permitir que o usuário se torne administrador com a sua senha'\
		18 'Exibe os usuários que utilizaram o sistema'\
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
14) config_data_user_sera_desabilitado;;
15) ;;
16) ;;
17) permite_user_admin ;;
18) ;;
19) break ;;
*) dialog --infobox 'Opção Invalida' 0 0;;
esac

done



# aluno: Fernando Bueno Dansi
# Data : 27/06/2016


# aluno: Fernando Bueno Dansi
# Data : 27/06/2016


# aluno: Fernando Bueno Dansi
# Data : 27/06/2016


# aluno: Fernando Bueno Dansi
# Data : 27/06/2016
