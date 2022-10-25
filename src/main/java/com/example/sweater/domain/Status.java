package com.example.sweater.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Status implements GrantedAuthority {
    Sent, Process, Ready;

    @Override
    public String getAuthority() {
        return name();
    }

}