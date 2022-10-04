#!/bin/bash
zenity --info --title "Será necessário a senha do usuário pedagógico?" --text "Na próxima tela por favor digitar a senha do usuário pedagógico\npara autorizar que os demais usuários se conectem\nnas redes sem fio salvas pelo pedagógico!"
#echo $senhasuper | sudo -S sh sed -i 's/permissions.*pedagogico.*/permissions=/' /etc/NetworkManager/system-connections/*
/usr/bin/pkexec /usr/local/bin/habilitarwifipratodos_viapkexec.sh
qtos=$(grep -i ':pedagogico:' /etc/NetworkManager/system-connections/* | wc -l)
if [ $qtos -gt 0 ]; then
   zenity --error --text "Algo deu errado, por favor fazer método manual:\nclique no símbolo da rede sem fio conectada perto do relógio\ndaí pfv clique em 'Editar conexões'\ndaí clique no nome da rede desejada e clicar em editar\nna janela que abre, clicar na aba 'Geral' \ne marcar o 'Todos os su[arios podem conectar...' e 'Salvar'" --title "Algo deu errado :("
else
   zenity --info --text "Tudo certo! Por favor testar ou reiniciar o netbook."
fi
