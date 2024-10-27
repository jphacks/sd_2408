package model

import (
	"gorm.io/gorm"
)

type Group struct {
	gorm.Model
	Users    []User    `gorm:"many2many:user_groups;"`
	Messages []Message  `gorm:"foreignKey:GroupID"`
	Name     string     `gorm:"not null"`
}
