provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "smtp" {
  metadata {
    name = "smtp"
  }
}

resource "helm_release" "smtp" {
  name       = "smtp"
  namespace  = kubernetes_namespace.smtp.metadata[0].name
  chart      = "../helm/smtpk"

}
