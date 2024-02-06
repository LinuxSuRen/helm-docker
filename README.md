# helm-docker
It contains the `helm` binary file. And some useful shell script file:

* `helm-build-and-push.sh` could login with the oci registry, then package and push it

## Argo Workflow
```yaml
  - name: helm-build
    inputs:
      parameters:
        - name: source
          default: "/work"
        - name: filename
        - name: repo
    container:
      image: docker.io/linuxsuren/helm-docker:master-v3.14.0
      args:
        - sh
        - /workspace/helm-build-and-push.sh
        - 172.11.0.6:30002
        - admin
        - Harbor12345
        - "{{inputs.parameters.repo}}"
        - "{{inputs.parameters.source}}"
        - "{{inputs.parameters.filename}}"
      workingDir: /work
      volumeMounts:
        - name: work
          mountPath: /work
```
