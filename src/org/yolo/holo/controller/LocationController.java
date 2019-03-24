package org.yolo.holo.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.yolo.holo.service.LocationsService;

@Controller
public class LocationController {
   
   private LocationsService locationsService;
   
   public void setLocationsService(LocationsService locationsService) {
      this.locationsService = locationsService;
   }
   
   

   @RequestMapping(value="/region",method=RequestMethod.GET)
   public String location(Model model) {
      
      System.out.println("/region");
      
      model.addAttribute("location1", locationsService.getList1());
      model.addAttribute("location2", locationsService.getList2());
      model.addAttribute("location3", locationsService.getList3());
      model.addAttribute("location4", locationsService.getList4());
      model.addAttribute("location5", locationsService.getList5());
      
      return "region";
   }
   
   @RequestMapping(value="/region/{no}", method=RequestMethod.GET)
   public String location(@PathVariable int no, Model model) {
      System.out.println("GET /region");
      
      model.addAllAttributes(locationsService.getLocation(no));
      return "/location";
   }

}//LocationController end