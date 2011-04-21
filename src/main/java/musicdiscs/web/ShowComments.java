package musicdiscs.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import musicdiscs.domain.Album;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/showcomments/**")
@Controller
public class ShowComments {
	
	public Logger logger=LoggerFactory.getLogger(getClass());
	
    @RequestMapping
    public void get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    @RequestMapping(method = RequestMethod.POST, value = "/show")
    public ModelAndView post(ModelMap modelMap,@RequestParam Long id, HttpServletRequest request, HttpServletResponse response) {
    	logger.debug("chiamato post{}",id);
    	List<String> comments=Album.findAlbum(id).getComments();
    	ModelAndView a=new ModelAndView("showcomments/result");
    	a.addObject("comments",comments);
    	a.addObject("selected",Album.findAlbum(id));
    	return a;
    }

    @RequestMapping(value="index")
    public ModelAndView index() {
    	logger.debug("chiamato index");
    	ModelAndView mav=new ModelAndView("showcomments/index");
        List<Album> albums=Album.findAllAlbums();
        mav.addObject("albums",albums);
        return mav;
        
    }
}
