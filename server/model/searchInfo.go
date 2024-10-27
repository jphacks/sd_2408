//ver.1.0
package model

import(
	"gorm.io/gorm"
)

type SearchInfo struct{
	gorm.Model
	searchInfoID  	int
    place 			string
    resource 		int
    Preference 		string		//(興味のある技術)
    NumPeople 		string
}
