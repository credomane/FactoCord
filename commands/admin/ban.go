package admin

import (
	"io"

	"github.com/bwmarrin/discordgo"
)

// BanPlayer executes the ban command on the server.
func BanPlayer(s *discordgo.Session, m *discordgo.MessageCreate, arg1 string, arg2 string) {
	io.WriteString(*P, "/ban "+arg1+" "+arg2+"\n")
	s.ChannelMessageSend(m.ChannelID, "Player "+arg1+" banned with reason "+arg2+"!")
	return
}
