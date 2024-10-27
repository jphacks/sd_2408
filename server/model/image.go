//ver.1.1
package model

import(
	"gorm.io/gorm"
)

type Image struct{
	gorm.Model
  UserID 		int
  FilePath 		string
}
