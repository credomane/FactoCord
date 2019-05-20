package utils

import (
	"github.com/bwmarrin/discordgo"
	"io"
)

// PlayersList calls the softmod function to get json list of players.
func PlayersList(s *discordgo.Session, m *discordgo.MessageCreate) {
	if(!*R) {
		s.ChannelMessageSend(m.ChannelID, "Command not performed. Factorio Server is not running!")
		return
	}
	io.WriteString(*P, "/FactoCord players\n")
	return
}

func PlayersListResponse(s *discordgo.Session, m *discordgo.MessageCreate, args string){

}