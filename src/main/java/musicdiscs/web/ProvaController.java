package musicdiscs.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import musicdiscs.domain.Album;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/prova")
@Controller
public class ProvaController {

	public Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value="index")
    public ModelAndView index() {
    	logger.debug("chiamato metodo index()");
    	
    	List<Album> albums = Album.findAllAlbums();
    	ModelAndView mav = new ModelAndView("prova/index");
    	mav.addObject("albums", albums);

        return mav;
    }
	
    @RequestMapping(value = "get/{id}")
    public String get(@PathVariable String id, @RequestParam(required=false) String param, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	logger.debug("chiamato metodo GET con parametro {} e param {}", id, param);
    	return "prova/index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "vote/{id}")
    @Transactional(propagation=Propagation.REQUIRED)
    public String vote(@PathVariable Long id, @RequestParam Float vote, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	logger.debug("chiamato metodo vote con POST per id {}", id);
    	Album a = Album.findAlbum(id);
    	if(vote==null){
    		vote=0F;
    	}
    	a.getRates().add(vote);
    	a.setVote(a.AverageRate());
    	return "prova/responseget";
    }

    @RequestMapping(method = RequestMethod.POST, value = "vote")
    public void voteAll(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	logger.debug("chiamato metodo voteAll con POST");
    	//String vote1 = request.getParameter("vote1");
    	//String vote2 = request.getParameter("vote2");
    	//Album a2 = modelMap.get("album2");
    	
    	
    	
    	
    }
    
}
