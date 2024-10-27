//ver.1.2
package model

import(
	"gorm.io/gorm"
)

type Group struct{
	gorm.Model
  users 			[]User
  name 			string
  messages 	[]Message
}
