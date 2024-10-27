package model

import (
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Name         string   `gorm:"not null"`
	Birthday     int
	Email        string   `gorm:"not null;unique"`
	Password     string   `gorm:"not null"`
	Place        string
	GithubURL    string
	SelfIntro    string
	Image        Image    `gorm:"foreignKey:UserID"`
	Preference    string
	FollowIDs    []int    `gorm:"type:int[]"`
	GroupIDs     []int    `gorm:"type:int[]"`
	DirectMessageIDs []int `gorm:"type:int[]"`
}
