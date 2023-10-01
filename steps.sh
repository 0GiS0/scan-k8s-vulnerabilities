# kube-score
# ---------------------------------------------------------------------------------
kube-score score manifests/*.yaml
kube-score score manifests/*.yaml --output-format sarif

# Kubescape
# ---------------------------------------------------------------------------------
kubescape scan manifests/*.yaml
kubescape scan manifests/*.yaml --format sarif

# Kubeaudit
# ---------------------------------------------------------------------------------
kubeaudit all -f manifests/*.yaml
kubeaudit autofix -f manifests/*.yaml

# Trivy
# ---------------------------------------------------------------------------------
trivy config manifests/

# Checkov
# ---------------------------------------------------------------------------------
checkov -d manifests/

# Snyk
# ---------------------------------------------------------------------------------
snyk auth
snyk iac test manifests/*.yaml