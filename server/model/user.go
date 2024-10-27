//ver.1.0
package model

import(
	"gorm.io/gorm"
)

type User struct{
	gorm.Model
	userID  	int			//'gorm:"not null;index"'
    name 		string		//'gorm:"not null;index"'
    birthday 	int			//yyyymmddの8桁
	email		string
    Password 	string		//'gorm:"type:varchar(100);unique"'
    place 		string
    githubURL 	string
    selfIntro 	string
    image 		Image
    preference  string 		//(興味のある技術)
}
