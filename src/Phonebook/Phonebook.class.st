Class {
	#name : #Phonebook,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #Phonebook
}

{ #category : #adding }
Phonebook >> addEntry: anEntry [

	entries add: anEntry.
	
]

{ #category : #accessing }
Phonebook >> entries [
	^ entries
]

{ #category : #adding }
Phonebook >> findEntriesWithText: aText [

	^ entries select: [ :e | e hasMatchingText: aText ]	
]

{ #category : #testing }
Phonebook >> includesEntry: aPhonebookEntry [ 
	
	^ entries includes: aPhonebookEntry
]

{ #category : #adding }
Phonebook >> initialize [

	super initialize.
	entries := Set new.
]

{ #category : #adding }
Phonebook >> removeEntry: anEntry [

	entries remove: anEntry.
	
]

{ #category : #adding }
Phonebook >> size [

	^ entries size
]
