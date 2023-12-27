
resource "helm_release" "argo_wf" {
  name             = "argowf"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-workflows"
  namespace        = kubernetes_namespace.argo_wf_namespace.id
  create_namespace = false
  version          = "0.40.1"
  values           = []
}

