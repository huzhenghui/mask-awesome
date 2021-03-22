---
pandocomatic_:
    pandoc:
        from: markdown-smart+tex_math_dollars
        to: gfm+tex_math_dollars
        filter:
        - pandoc-include-code
        lua-filter:
        - ./build/pandoc-lua-filters/include-files/include-files.lua
        output: README.md
...

# minikube-dashboard

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## docker-open

```bash
open -a Docker
```

## minikube-addons-list

```bash
minikube addons list | sed '1d;$d'
```

### minikube-addons-list-output

```{.include}
./build/minikube-addons-list.md
```

## minikube-start

```bash
minikube start
```

## kubectl-get-pods

``` bash
kubectl get pods --all-namespaces
```

## kubectl-get-pods-kubernetes-dashboard

``` bash
kubectl get pods --namespace=kubernetes-dashboard
```

### kubectl-get-pods-kubernetes-dashboard-output

```{.plain include=./build/kubectl-get-pods-kubernetes-dashboard-output.txt}
```

## minikube-dashboard-url

```bash
minikube dashboard --url=true
```

## kubectl-apply-minikube-dashboard-port

```bash
kubectl apply -f minikube-dashboard-port.kubernetes.yaml
```

### minikube-dashboard-port.yaml

```{.yaml include=./minikube-dashboard-port.kubernetes.yaml}
```

### kubectl-apply-minikube-dashboard-port-output

```{.plain include=./build/kubectl-apply-minikube-dashboard-port-output.txt}
```

## kubectl-get-service-kubernetes-dashboard

``` bash
kubectl get service --namespace=kubernetes-dashboard
```

### kubectl-get-service-kubernetes-dashboard-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/kubectl-get-service-kubernetes-dashboard-output.txt}
```
<!-- markdownlint-enable MD013 -->

## kubectl-get-service-kubernetes-dashboard-port

``` bash
kubectl get service kubernetes-dashboard-port --namespace=kubernetes-dashboard
```

### kubectl-get-service-kubernetes-dashboard-port-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/kubectl-get-service-kubernetes-dashboard-port-output.txt}
```
<!-- markdownlint-enable MD013 -->

## minikube-service-kubernetes-dashboard-port

```bash
minikube service kubernetes-dashboard-port --namespace=kubernetes-dashboard
```

## kubectl-port-forward-kubernetes-dashboard-port

```bash
kubectl port-forward service/kubernetes-dashboard-port 9090: --namespace=kubernetes-dashboard
```

<http://localhost:9090/>

## kubectl-delete-kubernetes-dashboard-port

```bash
kubectl delete services kubernetes-dashboard-port --namespace=kubernetes-dashboard
```

## fselect-name-minikube-dashboard

```bash
relpath="$(urelpath "$(git root)")"
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[', path, '](${relpath}/', path, ')'), size, mime, line_count \
    from . gitignore \
    where name like '%minikube%' and name like '%dashboard%' \
    order by path"
```

### fselect-name-minikube-dashboard-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/markdown/fselect-name-minikube-dashboard-output.md
```
<!-- markdownlint-enable MD013 -->

## fselect-contains-minikube-dashboard

```bash
relpath="$(urelpath "$(git root)")"
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[', path, '](${relpath}/', path, ')'), size, mime, line_count \
    from . gitignore \
    where contains(minikube) = true and contains(dashboard) = true\
    order by path"
```

### fselect-contains-minikube-dashboard-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/markdown/fselect-contains-minikube-dashboard-output.md
```
<!-- markdownlint-enable MD013 -->

## minikube-dashboard-help

``` bash
minikube dashboard --help
```

### minikube-dashboard-help-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/minikube-dashboard-help-output.txt}
```
<!-- markdownlint-enable MD013 -->

## minikube-options

```bash
minikube options
```

### minikube-options-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/minikube-options-output.txt}
```
<!-- markdownlint-enable MD013 -->

## begin: mask task in template : build content

## ninja-rules

```bash
ninja -t rules
```

### ninja custom-rule

```{.ninja include=build.ninja snippet=custom-rule}
```

### ninja-rules-output

```{.plain include=./build/ninja/ninja-rules-output.txt}
```

## ninja-targets

```bash
ninja -t targets all
```

### ninja build-all

```{.ninja include=build.ninja snippet=build-all}
```

### ninja custom-build

```{.ninja include=build.ninja snippet=custom-build}

```

### ninja report-build

```{.ninja include=build.ninja snippet=report-build}

```

### ninja-targets-output

```{.plain include=./build/ninja/ninja-targets-output.txt}
```

## readme-md

```bash
ninja --verbose README.md
```

### ninja readme-build

```{.ninja include=build.ninja snippet=custom-readme-build}
```

```{.ninja include=build.ninja snippet=readme-build}
```

## end: mask task in template : build content

## begin: mask task in template : ninja command

## ninja-browse

```bash
ninja -t browse
```

## ninja-graph-png

```bash
dot -Tpng -o./build/ninja/ninja.graph.png ./build/ninja/ninja.graph.dot
```

![ninja](./build/ninja/ninja.graph.png)

## ninja-graph-dot-xdot

```bash
detach -- xdot "${MASKFILE_DIR}/build/ninja/ninja.graph.dot"
```

## ninja-graph-dot

```bash
ninja -t graph
```

### ninja-graph-dot-output

```{.dot include=./build/ninja/ninja.graph.dot}
```

## ninja-all

```bash
ninja --verbose
```

### build.ninja

```{.ninja include=./build.ninja}
```

## end: mask task in template : ninja command
