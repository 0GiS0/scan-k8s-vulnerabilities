# kube-score
# ---------------------------------------------------------------------------------
kube-score score manifests/*.yaml
kube-score score manifests/*.yaml --output-format sarif > kube-score-results.sarif

# For ADO
kubectl krew install score


# Kubescape
# ---------------------------------------------------------------------------------
kubescape scan manifests/*.yaml
kubescape scan manifests/*.yaml --format sarif

# Kubeaudit
# ---------------------------------------------------------------------------------
kubeaudit all -f manifests/*.yaml
kubeaudit all -f manifests/*.yaml --format sarif
kubeaudit autofix -f manifests/*.yaml

# Trivy
# ---------------------------------------------------------------------------------
trivy config manifests/
trivy config manifests/ --format sarif

# Checkov
# ---------------------------------------------------------------------------------
checkov -d manifests/

# Snyk
# ---------------------------------------------------------------------------------
# Load .env
set -o allexport; source .env; set +o allexport

snyk config set api=$SNYK_TOKEN
snyk iac test manifests/*.yaml

