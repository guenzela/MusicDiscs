package musicdiscs.web;

import musicdiscs.domain.Artist;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "artists", formBackingObject = Artist.class)
@RequestMapping("/artists")
@Controller
public class ArtistController {
}
