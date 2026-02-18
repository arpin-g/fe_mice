# Local Iron Overload Effects On Fibroblast Subpopulations

We analyzed 4 samples of healthy(2) and local iron-overload(2) mice back skin 
scRNA-seq data. Disease was modeled by local iron-dextran deposition in mice 
dermis, mimicking human lipodermatosclerosis. Our analysis revealed substantial
tissue remodeling, favoring angiogenic fibroblasts.

## Authors

Contributors names and contact info

Arpine Grigoryan (a.grigoryan@epfl.ch)
Melina Tamazyan (melina.tamazyan@abi.am)

## Description

1. PRE-PROCESSING
First 4 seurat objects were constructed, filtered and processed
2 control (dx) samples were integrated together, and saved into 
rds/dx_integrated.rds (here we have all celltypes)

2 case (fedx) samples were integrated together, and saved into 
rds/fedx_integrated.rds (here we have all celltypes, no annotation)

2. LABEL TRANSFER
Using Helm et al 2023 as reference, we annotate our cell types 
in DX only, saved in
rds/dx_integrated.rds (here we have all celltypes, annotated)

3. FOCUSING ONLY ON FIBROBLASTS
We decided to focus only on fibroblasts, so we subset fibros 
from dx_integrated.rds

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
