Class {
	#name : #PhonebookTest,
	#superclass : #TestCase,
	#instVars : [
		'phonebook',
		'includedEntry',
		'nonIncludedEntry'
	],
	#category : #'Phonebook-Tests'
}

{ #category : #running }
PhonebookTest >> setUp [ 

	super setUp.
	phonebook := Phonebook new.
	includedEntry := PhonebookEntry name: 'Included Entry' telephone: '11223344'.
	nonIncludedEntry := PhonebookEntry name: 'No Entry' telephone: '00223344'.
	
	phonebook addEntry: includedEntry 
]

{ #category : #tests }
PhonebookTest >> testAddingAnEntryAddsTheEntry [

	phonebook addEntry: nonIncludedEntry.
	
	self assert: phonebook size equals: 2.
]

{ #category : #tests }
PhonebookTest >> testAddingAnEntryNowIncludesEntry [

	phonebook addEntry: nonIncludedEntry.
	
	self assert: (phonebook includesEntry: nonIncludedEntry).
]

{ #category : #tests }
PhonebookTest >> testAddingTheSameEntryTwiceDoesNotIncreaseTheSize [

	phonebook addEntry: includedEntry.
	
	self assert: phonebook size equals: 1.
]

{ #category : #tests }
PhonebookTest >> testDoesNotFindANonIncludedEntry [

	self assert: (phonebook findEntriesWithText: 'No') size equals: 0
]

{ #category : #tests }
PhonebookTest >> testFindsAnIncludedEntry [

	self assertCollection: (phonebook findEntriesWithText: 'Included') hasSameElements: {includedEntry}
]
