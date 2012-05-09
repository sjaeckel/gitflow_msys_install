#! /bin/sh

curl https://raw.github.com/sjaeckel/gitflow_msys_install/master/getopt.exe > ~/bin/getopt.exe
curl https://raw.github.com/sjaeckel/gitflow_msys_install/master/libiconv2.dll > ~/bin/libiconv2.dll
curl https://raw.github.com/sjaeckel/gitflow_msys_install/master/libintl3.dll > ~/bin/libintl3.dll
curl https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.bash > ~/git-flow-completion.bash
echo "source ~/git-flow-completion.bash" >> ~/.bashrc

TEMPDIR="/tmp/$(basename $0).$$"
mkdir $TEMPDIR
echo "created folder $TEMPDIR"
cd $TEMPDIR
git clone --recursive git://github.com/sjaeckel/gitflow.git
cmd /c "$TEMPDIR/gitflow/contrib/msysgit-install.cmd" "~/bin"
INST_CMD=$(cmd //c echo "$TEMPDIR/gitflow/contrib/msysgit-install.cmd" | sed -e 's@/@\\@Ig')
INST_PATH=$(cmd //c echo "/" | sed -e 's@/@\\@Ig')
echo "//c $INST_CMD $INST_PATH"
cmd "//c" "$INST_CMD" "$INST_PATH"
cd -
rm -rf $TEMPDIR
