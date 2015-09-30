#############################################################################
##
##                  CAPPresentationCategory package
##
##  Copyright 2015, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##                  Martin Bies,       ITP Heidelberg
##
#############################################################################

DeclareRepresentation( "IsCAPPresentationCategoryObjectRep",
                       IsCAPPresentationCategoryObject and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfCAPPresentationCategoryObjects",
            NewFamily( "TheFamilyOfCAPPresentationCategoryObjects" ) );

BindGlobal( "TheTypeOfCAPPresentationCategoryObject",
            NewType( TheFamilyOfCAPPresentationCategoryObjects,
                     IsCAPPresentationCategoryObjectRep ) );

#############################
##
## Constructors
##
#############################

##
InstallMethod( CAPPresentationCategoryObject,
               [ IsCapCategoryMorphism, IsCapCategory ],
  function( presentation_morphism, projective_category )
    local category, presentation_category_object;
  
    # check that the input is valid
    if not IsIdenticalObj( CapCategory( presentation_morphism ), projective_category ) then
    
      Error( "The morphism is not defined in the projective category. \n" );
      return false;
    
    fi;
    
    # then construct the object
    presentation_category_object := rec( );    
    ObjectifyWithAttributes( presentation_category_object, TheTypeOfCAPPresentationCategoryObject,
                             UnderlyingMorphism, presentation_morphism
    );

    # add it to the presentation category
    category := PresentationCategory( projective_category );
    Add( category, presentation_category_object );
    
    # and return the result
    return presentation_category_object;    

end );    

####################################
##
## View
##
####################################

InstallMethod( String,
              [ IsCAPPresentationCategoryObject ],
              
  function( presentation_category_object )
    
     return Concatenation( "An object of the presentation category over the ", 
                           Name( CapCategory( UnderlyingMorphism( presentation_category_object ) ) )
                           );
                    
end );


####################################
##
## Display
##
####################################

InstallMethod( Display,
               [ IsCAPPresentationCategoryObject ], 999, # FIX ME FIX ME FIX ME
               
  function( presentation_category_object )

     Print( Concatenation( "An object of the presentation category over the ", 
                            Name( CapCategory( UnderlyingMorphism( presentation_category_object ) ) ),
                            ". Presentation: \n"
                            ) );
  
     Display( UnderlyingMorphism( presentation_category_object ) );
     
end );


####################################
##
## ViewObj
##
####################################

InstallMethod( ViewObj,
               [ IsCAPPresentationCategoryObject ],

  function( presentation_category_object )

    Print( Concatenation( "<", String( presentation_category_object ), ">" ) );

end );


##############################################
##
## Non categorical methods
##
##############################################

##
#InstallMethodWithCacheFromObject( INTERNAL_HOM_EMBEDDING_IN_TENSOR_PRODUCT_LEFT,
#                                  [ IsLeftOrRightPresentation, IsLeftOrRightPresentation ],
                                  
#  function( object_1, object_2 )
#    local underlying_matrix_1, transposed_underlying_matrix_1, identity_matrix_2, differential_matrix, homalg_ring,
#          free_module_source, free_module_range, differential;
    
#    underlying_matrix_1 := UnderlyingMatrix( object_1 );
    
#    transposed_underlying_matrix_1 := Involution( underlying_matrix_1 );
    
#    identity_matrix_2 := UnderlyingMatrix( IdentityMorphism( object_2 ) );
    
#    differential_matrix := KroneckerMat( transposed_underlying_matrix_1, identity_matrix_2 );
    
#    homalg_ring := UnderlyingHomalgRing( object_1 );
    
#    free_module_source := FreeLeftPresentation( NrColumns( underlying_matrix_1 ), homalg_ring );
    
#    free_module_range := FreeLeftPresentation( NrRows( underlying_matrix_1 ), homalg_ring );
    
#    differential :=  PresentationMorphism( TensorProductOnObjects( free_module_source, object_2 ),
#                                           differential_matrix,
#                                           TensorProductOnObjects( free_module_range, object_2 )
#                                         );
    
#    return KernelEmbedding( differential );
    
#end );

##
#InstallMethodWithCacheFromObject( INTERNAL_HOM_EMBEDDING_IN_TENSOR_PRODUCT_RIGHT,
#                                  [ IsLeftOrRightPresentation, IsLeftOrRightPresentation ],
                                  
#  function( object_1, object_2 )
#    local underlying_matrix_1, transposed_underlying_matrix_1, identity_matrix_2, differential_matrix, homalg_ring,
#          free_module_source, free_module_range, differential;
    
#    underlying_matrix_1 := UnderlyingMatrix( object_1 );
    
#    transposed_underlying_matrix_1 := Involution( underlying_matrix_1 );
    
#    identity_matrix_2 := UnderlyingMatrix( IdentityMorphism( object_2 ) );
    
#    differential_matrix := KroneckerMat( transposed_underlying_matrix_1, identity_matrix_2 );
    
#    homalg_ring := UnderlyingHomalgRing( object_1 );
    
#    free_module_source := FreeRightPresentation( NrRows( underlying_matrix_1 ), homalg_ring );
    
#    free_module_range := FreeRightPresentation( NrColumns( underlying_matrix_1 ), homalg_ring );
    
#    differential :=  PresentationMorphism( TensorProductOnObjects( free_module_source, object_2 ),
#                                           differential_matrix,
#                                           TensorProductOnObjects( free_module_range, object_2 )
#                                         );
    
#    return KernelEmbedding( differential );
    
#end );