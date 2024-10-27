package model

import (
	"gorm.io/gorm"
)

type Message struct {
	gorm.Model
	UserID  int    `gorm:"not null;index"`
	Message string `gorm:"not null"`
	GroupID int
}
