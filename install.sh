tf-install () {
    # $1 is cpu boolean value
    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n tf tensorflow
        if [[ $3 == [yY] || $3 == [yY][eE][sS] ]]; then
            source ~/Anaconda3/etc/profile.d/conda.sh init bash
            conda activate tf
            conda install -y pip
            pip install -y keras
            conda deactivate
        fi
    fi

    # $2 is gpu boolean value
    if [[ $2 == [yY] || $2 == [yY][eE][sS] ]]; then
        conda create -y -n tf-gpu tensorflow-gpu
        if [[ $4 == [yY] || $4 == [yY][eE][sS] ]]; then
            source ~/Anaconda3/etc/profile.d/conda.sh init bash
            conda activate tf-gpu
            conda install -y pip
            #not sure if something like this is necessary
            #pip install keras-gpu
            conda deactivate
        fi
    fi
}

torch-install () {

    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n pytorch
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate pytorch
        conda install -y pip
        pip install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio===0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
        conda deactivate
    fi

    if [[ $2 == [yY] || $2 == [yY][eE][sS] ]]; then
        conda create -y -n pytorch-gpu
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate pytorch-gpu
        conda install -y pip
        pip install torch===1.7.1 torchvision===0.8.2 torchaudio===0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
        conda deactivate
    fi
}

mxnet-install () {

    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n mx
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate mx
        conda install -y pip
        pip install mxnet
        conda deactivate
    fi

    if [[ $2 == [yY] || $2 == [yY][eE][sS] ]]; then
        conda create -y -n mx-gpu
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate mx-gpu
        conda install -y pip
        pip install mxnet-cu102
        conda deactivate
    fi

}

theano-install () {

    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n theano
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate theano
        conda install -y pip
        pip install Theano
        if [[ $2 == [yY] || $2 == [yY][eE][sS] ]]; then
            pip install keras
        fi
        conda deactivate
    fi

}

fastai-install () {

    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n fastai
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate fastai
        conda install -y pip
        pip install fastai
        conda deactivate
    fi

}

cntk-install () {

    if [[ $1 == [yY] || $1 == [yY][eE][sS] ]]; then
        conda create -y -n cntk
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate cntk
        conda install -y pip
        pip install cntk
        if [[ $3 == [yY] || $3 == [yY][eE][sS] ]]; then
            pip install keras
        fi
        conda deactivate
    fi

    if [[ $2 == [yY] || $2 == [yY][eE][sS] ]]; then
        conda create -y -n cntk-gpu
        source ~/Anaconda3/etc/profile.d/conda.sh init bash
        conda activate cntk-gpu
        conda install -y pip
        pip install cntk-gpu
        #if [[ $4 == [yY] || $4 == [yY][eE][sS] ]]; then
        #    pip install keras
        #fi
        conda deactivate
    fi

}

#conda-install () {
# download anaconda installer from their site
# run installer
# conda install pip
#}

main () {

    #conda-install

    read -p "Install Tensorflow for CPU? (y/n) " tf_cpu
    read -p "Install Keras for CPU in the TensorFlow CPU environment? (y/n) " keras_cpu
    read -p "Install Tensorflow for GPU? (y/n) " tf_gpu
    read -p "Install Keras for GPU in the TensorFlow GPU environment? (y/n) " keras_gpu
    read -p "Install Pytorch for CPU? (y/n) " torch_cpu
    read -p "Install Pytorch for GPU? (y/n) " torch_gpu
    read -p "Install Apache MXnet for CPU? (y/n) " mx_cpu
    read -p "Install Apache MXnet for GPU? (y/n) " mx_gpu
    read -p "Install Theano? (y/n) " theano
    read -p "Install Keras for Theano environment? (y/n) " theano_keras
    read -p "Install fast.ai? (y/n) " fastai
    read -p "Install CNTK for CPU? (y/n) " cntk_cpu
    read -p "Install Keras for CNTK environment? (y/n) " cntk_keras_cpu
    read -p "Install CNTK for GPU? (y/n) " cntk_gpu
    read -p "Install Keras for CNTK environment? (y/n) " cntk_keras_gpu

    tf-install $tf_cpu $tf_gpu $keras_cpu $keras_gpu
    torch-install $torch_cpu $torch_gpu
    mxnet-install $mx_cpu $mx_gpu
    theano-install $theano $theano_keras
    fastai-install $fastai
    cntk-install $cntk_cpu $cntk_gpu $cntk_keras_cpu $cntk_keras_gpu
}

main
