Class {
	#name : #GtDependencyAnalyzerPackagePackageRequirement,
	#superclass : #GtDependencyAnalyzerPackageRequirement,
	#instVars : [
		'requiredPackageFromBaselineAnalyzer'
	],
	#category : #'GToolkit-DependencyAnalyzer'
}

{ #category : #dependencies }
GtDependencyAnalyzerPackagePackageRequirement >> explicitlyRequiredPackagesWithContext: aGtDependencyAnalyzerContext [
	<return: #Array of: #GtDependencyAnalyzerForPackageFromBaseline>
	| explicitlyRequiredPackages |
	
	explicitlyRequiredPackages := (requiredPackageFromBaselineAnalyzer baselineAnalyzer = packageFromBaseline baselineAnalyzer
		ifTrue: [ requiredPackageFromBaselineAnalyzer explicitlyRequiredPackagesWithContext: aGtDependencyAnalyzerContext ]
		ifFalse: [ { } ]) asSet.

	explicitlyRequiredPackages add: requiredPackageFromBaselineAnalyzer.

	self
		assert: [ (explicitlyRequiredPackages includes: packageFromBaseline) not ]
		description: [ 'Package can not depend on itself ', packageFromBaseline printString ].
	
	^ explicitlyRequiredPackages asArray
]

{ #category : #dependencies }
GtDependencyAnalyzerPackagePackageRequirement >> implicitlyRequiredPackagesWithContext: aGtDependencyAnalyzerContext [
	<return: #Array of: #GtDependencyAnalyzerForPackageFromBaseline>
	| implicitlyRequiredPackages |
	
	implicitlyRequiredPackages := Set new.
	(self explicitlyRequiredPackagesWithContext: aGtDependencyAnalyzerContext) do: [ :eachPackage |
		implicitlyRequiredPackages add: eachPackage.
		implicitlyRequiredPackages addAll: (eachPackage implicitlyRequiredPackagesWithContext: aGtDependencyAnalyzerContext) ].

	self
		assert: [ (implicitlyRequiredPackages includes: packageFromBaseline) not ]
		description: [ 'Package can not depend on itself ', packageFromBaseline printString ].

	^ implicitlyRequiredPackages asArray
]

{ #category : #printing }
GtDependencyAnalyzerPackagePackageRequirement >> printOn: aStream [
	aStream print: self requiredPackageFromBaselineAnalyzer
]

{ #category : #accessing }
GtDependencyAnalyzerPackagePackageRequirement >> requiredPackageFromBaselineAnalyzer [
	^ requiredPackageFromBaselineAnalyzer
]

{ #category : #accessing }
GtDependencyAnalyzerPackagePackageRequirement >> requiredPackageFromBaselineAnalyzer: anObject [
	requiredPackageFromBaselineAnalyzer := anObject
]