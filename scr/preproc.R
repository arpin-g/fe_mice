library(Seurat)
library(ggplot2)
library(sctransform)

# Step 1 creating the seurat object for the 4 samples.         changing this
sample <- Read10X(data.dir = "data/MT_FeDX_2/")
seurat <- CreateSeuratObject(counts = sample)

# Step 2: detecting mitochondiral contamination and storing it in seurat object meta data
seurat <- PercentageFeatureSet(seurat, pattern = "^mt-", col.name = "percent.mt")

VlnPlot(seurat, features = c("nCount_RNA", "nFeature_RNA", "percent.mt"))

# dx1
seurat <- subset(seurat,
                 subset = nFeature_RNA > 200 &
                   nFeature_RNA < 7000 &
                   nCount_RNA < 40000 & 
                   percent.mt < 20)

# dx2
seurat <- subset(seurat,
                 subset =nCount_RNA < 40000 & 
                   nFeature_RNA > 200 &
                   nFeature_RNA < 7500 &
                   percent.mt < 20)
# fedx1
seurat <- subset(seurat,
                 subset = nCount_RNA < 40000 & 
                   nFeature_RNA > 200 &
                   nFeature_RNA < 6000 &
                   percent.mt < 20)

# fedx2
seurat <- subset(seurat,
                 subset = nCount_RNA < 30000 & 
                   nFeature_RNA > 200 &
                   nFeature_RNA < 6000 &
                   percent.mt < 20)

# Step 4: running sctransform (it does all the neccessary data transformations)
seurat <- SCTransform(seurat, verbose = T)

# Step 5: adding sample information into meta data and cell names 
seurat$sample <- "fedx2"
seurat <- RenameCells(seurat, new.names = paste0(seurat$sample, "_", Cells(seurat)))
Cells(seurat)
seurat$sample <- "FeDX2"
seurat$group <- "FeDX"

# Step 6: saving the seurat object
saveRDS(seurat, "rds/fedx2_filtered.rds")