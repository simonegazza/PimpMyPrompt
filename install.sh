PMP=`readlink -f .bashrc | rev | cut -d "/" -f2- | rev`
mv ~/.bashrc ~/.bashrc.bak && echo ".bashrc back-upped!"
mv ~/.bash_profile ~/.bash_profile.bak && echo ".bash_profile back-upped!" 
ln -s "$PMP/.bashrc" ~/.bashrc && echo ".bashrc installed!"
ln -s "$PMP/.bash_profile" ~/.bash_profile && echo ".bash_profile installed!"
