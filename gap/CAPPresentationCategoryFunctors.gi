#############################################################################
##
## CAPPresentationCategory package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
## Presentation Category Functors
##
#############################################################################

InstallMethod( EmbeddingOfProjCategory,
               [ IsCapCategory ],

  function( projective_category )
    local pres_category, functor;

        if not IsProjCategory( projective_category ) then

          Error( "The input must be a Proj-category" );
          return;

        fi;

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

            return CAPPresentationCategoryObject( ZeroMorphism( ZeroObject( projective_category ),  object ) );

        end );

        # and the operation on the morphisms
        AddMorphismFunction( functor,

          function( new_source, morphism, new_range )

            return CAPPresentationCategoryMorphism( new_source, morphism, new_range, pres_category!.constructor_checks_wished );

        end );

        # and finally return this functor
        return functor;

end );