resource "kubernetes_namespace" "argo_wf_namespace" {
  metadata {
    name = var.argo_workflow_namespace
  }
}

resource "kubernetes_role" "argo_wf_role" {

  metadata {
    name      = "argo-wf-role"
    namespace = var.argo_workflow_namespace
  }
  rule {
    api_groups = ["argoproj.io"]
    resources  = ["workflows", "workflowtemplates", "sensors", "clusterworkflowtemplates", "cronworkflows", "eventsources", "workfloweventbindings", "pods"]
    verbs      = ["list", "update","delete","create","logs","patch","get"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods","pods/exec","pods/log"]
    verbs      = ["get","list", "watch","logs","delete","patch"]
  }
}

resource "kubernetes_service_account" "argo_wf_sa" {
  metadata {
    name      = "argo-wf-sa"
    namespace = var.argo_workflow_namespace
  }
}

resource "kubernetes_role_binding" "argo_wf_rb" {

  metadata {
    name      = "argo-wf-rb"
    namespace = var.argo_workflow_namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.argo_wf_role.metadata[0].name
  }
  subject {
    kind = "ServiceAccount"
    name = "argo-wf-sa"
    namespace = var.argo_workflow_namespace
  }
}


resource "kubernetes_secret" "argo_wf_secret" {
  metadata {
    name = "argo-wf-sa-token"
    annotations = {
      "kubernetes.io/service-account.name" : "argo-wf-sa"
    }
    namespace = var.argo_workflow_namespace
  }
  type = "kubernetes.io/service-account-token"
}