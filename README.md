
# stunnel

# Create Artifact Registry 
- Go to Artifact Registry
- Click on Repositories on the left
- Click on Create Repository
- Name: stunnel-registry
- Format: Docker
- Mode: Standard
- Location type: Region
    - Region: us-central1
- Click Create

# Create VPC fire rule
- Go to VPC Networds
- Click on Firewall
- Click on Create firewal rule
- Add firewal rule
    - Firewall Name: stunnel
    - Firewall Source filters: 0.0.0.0/0
    - Protocols and ports: tcp:8090

# Create Service Account for Compute Engine
- Go to IAM & Admin
- Click on Service Accounts
- Click on Create Service Account
    - Service Account Name: sa-stunnel-svc
    - Service Account Id: sa-stunnel-svc

# Create Service Account for Cloud Build
- Go to IAM & Admin
- Click on Service Accounts
- Click on Create Service Account
    - Service Account Name: sa-cloud-build
    - Service Account Id: sa-cloud-build

# Assign Permissions to Service Account
- Go to IAM & Admin
- Click on IAM
- Click on Grant Access
- Add principals
    - New Principal: sa-cloud-build
- Roles:
    - Logs Writer
    - Artifact Registry Writer
    - Cloud Run Admin
    - Service Account User


# Assign Permissions to Service Account
- Go to IAM & Admin
- Click on IAM
- Click on Grant Access
- Add principals
    - New Principal: sa-stunnel-svc
- Roles:
    - Logs Writer
    - Object Viewer


# Create Cloud Storage Buckets
- Go to Cloud Storage
- Click on Buckets
- Click on CREATE
- Add principals
    - New Principal: bucket-stunnel-<prohect_id>


# Create Cunpute Engine
- Go to Cunpute Engine
- Click on VM Instance
- Click on CREATE INSTANCE
- Add 
    - Name: stunnel
    - Configure conatiner


