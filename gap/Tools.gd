#############################################################################
##
## CAPPresentationCategory
##
## Copyright 2019,  Martin Bies,       ULB Brussels
##
#! @Chapter Convenience methods
##
#############################################################################


####################################################################################
##
#! @Section Powers of objects and morphisms
##
####################################################################################

#!
DeclareOperation( "\*",
               [ IsCAPPresentationCategoryObject, IsCAPPresentationCategoryObject ] );

#!
DeclareOperation( "\^",
               [ IsCAPPresentationCategoryObject, IsInt ] );

#!
DeclareOperation( "\*",
               [ IsCAPPresentationCategoryMorphism, IsCAPPresentationCategoryMorphism ] );

#!
DeclareOperation( "\^",
               [ IsCAPPresentationCategoryMorphism, IsInt ] );



####################################################################################
##
#! @Section Determine if a category is a Proj-category
##
####################################################################################

DeclareGlobalFunction( "IsProjCategory" );

DeclareGlobalFunction( "IsMonoidalStructurePresent" );
