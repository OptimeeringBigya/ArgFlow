
resource "helm_release" "argocd" {
  name = "argocd"
  repository      = "https://argoproj.github.io/argo-helm"
  chart           = "argo-cd"
  namespace       = var.argocd_namespace
  create_namespace = true
  version         = "3.35.4"
  values = []

}
