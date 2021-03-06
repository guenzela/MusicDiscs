// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package musicdiscs.domain;

import java.util.List;
import java.util.Random;
import musicdiscs.domain.Artist;
import org.springframework.stereotype.Component;

privileged aspect ArtistDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtistDataOnDemand: @Component;
    
    private Random ArtistDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Artist> ArtistDataOnDemand.data;
    
    public Artist ArtistDataOnDemand.getNewTransientArtist(int index) {
        musicdiscs.domain.Artist obj = new musicdiscs.domain.Artist();
        obj.setName("name_" + index);
        obj.setOrigin("origin_" + index);
        return obj;
    }
    
    public Artist ArtistDataOnDemand.getSpecificArtist(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Artist obj = data.get(index);
        return Artist.findArtist(obj.getId());
    }
    
    public Artist ArtistDataOnDemand.getRandomArtist() {
        init();
        Artist obj = data.get(rnd.nextInt(data.size()));
        return Artist.findArtist(obj.getId());
    }
    
    public boolean ArtistDataOnDemand.modifyArtist(Artist obj) {
        return false;
    }
    
    public void ArtistDataOnDemand.init() {
        data = musicdiscs.domain.Artist.findArtistEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Artist' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<musicdiscs.domain.Artist>();
        for (int i = 0; i < 10; i++) {
            musicdiscs.domain.Artist obj = getNewTransientArtist(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
