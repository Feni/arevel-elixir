use static_push instead of static_path for h2 push of assets.
ets - key value store per instance. 
pg2

Code structure
assets/ - frontend assets
config/ - settings
lib/ - Actual application source code
rel/ - distillery release configurations
priv/ - generated static files
lib/


gcloud app deploy

App engine flex -
mini benchmark

artillery quick --count 10 -n 20 https://arevel.com    
Started phase 0, duration: 1s @ 23:36:02(-0500) 2019-04-14
Report @ 23:36:04(-0500) 2019-04-14
Elapsed time: 2 seconds
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 84.03
  Request latency:
    min: 36.9
    max: 165.6
    median: 49.4
    p95: 104.6
    p99: 132.5
  Codes:
    200: 200

All virtual users finished
Summary report @ 23:36:04(-0500) 2019-04-14
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 84.03
  Request latency:
    min: 36.9
    max: 165.6
    median: 49.4
    p95: 104.6
    p99: 132.5
  Scenario counts:
    0: 10 (100%)
  Codes:
    200: 200



Setting up compute engine version
https://cloud.google.com/community/tutorials/elixir-phoenix-on-google-compute-engine

export PROJECT_ID=arevel-209217
export BUCKET_NAME="${PROJECT_ID}-releases"
mkdir builder
pushd builder

docker build -t arevel-builder .


cd ~/code/arevel
mix clean --deps
docker run --rm -it -v $(pwd):/app arevel-builder


gsutil cp _build/prod/rel/arevel/bin/arevel.run \
    gs://arevel-209217-releases/arevel-release


gcloud compute instances create arevel-instance \
    --image-family debian-9 \
    --image-project debian-cloud \
    --machine-type n1-standard-4 \
    --boot-disk-type pd-ssd \
    --boot-disk-size 10 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata-from-file startup-script=bin/instance-startup.sh \
    --metadata release-url=gs://arevel-209217-releases/arevel-release \
    --zone us-central1-b \
    --tags http-server

gcloud compute firewall-rules create default-allow-http-9080 \
    --allow tcp:9080 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http-server \
    --description "Allow port 9080 access to http-server"


gcloud compute firewall-rules create default-allow-http-9081 \
    --allow tcp:9081 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http-server \
    --description "Allow https 9081 access to http-server"

-
TODO: Should set this to only allow it from lb.

/app/tmp/arevel/releases/0.1.0/libexec/config.sh: line 54: /app/tmp/arevel/var/vm.args: Permission denied


sudo chown -R arevelapp app


PORT=8080 ./arevel-release foreground to debug


gcloud compute instances create arevel-instance \
    --image-family debian-9 \
    --image-project debian-cloud \
    --machine-type n1-standard-4 \
    --boot-disk-type pd-ssd \
    --boot-disk-size 10 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata-from-file startup-script=bin/instance-startup.sh \
    --metadata release-url=gs://arevel-209217-releases/arevel-release \
    --zone us-central1-b \
    --tags http-server


gcloud compute instance-templates create arevel-template \
    --image-family debian-9 \
    --image-project debian-cloud \
    --machine-type n1-standard-4 \
    --boot-disk-type pd-ssd \
    --boot-disk-size 10 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata-from-file startup-script=bin/instance-startup.sh \
    --metadata release-url=gs://arevel-209217-releases/arevel-release \
    --tags http-server


gcloud compute instance-groups managed create arevel-group \
    --base-instance-name arevel-group \
    --size 2 \
    --template arevel-template \
    --zone us-central1-b
