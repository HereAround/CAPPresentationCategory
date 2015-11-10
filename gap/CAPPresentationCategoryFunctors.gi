#############################################################################
##
##                  CAPPresentationCategory package
##
##  Copyright 2015, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##                  Martin Bies,       ITP Heidelberg
##
## Presentation Category Functors
##
#############################################################################

InstallMethod( EmbeddingOfProjCategory,
               [ IsProjCategory ],
                   
  function( projective_category )
    local pres_category, functor;
        
        # define the presentation category
        pres_category := PresentationCategory( projective_category );
        
        # and set up the basics of this functor
        functor := CapFunctor( Concatenation( "Embedding of the projective category ", Name( projective_category ), 
                               " into its presentation category" ), 
                               projective_category, 
                               pres_category
                               );
        
        # now define the operation on the objects
        AddObjectFunction( functor,
                           
          function( object )
          
            return CAPPresentationCategoryObject( 
                                 ZeroMorphism( ZeroObject( projective_category ),  object ),
                                 projective_category
                                 );

        end );
        
        # and the operation on the morphisms        
        AddMorphismFunction( functor,
                             
          function( new_source, morphism, new_range )
                        
            return CAPPresentationCategoryMorphism( new_source, morphism, new_range );
            
        end );
        
        # and finally return this functor
        return functor;

end );