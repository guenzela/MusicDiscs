package musicdiscs.domain;

//commento

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooEntity
public class Track {

    @NotNull
    private String title;

    private Float length;

    private String writer;

    @NotNull
    private Integer nr;
}
