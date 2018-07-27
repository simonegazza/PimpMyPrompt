PMP=`readlink -f .bashrc | rev | cut -d "/" -f2- | rev`
mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
ln -s "$PMP/.bashrc" ~/.bashrc
ln -s "$PMP/.bash_profile" ~/.bash_profile
