// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package musicdiscs.domain;

import java.lang.String;

privileged aspect Album_Roo_ToString {
    
    public String Album.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Title: ").append(getTitle()).append(", ");
        sb.append("Artist: ").append(getArtist()).append(", ");
        sb.append("Tracks: ").append(getTracks() == null ? "null" : getTracks().size()).append(", ");
        sb.append("AlbumType: ").append(getAlbumType()).append(", ");
        sb.append("Released: ").append(getReleased()).append(", ");
        sb.append("Length: ").append(getLength()).append(", ");
        sb.append("Label: ").append(getLabel()).append(", ");
        sb.append("Rates: ").append(getRates() == null ? "null" : getRates().size()).append(", ");
        sb.append("Vote: ").append(getVote()).append(", ");
        sb.append("Comments: ").append(getComments() == null ? "null" : getComments().size());
        return sb.toString();
    }
    
}
