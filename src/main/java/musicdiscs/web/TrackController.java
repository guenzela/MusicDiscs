package musicdiscs.web;

import musicdiscs.domain.Track;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "tracks", formBackingObject = Track.class)
@RequestMapping("/tracks")
@Controller
public class TrackController {
}
