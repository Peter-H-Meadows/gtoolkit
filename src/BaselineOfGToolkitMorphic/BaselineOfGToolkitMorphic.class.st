Class {
	#name : #BaselineOfGToolkitMorphic,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMorphic
}

{ #category : #baseline }
BaselineOfGToolkitMorphic >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'BlocMorphic' with: [
				spec repository: 'github://feenkcom/Bloc:v0.8.121/src' ];
			baseline: 'GlutinMorphic' with: [
				spec repository: 'github://feenkcom/gtoolkit-glutin:v0.8.33/src' ].
		spec package: #'GToolkit-Morphic' with: [
				spec requires: #('BlocMorphic' 'GlutinMorphic' ). ]. ].

]