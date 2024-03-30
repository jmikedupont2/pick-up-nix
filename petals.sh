
#tailscale status |grep " v" |cut -b15-30  | parallel -j0 "echo ssh {} 'cd /mnt/data1/nix && git submodule init'"
 for x in v3-0 v3-4 v3-3 v3-3 v3-2 v3-1 v2-4 v2-3 v2-2 v2-1 v2-0
 do
     echo $x;
     #ssh -oStrictHostKeyChecking=no  $x "echo $x; df -h /" &

     #ssh -oStrictHostKeyChecking=no  $x "rm -rf ~/.cache/ &&df -h /" &
     #ssh -oStrictHostKeyChecking=no $x "guix install protobuf grpc python-pytorch" &
     
     #ssh $x "cd /mnt/data1/nix/time && git status && git checkout origin/main && git pull origin main && cd /mnt/data1/nix/time/2024/03/27/hivemind/ && git submodule init . &&git submodule update . && git checkout feature/gcp_tpu && git pull origin"  &

     #ssh $x "cd /mnt/data1/nix/time/2023/09/22/petals/ && git submodule init . && git submodule update . && git remote show origin |grep github "
     #ssh $x "cd /mnt/data1/nix/time/2023/09/22/petals/ && git status "
     #ssh $x "rm '/mnt/data1/nix/time/.git/modules/2024/03/27/peft/index.lock' && cd /mnt/data1/nix/time/2024/03/27/peft/ && git submodule init .  && git submodule update . &&git checkout 2665f80a1738b315dce42da8f1a9c7fe793aa9ca" &
     #ssh $x "cd /mnt/data1/nix/time/2024/03/27/peft/ && git submodule init .  && git submodule update . &&git checkout 2665f80a1738b315dce42da8f1a9c7fe793aa9ca" &
     
     #ssh $x "rm /mnt/data1/nix/time/.git/modules/2024/03/27/peft/index.lock"
     #ssh $x "cd /mnt/data1/nix/time/2023/07/17/experiments/transformers/ && git submodule init .  && git submodule update . &&git checkout b71f20a7c9f3716d30f6738501559acf863e2c5c" &
     #ssh $x "cd /mnt/data1/nix/time/2023/07/17/experiments/transformers/ && git submodule init .  && git submodule update . &&git checkout b71f20a7c9f3716d30f6738501559acf863e2c5c" &

     #ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/07/17/experiments/transformers/ && pip install -e . && cd /mnt/data1/nix/time/2024/03/27/peft/ && pip install -e ." &
     #pip install -e git+https://github.com/huggingface/peft@2665f80a1738b315dce42da8f1a9c7fe793aa9ca#egg=peft&subdirectory=../../../../../../../time/2024/03/27/peft
     #-e git+https://github.com/huggingface/transformers.git@b71f20a7c9f3716d30f6738501559acf863e2c5c#egg=transformers&subdirectory=../../../../../../../../time/2023/07/17/experiments/transformers
     #ssh $x "cd /mnt/data1/nix/time/2023/09/22/petals/ && git reset --hard && git checkout mi/main  " 
     #ssh $x "cd /mnt/data1/nix/time/2023/09/22/petals/ && git submodule init . && git submodule update . && git checkout main && git remote add mi https://github.com/meta-introspector/petals && git pull mi main "  &

     #ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/09/22/petals/ && pip install -e . "  &
     #ssh $x ". ~/.venv/bin/activate && pip install torch~=2.2.0 torch_xla[tpu]~=2.2.0 -f https://storage.googleapis.com/libtpu-releases/index.html"
     #    ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/09/22/petals/ && ls ./run.sh || echo $x "
     #ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/09/22/petals/ && ps xauf | grep petals |grep -v grep ||bash ./run.sh"
     #    ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/09/22/petals/ && ps xauf | grep petals |grep -v grep"
         ssh $x " ps xauf | grep hive |grep -v grep"  
     #ssh $x "rm /mnt/data1/nix/time/.git/modules/2023/09/22/petals/index.lock; . ~/.venv/bin/activate && cd /mnt/data1/nix/time/2023/09/22/petals/ && git remote add mi https://github.com/meta-introspector/petals && git checkout mi/main "  

     
     #ssh $x "cd /mnt/data1/nix/time/2024/03/27/hivemind/ && git submodule init . && git submodule update ."
     #ssh $x "cd /mnt/data1/nix/time/2024/03/27/hivemind/ && git remote add mi https://github.com/meta-introspector/hivemind && git fetch mi |grep github && git checkout feature/gcp_tpu"
     #     ssh $x "cd /mnt/data1/nix/time/2024/03/27/hivemind/ && git fetch mi && git checkout feature/gcp_tpu"
     #ssh $x "cd /mnt/data1/nix/time/2024/03/27/hivemind/ && git status" &
     #ssh $x "virtualenv ~/.venv && . ~/.venv/bin/activate && cd /mnt/data1/nix/time/2024/03/27/hivemind/ && pip install -e . " &
     #ssh $x ". ~/.venv/bin/activate && cd /mnt/data1/nix/time/2024/03/27/hivemind/ && pip install -e . " &
     #  && git pull origin"  
     #ssh $x "cd /mnt/data1/nix/time/2024/03/27/ && git submodule init . &&git submodule update . "  &
     
     #     ssha $x "guix gc"
#     ssha $x "sudo guix gc" 
#     #ssh $x "sudo mkdir -p /mnt/data1/ || sudo chown ubuntu: /mnt/data1/ || git clone https://github.com/jmikedupont2/pick-up-nix.git /mnt/data1/nix || d /mnt/data1/nix && git submodule init"
     #     ssh $x "cd /mnt/data1/nix && git init . || git remote add origin https://github.com/jmikedupont2/pick-up-nix.git || git pull origin" &

     #     ssh $x "cd /mnt/data1/nix && git remote add origin https://github.com/jmikedupont2/pick-up-nix.git || git fetch --all" &
#     ssh $x "cd /mnt/data1/nix && git checkout master" &
     #ssh $x "cd /mnt/data1/nix && git submodule init && git submodule update" &
#oops     ssh $x "cd /mnt/data1/nix && git pull --recurse-submodules=on-demand"
     
     #          ssh $x "cd /mnt/data1/nix && git pull origin master" &
     #          ssh $x "cd /mnt/data1/nix/ && git status"

     #ssh $x "cd /mnt/data1/nix/time && git pull origin main "
#     ssh $x "cd /mnt/data1/nix/time/2024/03/ &&git checkout main && git pull && git submodule init  "
     #     ssh $x "cd /mnt/data1/nix/time/2024/03/18/guix-cuirass/ && git checkout main && git submodule init  && git submodule update . "

#          ssh $x "cd /mnt/data1/nix/time/2024/03/18/guix-cuirass/ && git pull origin main "


     #          ssh $x "cd /mnt/data1/nix/time/2024/03/18/guix-cuirass/ && git pull origin main "


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
