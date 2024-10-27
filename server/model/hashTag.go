//ver.1.1
package model

import(
	"gorm.io/gorm"
)

type HashTag struct{
	gorm.Model
	hashTagID  		int			//ここ未定
    name 			string
    groupIDs 		[]int
}
