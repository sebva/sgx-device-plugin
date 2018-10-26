Kubernetes Device Plugin for Intel SGX
======================================

The goal of this device plugin is to enable the execution of SGX applications on Kubernetes nodes.
It fetches the number of trusted EPC pages available on each node (if the information is available), and communicates it to Kubelet.
It can be used standalone, or in conjunction with the other components that make up our [SGX-aware container orchestrator](https://github.com/sebva/sgx-orchestrator).

In order to deploy the device plugin to your Kubernetes cluster, it suffices to create a DaemonSet using the following command:
```
$ kubectl apply -f sgx_deviceplugin.yml
```

If using our [custom Intel SGX driver](https://github.com/sebva/linux-sgx-driver), the device plugin will query it to limit EPC usage to the right amount of pages.
Otherwise, it will register 23936 pages, which is the maximum offered by SGX v1 CPUs (= 93.5 MiB).  

Acknowledgment and licensing
----------------------------

This component is part of our [SGX-aware container orchestrator](https://github.com/sebva/sgx-orchestrator), which is itself part of the [SecureCloud project](https://www.securecloudproject.eu/).
SecureCloud has received funding from the European Union's Horizon 2020 research and innovation programme and was supported by the Swiss State Secretariat for Education, Research and Innovation (SERI) under grant agreement No 690111.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program.
If not, see <http://www.gnu.org/licenses/>.

Citing this work in your own research article
---------------------------------------------

This component has been developed as part of a research effort that led to the publication of our article entitled _"[SGX-Aware Container Orchestration for Heterogeneous Clusters](https://ieeexplore.ieee.org/document/8416339)"_ in the proceedings of the [38th IEEE International Conference on Distributed Computing Systems (ICDCS 2018)](http://icdcs2018.ocg.at/).
If you use this work in your research, please cite our paper using the following BibTeX entry:

```
@inproceedings{vaucher2018sgxaware,
    author={S. Vaucher and R. Pires and P. Felber and M. Pasin and V. Schiavoni and C. Fetzer},
    booktitle={2018 IEEE 38th International Conference on Distributed Computing Systems (ICDCS)},
    title={{SGX}-Aware Container Orchestration for Heterogeneous Clusters},
    month={July},
    year={2018},
    pages={730-741},
    doi={10.1109/ICDCS.2018.00076},
    issn={2575-8411},
}
```
