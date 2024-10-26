//ver.1.1
package model

import{
	"gorm.io/gorm"
	"github.com/golang-jwt/jwt/v5"
}

type Image struct{
	gorn.model
	imageID  	int			
    userID 		int		
    url 		String
}