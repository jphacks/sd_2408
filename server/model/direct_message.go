package model

import (
	"gorm.io/gorm"
)

type DirectMessage struct {
	gorm.Model
	FirstUserID  int      `gorm:"not null"`
	SecondUserID int      `gorm:"not null"`
	Messages      []Message `gorm:"foreignKey:DirectMessageID"`
}
