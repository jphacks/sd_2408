package model

import(
	"gorm.io/gorm"
)


type Calender struct{
	gorm.Model
	calenderID  	int
    groupID 		int
    day 			int
    schedule 		int		//yyyymmddの8桁
}
