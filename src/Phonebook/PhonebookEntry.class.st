Class {
	#name : #PhonebookEntry,
	#superclass : #Object,
	#instVars : [
		'name',
		'company',
		'mail',
		'telephone'
	],
	#category : #Phonebook
}

{ #category : #'as yet unclassified' }
PhonebookEntry class >> name: aName telephone: aTelephone [

	^ self name: aName telephone: aTelephone company: nil
]

{ #category : #'as yet unclassified' }
PhonebookEntry class >> name: aName telephone: aTelephone company: aCompany [

	^ self name: aName telephone: aTelephone company: aCompany mail: nil
]

{ #category : #'as yet unclassified' }
PhonebookEntry class >> name: aName telephone: aTelephone company: aCompany mail: aMail [

	^ self new
		name: aName;
		telephone: aTelephone;
		company: aCompany;
		mail: aMail;
		yourself
]

{ #category : #private }
PhonebookEntry >> checkMatching: originalString with: lookupString [ 

	originalString ifNil: [ ^ false ].
	^ originalString includesSubstring: lookupString caseSensitive: false
]

{ #category : #accessing }
PhonebookEntry >> company [
	^ company
]

{ #category : #accessing }
PhonebookEntry >> company: anObject [
	company := anObject
]

{ #category : #finding }
PhonebookEntry >> hasMatchingText: aString [ 
	
	(self checkMatching: company with: aString) 
		ifTrue: [ ^ true ].
		
	(self checkMatching: mail with: aString) 
		ifTrue: [ ^ true ].

	(self checkMatching: name with: aString) 
		ifTrue: [ ^ true ].

	(self checkMatching: telephone with: aString) 
		ifTrue: [ ^ true ].

	^ false
]

{ #category : #accessing }
PhonebookEntry >> mail [
	^ mail
]

{ #category : #accessing }
PhonebookEntry >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
PhonebookEntry >> name [
	^ name
]

{ #category : #accessing }
PhonebookEntry >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PhonebookEntry >> telephone [
	^ telephone
]

{ #category : #accessing }
PhonebookEntry >> telephone: anObject [
	telephone := anObject
]
