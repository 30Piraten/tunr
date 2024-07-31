#!/bin/bash 

gcloud compute instances create test-vm \
    --project=gcterraform \
    --zone=us-east1-b \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=1064714465319-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=test-vm,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240709,mode=rw,size=10,type=projects/gcterraform/zones/us-east1-b/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=test=vm,goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
