package com.fank.providerticket.service.impl;

import com.fank.providerticket.service.ITicketService;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements ITicketService {

    @Override
    public String getTicket() {
        return ": 买了个票 --- 8081";
    }
}
