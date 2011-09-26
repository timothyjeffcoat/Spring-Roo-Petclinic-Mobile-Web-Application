// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.springsource.petclinic.domain.Owner;
import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.reference.PetType;
import java.lang.Float;
import java.lang.Long;
import java.lang.String;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect PetController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PetController.showJson(@PathVariable("id") Long id) {
        Pet pet = Pet.findPet(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        if (pet == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(pet.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PetController.createFromJsonArray(@RequestBody String json) {
        for (Pet pet: Pet.fromJsonArrayToPets(json)) {
            pet.persist();
        }
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PetController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        for (Pet pet: Pet.fromJsonArrayToPets(json)) {
            if (pet.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNameAndWeight", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PetController.jsonFindPetsByNameAndWeight(@RequestParam("name") String name, @RequestParam("weight") Float weight) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(Pet.toJsonArray(Pet.findPetsByNameAndWeight(name, weight).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByOwner", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PetController.jsonFindPetsByOwner(@RequestParam("owner") Owner owner) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(Pet.toJsonArray(Pet.findPetsByOwner(owner).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=BySendRemindersAndWeightLessThan", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PetController.jsonFindPetsBySendRemindersAndWeightLessThan(@RequestParam(value = "sendReminders", required = false) boolean sendReminders, @RequestParam("weight") Float weight) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(Pet.toJsonArray(Pet.findPetsBySendRemindersAndWeightLessThan(sendReminders, weight).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTypeAndNameLike", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PetController.jsonFindPetsByTypeAndNameLike(@RequestParam("type") PetType type, @RequestParam("name") String name) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(Pet.toJsonArray(Pet.findPetsByTypeAndNameLike(type, name).getResultList()), headers, HttpStatus.OK);
    }
    
}
