Class {
	#name : #PhonebookEntryTest,
	#superclass : #TestCase,
	#instVars : [
		'entry'
	],
	#category : #'Phonebook-Tests'
}

{ #category : #tests }
PhonebookEntryTest >> setUp [
	super setUp.

	entry := PhonebookEntry
		name: 'Sir A. Name'
		telephone: '11223344'
		company: 'ACME Company'
		mail: 'email@acme.com'
]

{ #category : #tests }
PhonebookEntryTest >> testHasMatchingTextChecksCompany [

	self assert: (entry hasMatchingText: 'Compa')
]

{ #category : #tests }
PhonebookEntryTest >> testHasMatchingTextChecksCompanyWithoutCaringCase [

	self assert: (entry hasMatchingText: 'compa')
]

{ #category : #tests }
PhonebookEntryTest >> testHasMatchingTextChecksEmail [

	self assert: (entry hasMatchingText: 'email')
]

{ #category : #tests }
PhonebookEntryTest >> testHasMatchingTextChecksName [

	self assert: (entry hasMatchingText: 'Name')
]

{ #category : #tests }
PhonebookEntryTest >> testHasNotMatchingText [

	self deny: (entry hasMatchingText: 'NoExists')
]
