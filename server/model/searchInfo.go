//ver.1.0
package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type SearchInfo struct{
	gorn.model
	searchInfoID  	int			
    place 			string		
    resource 		time.Time
    Preference 		string		//(興味のある技術)
    NumPeople 		string
}