terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.29"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "cloud-demo"
  }
}

resource "kubernetes_deployment" "demo" {
  metadata {
    name      = "cloud-demo"
    namespace = kubernetes_namespace.demo.metadata[0].name
    labels = {
      app = "cloud-demo"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "cloud-demo"
      }
    }
    template {
      metadata {
        labels = {
          app = "cloud-demo"
        }
      }
      spec {
        container {
          name  = "cloud-demo"
          image = "cloud-demo:local"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "demo" {
  metadata {
    name      = "cloud-demo"
    namespace = kubernetes_namespace.demo.metadata[0].name
  }
  spec {
    selector = {
      app = "cloud-demo"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "ClusterIP"
  }
}
