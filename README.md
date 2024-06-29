# Triton Template Example 

<b> Still work in progress </b>  

## Preperation: 
### Using ONNX: 
1. Place ONNX model to sample `/intent_model/1/` 

2. Config `config.pbtxt`

    2.1 Define input/output of the model (shape, dtype). Look at `config.pbtxt` for more details 

    2.2 Define optimization technique OpenVINO or TensorRT (Optional). Look at `config.pbtxt` for more details  

### Using vLLM: 
1. Download model weights via HuggingFace first  
2. Config `vllm/1/model.json`  
    2.1 Go to `vllm/1/model.json`, replace `model_name` with what you download from huggingface.  

### Load specific model
1. Create new folder following structure 
```
    /{MODEL_NAME}
        /{VERSION}
            {weights in *.onnx}
        config.pbtxt  
```

2. Replace `--model-store` from  `docker-compose` to new folder: 
```
    command: >
      tritonserver
      --model-store ./{MY_NEW_MODEL_WORKSPACE}/
      --grpc-port ${TRITON_GRPC_PORT:-8012}
      --http-port ${TRITON_HTTP_PORT:-8013}
      --metrics-port ${TRITON_METRICS_PORT:-8014}

```

## To Start: 
- Default behvaior: **will load all models at to GPU**, for more specific configurations please go to Triton Document for clear details

```bash  
chmod +x ./start.sh
./start.sh
```


## Performance Optimization & Load Test (TODO): 
