# CSI Flexadapter Driver

This repository hosts the CSI Flexadapter driver and all of its build and
dependent configuration files to deploy the driver.

## Testing manually

### Build the binary

```
make build-flexadapter
```

### Start Flexvolume adapter for simple nfs flexvolume driver

```
$ sudo ./bin/flexadapter --endpoint tcp://127.0.0.1:10000 --drivername simplenfs --driverpath ./examples/simplenfs-flexdriver/driver/nfs --nodeid CSINode -v=5
```

### Test using csc

```
GO111MODULE=off go get -u github.com/rexray/gocsi/csc
```

#### Get plugin info

```
$ csc identity plugin-info --endpoint tcp://127.0.0.1:10000
"simplenfs"	"0.1.0"
```

#### NodePublish a volume

```
$ csc node publish --endpoint tcp://127.0.0.1:10000 --target-path /mnt/nfs --attrib server=a.b.c.d --attrib share=nfs_share nfstestvol
nfstestvol
```

#### NodeUnpublish a volume

```
$ csc node unpublish --endpoint tcp://127.0.0.1:10000 --target-path /mnt/nfs nfstestvol
nfstestvol
```

#### Get node information

```
$ csc node get-info --endpoint tcp://127.0.0.1:10000
CSINode 0 (*csi.Topology)(nil)
$ csc node get-capabilities
--endpoint tcp://127.0.0.1:10000
&{}
```

## Community, discussion, contribution, and support

Learn how to engage with the Kubernetes community on the [community page](http://kubernetes.io/community/).

You can reach the maintainers of this project at:

- [Slack](http://slack.k8s.io/)
- [Mailing List](https://groups.google.com/forum/#!forum/kubernetes-dev)

### Code of conduct

Participation in the Kubernetes community is governed by the [Kubernetes Code of Conduct](code-of-conduct.md).

[owners]: https://git.k8s.io/community/contributors/guide/owners.md
[Creative Commons 4.0]: https://git.k8s.io/website/LICENSE
