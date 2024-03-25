---
title: Using Ingress URL Rewrite
owner: TKGI-NSX
---

This topic describes how to perform URL rewrite for Kubernetes ingress resources for VMware Tanzu Kubernetes Grid Integrated Edition (TKGI).  

## <a id='url-rewrite-about'></a>About Support for URL Rewrite for Ingress Resources

Tanzu Kubernetes Grid Integrated Edition supports ingress URL path rewrite using NSX-T or NSX v2.5.1+ and NCP v2.5.1+.

All the ingress paths will be rewritten to the provided value. If an ingress has annotation `ingress.kubernetes.io/rewrite-target: /` and has path `/tea`, for example, the URI `/tea` will be rewritten to `/` before the request is sent to the backend service. Numbered capture groups are supported.

## <a id='url-rewrite-example'></a>URL Rewrite Example

The following example shows how to implement URL rewrite.

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: cafe-ingress
  annotations:
    kubernetes.io/ingress.class: "nsx"
    ncp/use-regex: "True"
    #/tea/cup will be rewritten to /cup before sending request to endpoint
    ingress.kubernetes.io/rewrite-target: /$1
spec:
  rules:
  - host: cafe.example.com
    http:
      paths:
      - path: /tea/(.*)
        pathType: Prefix
        backend:
          service:
            name: tea-svc
            port:
              number: 80
      - path: /coffee/(.*)
        pathType: Prefix
        backend:
          service:
            name: coffee-svc
            port:
              number: 80
```
