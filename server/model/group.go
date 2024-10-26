//ver.1.2
package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type Group struct{
	gorn.model
	groupID  		int			
    users 			user[]		
    name 			string
    messages 		List<message>
}