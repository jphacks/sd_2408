//ver.1.1
package model

import(
	"gorm.io/gorm"
)

type Schedule struct{
	gorm.Model
	scheduleID  	int
    content 		string
    day 			int			//yyyymmddの8桁
}
