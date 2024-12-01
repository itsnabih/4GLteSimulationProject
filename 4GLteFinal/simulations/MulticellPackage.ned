package _4gltefinal.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.ethernet.Eth10G;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import simu5g.common.binder.Binder;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Ue;
import simu5g.nodes.eNodeB;
import simu5g.nodes.PgwStandard;
import simu5g.world.radio.LteChannelControl;

network MultiCell
{
    parameters:
        int numUe = default(10);         // Number of UEs in the simulation
        int numCells = default(3);       // Number of eNodeBs (cells)
        @display("i=block/network2,,0;bgb=1500,1000,,,0");

    submodules:
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,150");
        }
        binder: Binder {
            // No gate connections needed
            @display("p=249.24,24.12;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=50,225;is=s");
        }
        server: StandardHost {
            @display("p=150,150;is=n;i=device/server");
        }
        router: Router {
            @display("p=300,150;i=device/smallrouter");
        }
        pgw: PgwStandard {
            @display("p=450,150;is=l");
        }
        eNB[numCells]: eNodeB {
            @display("p=600+index*200,300;is=vl");  // Distribute eNodeBs horizontally
        }
        ue[numUe]: Ue {
            @display("p=720.38403,299.088");  // Random positions for UEs
        }
    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;

        // Connect each eNodeB to the PGW
        for i=0..numCells-1 {
            pgw.pppg++ <--> Eth10G <--> eNB[i].ppp;
        }
}
