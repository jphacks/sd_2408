package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type Calender struct{
	gorn.model
	calenderID  	int			
    groupID 		int		
    day 			int
    schedule 		time.Time		//yyyymmddの8桁
}