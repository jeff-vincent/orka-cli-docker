# orka-cli-docker
A dockerized controller for interacting with MacStadium's Orka. 

## Setup:

1. Clone the repo. 

2. Set ENV variables in Dockerfile.

3. Run: 

  `docker build -t orka-controller .` # build the image
  
  `docker run -it --privileged --name orka orka-controller` # NOTE: privileged access is required to make the VPN tunnel
  
  > Alternatively, for increased security, you can substitute the following: 
  > `docker run -it --cap-add SYS_ADMIN --cap-add NET_ADMIN --name orka orka-controller`
  
#### Enter VPN password when prompted and then, leaving the first open, open a second terminal. 
  
4. Run:
  
  `docker exec -it orka bin/bash` # enter the terminal
  
  `orka config` # NOTE: kubectl functionality requires key here
  
  `orka login` # Login to Orka
  
  `orka vm list` # Test Orka CLI functionality
  
  `orka kube get` # Access Kubernetes account
  
  `kubectl get pods` # Test kubectl CLI functionality
  
#### Leaving both terminals open, open a third terminal. 

5. Run:

  `docker login` # Login to Docker Hub

  `docker commit orka <dockerhub_username>/configured-orka-cli` # Commit the running orka image
  
  `docker push <dockerhub_username>/configured-orka-cli` # Push the image to Docker Hub
  
## Usage:

Run:

  `docker pull <dockerhub_username>/configured-orka-cli` # Pull the image from Docker Hub
  
  `docker run -it --privileged --name orka <dockerhub_username>/configured-orka-cli` # Run the container
  
  > Alternatively, for increased security, you can substitute the following: 
  > `docker run -it --cap-add SYS_ADMIN --cap-add NET_ADMIN --name orka <dockerhub_username>/configured-orka-cli`

#### Enter your VPN password, and open a second terminal.

Run:

  `docker exec -it orka bin/bash` 
