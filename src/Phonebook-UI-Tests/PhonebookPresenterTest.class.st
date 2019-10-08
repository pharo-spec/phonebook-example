Class {
	#name : #PhonebookPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter',
		'phonebook',
		'window'
	],
	#category : #'Phonebook-UI-Tests'
}

{ #category : #running }
PhonebookPresenterTest >> setUp [

	super setUp.
	phonebook := Phonebook new.
	phonebook addEntry: (PhonebookEntry name: 'A Person' telephone: '11223344' ).

	presenter := PhonebookPresenter on: phonebook.
	
	presenter application: SpApplication new.
	window := presenter openWithSpec

]

{ #category : #running }
PhonebookPresenterTest >> tearDown [

	presenter ifNotNil: [ :x | x application close ].
	super tearDown

]

{ #category : #running }
PhonebookPresenterTest >> testAddButtonHasLabel [

	self assert: presenter addButton adapter label equals: 'Add'
]

{ #category : #running }
PhonebookPresenterTest >> testAddButtonIsBelowEntryList [

	self assert: (presenter addButton isBelowOf: presenter entriesList)
]

{ #category : #running }
PhonebookPresenterTest >> testAddButtonIsLeftOfRemoveButton [

	self assert: (presenter addButton isLeftOf: presenter removeButton)
]

{ #category : #running }
PhonebookPresenterTest >> testClickingAddButtonOpenANewWindow [

	presenter addButton click.
	self assert: presenter application windows size equals: 2
]

{ #category : #running }
PhonebookPresenterTest >> testClickingDisabledRemoveButtonDoesNotAffect [

	presenter removeButton click.
	self assert: phonebook size equals: 1
]

{ #category : #running }
PhonebookPresenterTest >> testClickingRemoveButtonRemovesAnElementFromTheList [

	presenter entriesList selectIndex: 1.
	presenter removeButton click.

	self assert: presenter entriesList items size equals: 0
]

{ #category : #running }
PhonebookPresenterTest >> testClickingRemoveButtonRemovesDisablesRemoveButton [

	presenter entriesList selectIndex: 1.
	presenter removeButton click.

	self deny: presenter removeButton isEnabled
]

{ #category : #running }
PhonebookPresenterTest >> testClickingRemoveButtonRemovesTheEntry [

	presenter entriesList selectIndex: 1.
	presenter removeButton click.

	self assert: phonebook size equals: 0
]

{ #category : #running }
PhonebookPresenterTest >> testRemoveButtonHasLabel [

	self assert: presenter removeButton adapter label equals: 'Remove'
]

{ #category : #running }
PhonebookPresenterTest >> testRemoveButtonStartsDisabled [

	self deny: presenter removeButton isEnabled
]

{ #category : #running }
PhonebookPresenterTest >> testSelectingAnElementEnablesRemoveButton [

	presenter entriesList selectIndex: 1.
	self assert: presenter removeButton isEnabled
]

{ #category : #running }
PhonebookPresenterTest >> testSelectingAnElementUpdatesDetailName [

	presenter entriesList selectIndex: 1.

	self assert: presenter detailsPanel nameLabel label equals: 'A Person'.
]

{ #category : #running }
PhonebookPresenterTest >> testStartsWithoutSelection [

	self assert: presenter entriesList selection isEmpty
]

{ #category : #running }
PhonebookPresenterTest >> testWindowHasAddButton [

	self assert: (window hasPresenter: presenter addButton)
]

{ #category : #running }
PhonebookPresenterTest >> testWindowHasEntryList [

	self assert: (window hasPresenter: presenter entriesList)
]

{ #category : #running }
PhonebookPresenterTest >> testWindowHasRemoveButton [

	self assert: (window hasPresenter: presenter addButton)
]

{ #category : #running }
PhonebookPresenterTest >> testWindowTitle [

	self assert: window title equals: 'Pharo Phonebook'.
]
