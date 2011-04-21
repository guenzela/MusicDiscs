package musicdiscs.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import musicdiscs.domain.Album;
import musicdiscs.domain.Track;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/comment/**")
@Controller
public class CommentController {
	
	public Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(method=RequestMethod.GET, value="/tryGet")
    public String get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	logger.debug("chiamato get");
    	return "comment/responseget";  
    }

    @RequestMapping(method = RequestMethod.POST, value = "/tryPost")
    @Transactional(propagation=Propagation.REQUIRED)
    public String post(@ModelAttribute Album a,@RequestParam("commenta") String commentValue,@RequestParam("id") Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	Album.findAlbum(id).getComments().add(commentValue);
    	return "comment/responsepost";
    	
    }

    @RequestMapping
    public ModelAndView index() {
    	logger.debug("chiamato index");
    	List <Album> albums=Album.findAllAlbums();
    	List <Track> tracks=Track.findAllTracks();
    	ModelAndView mav=new ModelAndView("comment/index");
    	mav.addObject("albums", albums);
    	mav.addObject("tracks",tracks);
        return mav;
    }
}
