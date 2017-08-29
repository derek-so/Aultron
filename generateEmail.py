with open('list.txt') as netIDS:
    for line in netIDS:
        netLists = line.rstrip().split('_');
        if(len(netLists) < 2):
            print "email: " + netLists[0];
        else:
            newList = netLists[2:];
            for x in newList:
                print "email: " + x;
