package com.fank.providerticket.controller;

import com.fank.providerticket.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TicketController {

    @Autowired
    ITicketService iTicketService;

    @GetMapping("ticket")
    String getTicket() {
        return iTicketService.getTicket();
    }
}
