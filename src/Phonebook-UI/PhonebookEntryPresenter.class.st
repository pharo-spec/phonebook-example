Class {
	#name : #PhonebookEntryPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'nameLabelLabel',
		'companyLabelLabel',
		'telephoneLabelLabel',
		'emailLabelLabel',
		'nameLabel',
		'companyLabel',
		'telephoneLabel',
		'emailLabel'
	],
	#category : #'Phonebook-UI'
}

{ #category : #specs }
PhonebookEntryPresenter class >> defaultSpec [ 

	^ SpGridLayout new
		add: #nameLabelLabel at: 1@1;	
		add: #nameLabel at: 2@1;
		add: #companyLabelLabel at: 1@2;	
		add: #companyLabel at: 2@2;
		add: #telephoneLabelLabel at: 1@3;	
		add: #telephoneLabel at: 2@3;
		add: #emailLabelLabel at: 1@4;	
		add: #emailLabel at: 2@4;
		beColumnNotHomogeneous;
		yourself
]

{ #category : #initialization }
PhonebookEntryPresenter >> initializePresenter [
	
	self modelChanged

]

{ #category : #initialization }
PhonebookEntryPresenter >> initializeWidgets [
	
	nameLabelLabel := self newLabel label: 'Name:'; yourself.
	companyLabelLabel := self newLabel label: 'Company:'; yourself.
	telephoneLabelLabel := self newLabel label: 'Telephone:'; yourself.
	emailLabelLabel := self newLabel label: 'Email:'; yourself.
	
	nameLabel := self newLabel.
	companyLabel := self newLabel.
	telephoneLabel := self newLabel.
	emailLabel := self newLabel.


]

{ #category : #initialization }
PhonebookEntryPresenter >> modelChanged [ 

	self setLabel: nameLabel field: #name.
	self setLabel: companyLabel field: #company.
	self setLabel: telephoneLabel field: #telephone.
	self setLabel: emailLabel field: #mail.

]

{ #category : #accessing }
PhonebookEntryPresenter >> nameLabel [
	^ nameLabel
]

{ #category : #initialization }
PhonebookEntryPresenter >> setLabel: aLabelPresenter field: aSymbol [.

	self model ifNil: [  
		aLabelPresenter label: ''.
		^ self	].
		
	aLabelPresenter label: ((self model perform: aSymbol) ifNil: [ '' ])		

]
