# Trivy

Docker image with alpine linux and [Trivy](https://github.com/aquasecurity/trivy) for container scanning.  
Includes template for gitlab-ci dependency scanning output.

Images are buildt automatically from source for AMD64 and Aarch64.

## Tags

Tags are based on the latest Trivy version at build time.    
Check tags in registry for up to date tags.

### DockerHub

* `jitesoft/trivy`
    * `0.8.0`, `latest`

### GitLab

* `registry.gitlab.com/jitesoft/dockerfiles/trivy`
    * `0.8.0`, `latest`

## Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## License

Trivy is released under the [Apache2 license](https://www.php.net/license/index.php).  
The files in this repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/trivy/blob/master/LICENSE).

**observe**  
Trivy uses vulnerability information from a variety of sources, some of which are licensed for non-commercial use only.  


## GitLab scan

The gitlab-scan.yml is a convinience scan template to use Trivy for dependency scanning in gitlab ci as an include:

```yaml
include:
  - file: /gitlab-scan.yml
    project: jitesoft/dockerfiles

scan:
    extends: .container_scanning
```
