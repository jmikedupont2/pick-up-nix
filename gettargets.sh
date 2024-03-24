
#tailscale status |grep " v" |cut -b15-30  | parallel -j0 "echo ssh {} 'cd /mnt/data1/nix && git submodule init'"
 for x in `tailscale status |grep " v" |cut -b15-30`;
 do
     echo $x;
#     #ssh $x "sudo mkdir -p /mnt/data1/ || sudo chown ubuntu: /mnt/data1/ || git clone https://github.com/jmikedupont2/pick-up-nix.git /mnt/data1/nix || d /mnt/data1/nix && git submodule init"
     #     ssh $x "cd /mnt/data1/nix && git init . || git remote add origin https://github.com/jmikedupont2/pick-up-nix.git || git pull origin" &

     #     ssh $x "cd /mnt/data1/nix && git remote add origin https://github.com/jmikedupont2/pick-up-nix.git || git fetch --all" &
#     ssh $x "cd /mnt/data1/nix && git checkout master" &
     #ssh $x "cd /mnt/data1/nix && git submodule init && git submodule update" &
#oops     ssh $x "cd /mnt/data1/nix && git pull --recurse-submodules=on-demand"
     
     #          ssh $x "cd /mnt/data1/nix && git pull origin master" &
     #          ssh $x "cd /mnt/data1/nix/ && git status"
     #               ssh $x "cd /mnt/data1/nix/time && git stash && git reset --hard  && git checkout origin/main --force && git pull origin main "
     #ssh $x "cd /mnt/data1/nix/time && git pull origin main "
#     ssh $x "cd /mnt/data1/nix/time/2024/03/ &&git checkout main && git pull && git submodule init  "
     #     ssh $x "cd /mnt/data1/nix/time/2024/03/18/guix-cuirass/ && git checkout main && git submodule init  && git submodule update . "
          ssh $x "cd /mnt/data1/nix/time/2024/03/18/guix-cuirass/ && git pull origin main "
     #     ssh $x "cd /mnt/data1/nix/time && git submodule foreach 'git pull'" &
     #          ssh $x "cd /mnt/data1/nix/time && git submodule init" &
     #               ssh $x "cd /mnt/data1/nix/time && git pull origin main && git submodule init " &
#          ssh $x "sudo apt build-dep guile-3.0 " &
     #     ssh $x "apt update && apt install guile-3.0 " &
#     ssh $x "echo $x; cd /mnt/data1/nix/time/ && git checkout origin/main & git pull origin main && git submodule init  && git submodule update .  " 
     #     ssh $x "cd /mnt/data1/nix/time/2024/03/12/guile/ &&git submodule init &&git submodule update . &&git pull origin  && git checkout master && ./autogen.sh  && ./configure && make  &&make install " &
     #     ssh $x "sudo apt install -y devscripts" &
#     ssh $x "sudo apt autoremove -y" &
     
     #                         ssh $x "sudo apt install -y autoconf automake" &
#ssh $x "sudo apt install -y libtool debhelper autoconf automake dh-autoreconf  gperf  libncurses5-dev libreadline-dev libltdl-dev libgmp-dev texinfo flex libunistring-dev libgc-dev libffi-dev pkg-config"

     #                    ssh $x "sudo apt install -y flex libtool build-essential autopoint && cd /mnt/data1/nix/time/2024/03/12/guile/ &&  ./autogen.sh  && ./configure && make  &&make install " &

                         #ssh $x "cd /mnt/data1/nix/time/2024/03/12/guile/ &&  ./autogen.sh  " &
			 #
     #ssh $x "cd /mnt/data1/nix/time/2024/03/12/guile/   && ./autogen.sh && ./configure && make  &&sudo make install " &
#     ssh $x "sudo mkdir -p /mnt/data1/nix/root; chown ubuntu: /mnt/data1/nix/root; cd /mnt/data1/nix/time/2024/03/12/guile/ && ./configure --prefix /mnt/data1/nix/root && make  &&sudo make install " &
   #  ssh $x "sudo apt install -y datefudge docbook docbook-to-man fonts-lmodern gtk-doc-tools  guile-3.0-dev libcmocka-dev libcmocka0 libopts25 libopts25-dev libosp5  libptexenc1 libsofthsm2 libteckit0 libtexlua53 libtexluajit2  libunbound-dev libzzip-0-13 net-tools opensp softhsm2 softhsm2-common  texlive-base texlive-binaries texlive-latex-base texlive-plain-generic"
     # ssh $x "cd /mnt/data1/nix/time/2024/03/12/guile/   &&  make -j20  && sudo make install " &
#      ssh $x "unset LD_PRELOAD && wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh && sudo bash ./guix-install.sh --yes " &
 done
# #> targets.txt
