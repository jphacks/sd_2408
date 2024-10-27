package model

import(
	"gorm.io/gorm"
)

type DirectMessage struct{
	gorm.Model
	firstUserID int
	secondUserID int
	Messages []Message
}
