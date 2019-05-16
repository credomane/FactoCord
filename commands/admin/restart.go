package admin

import (
	"io"
	"time"

	"github.com/bwmarrin/discordgo"
)

// RestartCount is the number of times the server has restarted.
var RestartCount int

// Restart saves and restarts the server
func Restart(s *discordgo.Session, m *discordgo.MessageCreate) {
	if *R == false {
		s.ChannelMessageSend(m.ChannelID, "Server is not running!")
		return
	}
	io.WriteString(*P, "/save\n")
	io.WriteString(*P, "/quit\n")
	s.ChannelMessageSend(m.ChannelID, "Saved server, now restarting!")
	time.Sleep(3 * time.Second)
	*R = false
	RestartCount = RestartCount + 1
	return
}
