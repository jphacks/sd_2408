//ver.1.2
//File名がchat.goからdirect_message.goに変更?
//一旦そのままにしておきます
package model

import(
	"gorm.io/gorm"
)

type Chat struct{
	gorm.Model
	directMessageID  	int
    firstUser 			int
    secondUser 			int
    messages 			[]Message
}
