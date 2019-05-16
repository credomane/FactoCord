package admin

import (
	"io"

	"../../support"
	"github.com/bwmarrin/discordgo"
)

// StopServer saves and stops the server.
func StopServer(s *discordgo.Session, m *discordgo.MessageCreate) {
	io.WriteString(*P, "/save\n")
	io.WriteString(*P, "/quit\n")
	s.ChannelMessageSend(m.ChannelID, "Server saved and shutting down; Cya!")
	s.Close()
	support.Exit(0)
}
