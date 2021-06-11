#!/usr/bin/env bash

# PyTorch tests
test_pytorch()
{
	# download data for testing torchvision models
	DATA_URL="https://nvidia.box.com/shared/static/y1ygiahv8h75yiyh0pt50jqdqt7pohgx.gz"
	DATA_NAME="ILSVRC2012_img_val_subset_5k"
	DATA_PATH="test/data/$DATA_NAME"

	if [ ! -d "$DATA_PATH" ]; then
		echo 'downloading data for testing torchvision...'
		if [ ! -d "test/data" ]; then
			mkdir test/data
		fi
		wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate $DATA_URL -O test/data/$DATA_NAME.tar.gz
		tar -xzf test/data/$DATA_NAME.tar.gz -C test/data/
	fi

    python3 test/test_pytorch.py
	python3 test/test_torchvision.py --data=$DATA_PATH --use-cuda
	python3 test/test_torchaudio.py
}

test_pytorch
python3 test/test_tensorflow.py
python3 test/test_tensorrt.py
python3 test/test_cuda.py
python3 test/test_numpy.py
python3 test/test_cupy.py
python3 test/test_cupy.py
python3 test/test_numba.py
python3 test/test_onnx.py
python3 test/test_opencv.py
python3 test/test_pandas.py
python3 test/test_scipy.py
python3 test/test_sklearn.py
