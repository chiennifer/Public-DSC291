1. Use environment conda_tensorflow2_p36.
2. Change hyper-parameters according to the situation.
3. Load previous weights before training on the next dataset. Save multiple checkpoints if possible.
4. The predictions are scalers between 0 and 1. We need to design boundaries for 'good', 'bad', 'idk' labels.