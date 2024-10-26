//ver.1.1
package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type Schedule struct{
	gorn.model
	scheduleID  	int			
    content 		string		
    day 			int			//yyyymmddの8桁
}