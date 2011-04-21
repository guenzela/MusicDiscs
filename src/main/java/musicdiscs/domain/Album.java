package musicdiscs.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Set;
import musicdiscs.domain.Track;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import musicdiscs.domain.Artist;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;

@RooJavaBean
@RooToString
@RooEntity
public class Album {

    @NotNull
    private String title;

    @ManyToOne
    private Artist artist;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Track> tracks = new HashSet<Track>();

    private String albumType;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date released;

    private Float length;

    private String label;

    private ArrayList<Float> rates = new ArrayList<Float>();

    @Min(0L)
    @Max(6L)
    private Float vote;
    
    private ArrayList<String> comments=new ArrayList<String>();
    
    public float AverageRate() {
        float sum = 0;
        float avg = 0;
        for (Float f : rates) {
            sum = sum + f;
        }
        avg = sum / (rates.size());
        return avg;
    }
}
