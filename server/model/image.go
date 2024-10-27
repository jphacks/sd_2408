package model

import (
	"gorm.io/gorm"
)

type Image struct {
	gorm.Model
	UserID   int    `gorm:"not null;index"`
	FilePath string `gorm:"not null"`
}
