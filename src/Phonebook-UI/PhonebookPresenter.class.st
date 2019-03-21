Class {
	#name : #PhonebookPresenter,
	#superclass : #ComposablePresenterWithModel,
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
	^ SpecBoxLayout newHorizontal
		add:
			(SpecBoxLayout newVertical
				add: #entriesList;
				add: (SpecBoxLayout newHorizontal
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

{ #category : #accessing }
PhonebookPresenter >> detailsPanel [
	^ detailsPanel
]

{ #category : #accessing }
PhonebookPresenter >> entriesList [
	^ entriesList
]

{ #category : #initialization }
PhonebookPresenter >> initializePresenter [

	removeButton enabled: false.
	
	entriesList 
		items: self model entries asOrderedCollection;
		displayBlock: [ :entry | entry name asString, ' (' , entry telephone asString, ')' ];
		whenSelectionChangedDo: [ :sel | 
			detailsPanel model: sel selectedItem.
			removeButton enabled: sel isEmpty not ].
	
	
]

{ #category : #initialization }
PhonebookPresenter >> initializeWidgets [
	
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

{ #category : #accessing }
PhonebookPresenter >> removeButton [
	^ removeButton
]

{ #category : #initialization }
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
