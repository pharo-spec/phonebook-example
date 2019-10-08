Class {
	#name : #PhonebookPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'entriesList',
		'addButton',
		'removeButton',
		'detailsPanel'
	],
	#category : #'Phonebook-UI'
}

{ #category : #specs }
PhonebookPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add:
			(SpBoxLayout newVertical
				add: #entriesList;
				add: (SpBoxLayout newHorizontal
							add: #addButton;
							add: #removeButton;
							yourself) 
				expand: false
				fill: false
				padding: 0;
				yourself);
		add: #detailsPanel;
		yourself
]

{ #category : #accessing }
PhonebookPresenter >> addButton [
	^ addButton
]

{ #category : #initialization }
PhonebookPresenter >> connectPresenters [
	removeButton enabled: false.
	entriesList
		items: self model entries asOrderedCollection;
		display: [ :entry | entry name asString , ' (' , entry telephone asString , ')' ];
		whenSelectionChangedDo: [ :sel | 
			detailsPanel model: sel selectedItem.
			removeButton enabled: sel isEmpty not ]
]

{ #category : #accessing }
PhonebookPresenter >> detailsPanel [
	^ detailsPanel
]

{ #category : #accessing }
PhonebookPresenter >> entriesList [
	^ entriesList
]

{ #category : #initialization }
PhonebookPresenter >> initializePresenters [
	
	entriesList := self newList.

	addButton := self newButton
		label: 'Add';
		yourself.

	removeButton := self newButton
		label: 'Remove';
		action: [ self removeEntry ]
		yourself.
	
	detailsPanel := self instantiate: PhonebookEntryPresenter on: nil.
]

{ #category : #initialization }
PhonebookPresenter >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self title
]

{ #category : #accessing }
PhonebookPresenter >> removeButton [
	^ removeButton
]

{ #category : #adding }
PhonebookPresenter >> removeEntry [
	self entriesList selection selectedItem ifNil: [ ^ self ].
	self model removeEntry: self entriesList selection selectedItem.

	self entriesList unselectAll.
	self entriesList items: self model entries
]

{ #category : #initialization }
PhonebookPresenter >> title [

	^ 'Pharo Phonebook'
]
