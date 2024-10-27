//ver.1.0
package model

import(
	"gorm.io/gorm"
)

type User struct{
	gorm.Model
  Name 		string		//'gorm:"not null;index"'
  Birthday 	int			//yyyymmddの8桁
	Email		string
  Password 	string		//'gorm:"type:varchar(100);unique"'
  Place 		string
  GithubURL 	string
  SelfIntro 	string
  Image 		Image
  Preference  string 		//(興味のある技術)
}
