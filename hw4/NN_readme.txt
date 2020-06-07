1. Use environment conda_tensorflow2_p36.
2. Change hyper-parameters according to the situation.
3. Load previous weights before training on the next dataset. Save multiple checkpoints if possible.
4. The predictions are scalers between 0 and 1. We need to design boundaries for 'good', 'bad', 'idk' labels.

DATASETS:
JAMSTEC/
JAMSTEC2/
NGDC/
SIO/
US_multi/


MODEL TRAIN ORDER (all weights found in google drive): 
weightsAfterJAMSTEC2
weightsAfterJAMSTEC_v1
weightsAfterJAMSTEC_v2
weightsAfterJAMSTEC_v3
weightsAfterJAMSTEC_v4
weightsAfterJAMSTEC_v5
weightsAfterNGDC_v1
weightsAfterNGDC_v2
weightsAfterNGDC_v3
weightsAfterNGDC_v4
weightsAfterNGDC_v5
weightsAfterSIO_v1
weightsAfterSIO_v2
weightsAfterSIO_v3
weightsAfterSIO_v4
weightsAfterSIO_v5
weightsAfterUS_multi_v1
weightsAfterUS_multi_v2
weightsAfterUS_multi_v3
weightsAfterUS_multi_v4
weightsAfterUS_multi_FINALWEIGHTS
