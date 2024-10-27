package model

import(

	"gorm.io/gorm"
)
type Message struct {
	gorm.Model
	UserID int
	Message string
}
