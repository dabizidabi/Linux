Install kubernetes runner via helm <br/>
docs: https://docs.gitlab.com/runner/install/kubernetes.html <br/>

Create a values.yaml file for your GitLab Runner configuration <br/>
docs: https://docs.gitlab.com/runner/install/kubernetes.html#configuring-gitlab-runner-using-the-helm-chart <br/>

default values.yaml file:

```
wget -O ./values.yaml https://gitlab.com/gitlab-org/charts/gitlab-runner/-/raw/main/values.yaml?inline=false
```

Specify the following gitlabUrl & runnerRegistrationToken in values.yaml file<br/>
(uncomment and change gitlabUrl:, secret:, rules:) <br/>
For example: <br/>

```
gitlabUrl: https://gitlab.com/

secret: gitlab-runner

rbac:
  create: true

rules:
- apiGroups: [""]
  resources: ["configmaps", "pods", "pods/attach", "secrets", "services"]
  verbs: ["get", "list", "watch", "create", "patch", "update", "delete"]
- apiGroups: [""]
  resources: ["pods/exec"]
  verbs: ["create", "patch", "delete"]
```

Store registration tokens or runner tokens in secrets, for example: <br/>

```
cat <<EOF > runner-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: gitlab-runner
  namespace: gitlab-runner
type: Opaque
data:
  runner-registration-token: "NlZrN1pzb3NxUXlmcmVBeFhUWnIK" #base64 encoded registration token  e.g echo -n '12345' | base64
  runner-token: ""
EOF
```

Add helm repo

```
helm repo add gitlab https://charts.gitlab.io
helm repo update gitlab

helm search repo gitlab/gitlab-runner --versions
```

Grab the manifest and explore its content.

```
CHART_VERSION="0.51.0"
APP_VERSION="15.10.0"

helm template gitlab-runner gitlab-runner \
--repo https://charts.gitlab.io \
--version ${CHART_VERSION} \
--namespace gitlab-runner \
--values values.yaml \
> ./gitlab-runner.${APP_VERSION}.yaml
```

Deploy the runner

```
kubectl create namespace gitlab-runner
kubectl apply -f ./runner-secret.yaml
kubectl apply -f ./gitlab-runner.${APP_VERSION}.yaml
```
