// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import java.lang.String;

privileged aspect Pet_Roo_ToString {
    
    public String Pet.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Owner: ").append(getOwner()).append(", ");
        sb.append("OwnerId: ").append(getOwnerId()).append(", ");
        sb.append("OwnerName: ").append(getOwnerName()).append(", ");
        sb.append("Type: ").append(getType()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Weight: ").append(getWeight()).append(", ");
        sb.append("SendReminders: ").append(isSendReminders());
        return sb.toString();
    }
    
}
