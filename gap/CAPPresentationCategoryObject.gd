#############################################################################
##
## CAPPresentationCategory package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
#! @Chapter Objects
##
#############################################################################


#############################
##
#! @Section GAP Category
##
#############################

#! @Description
#! The GAP category of objects in the presentation category over a proj-category $P$.
#! @Arguments object
DeclareCategory( "IsCAPPresentationCategoryObject",
                 IsCapCategoryObject );



#############################
##
#! @Section Constructors
##
#############################

#! @Description
#! The argument is a CAPCategoryMorphism $m$ in a Proj-category. This morphism is then considered as an
#! object in the presentation category.
#! @Returns a CAPCategoryObject
#! @Arguments m
DeclareOperation( "CAPPresentationCategoryObject",
                  [ IsCapCategoryMorphism ] );

#! For morphisms we support the possibility to turn off consistency checks on the input data. For the constructor of objects
#! this is not possible. This is because the only check is if the morphism is a morphism in a Proj-category. This in turn
#! is checked by constructing the presentation category of the category in which the morphism is defined. The latter in turn is
#! an attribute of a CapCategory and thus is constructed only once. In this sense the given constructor is already optimal.



#############################
##
#! @Section Attributes
##
#############################

#! @Description
#! The argument is an object $A$ of the presentation category over a proj-category $P$. Every such object
#! is encoded by a morphism in the underlying proj-category. The output is such a morphism in the proj-category.
#! @Returns a CAPCategoryMorphism
#! @Arguments A
DeclareAttribute( "UnderlyingMorphism",
                  IsCAPPresentationCategoryObject );



####################################################
##
#! @Section Printing all information about an object
##
####################################################

#! @Description
#! The argument is an object $A$ in the presentation category. For such an object it can be tedious 
#! to work out all the details of the underlying defining morphism (such a source, ranges and the mapping matrix). 
#!  To encompass this shortcoming, this method produces all this information with just a single command.
#! @Returns detailed information about the object A
#! @Arguments A
DeclareOperation( "FullInformation",
                 [ IsCAPPresentationCategoryObject ] );



##############################################
##
#! @Section Hom-Embedding
##
##############################################

#! @Description
#! The arguments are two objects <A>a</A> and <A>b</A> of the presentation category. 
#! Given that $a$ is represented as $\alpha \colon R_A \to A$, we have the exact sequence
#! $0 \to Hom \left( a,b \right) \to A^\vee \otimes b \to R_A^\vee \otimes b$. The latter map is
#! given by $\alpha^\vee \otimes 1_b$. The kernel of this map is the Hom-embedding computed by this map.
#! @Returns a morphism
#! @Arguments a, b
DeclareOperationWithCache( "INTERNAL_HOM_EMBEDDING_IN_TENSOR_PRODUCT",
                           [ IsCAPPresentationCategoryObject, IsCAPPresentationCategoryObject ] );
