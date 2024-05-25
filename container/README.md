# Cloud Run Debugger Container
This container is designed to debug tools running on Cloud Run.

# How Does It Works?
This container operates as a sidecar container on Cloud Run. It connects to a VM that is waiting for a netcat connection. Once the connection is established, you can use the Bash prompt on Cloud Run.