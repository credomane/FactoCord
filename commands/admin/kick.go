package admin

import (
	"io"

	"github.com/bwmarrin/discordgo"
)

// KickPlayer executes the kick command on the server.
func KickPlayer(s *discordgo.Session, m *discordgo.MessageCreate, arg1 string, arg2 string) {
	io.WriteString(*P, "/kick "+arg1+" "+arg2+"\n")
	s.ChannelMessageSend(m.ChannelID, "Player "+arg1+" kicked with reason "+arg2+"!")
	return
}
