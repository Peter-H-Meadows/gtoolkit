Class {
	#name : #GtNotificationIcebergCredentialsElement,
	#superclass : #GtNotificationEventElement,
	#category : #'GToolkit-Notifications-Iceberg'
}

{ #category : #'private - accessing' }
GtNotificationIcebergCredentialsElement >> acceptCallbackDo: aBlock [
	self notificationDo: [ :aNotification |
		aNotification acceptCallback ifNotNil: aBlock ]
]

{ #category : #'private - accessing' }
GtNotificationIcebergCredentialsElement >> cancelCallbackDo: aBlock [
	self notificationDo: [ :aNotification |
		aNotification cancelCallback ifNotNil: aBlock ]
]

{ #category : #'private - accessing' }
GtNotificationIcebergCredentialsElement >> credentialStoreDo: aBlock [
	self notificationDo: [ :aNotification |
		aNotification credentialStore ifNotNil: aBlock ]
]

{ #category : #'private - accessing' }
GtNotificationIcebergCredentialsElement >> credentialsDo: aBlock [
	self notificationDo: [ :aNotification |
		aNotification credentials ifNotNil: aBlock ]
]

{ #category : #'private - accessing' }
GtNotificationIcebergCredentialsElement >> hostDo: aBlock [
	self credentialsDo: [ :aCreedentials |
		aCreedentials host ifNotNil: aBlock ]
]