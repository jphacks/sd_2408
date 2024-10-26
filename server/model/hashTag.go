//ver.1.1
package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type HashTag struct{
	gorn.model
	hashTagID  		int			//ここ未定			
    name 			string		
    groupIDs 		List<int>
}