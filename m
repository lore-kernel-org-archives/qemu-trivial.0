Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPWia-0006IN-AN
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 08:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WPWiT-0006HX-14
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 08:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WPWiM-0006O8-Tb
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 08:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WPWiM-0006Nz-Lx; Mon, 17 Mar 2014 08:32:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2HCWCPv027360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Mar 2014 08:32:12 -0400
Received: from [10.36.7.222] (vpn1-7-222.ams2.redhat.com [10.36.7.222])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2HCW5Oq028210; Mon, 17 Mar 2014 08:32:07 -0400
Message-ID: <1395059524.5663.5.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Date: Mon, 17 Mar 2014 13:32:04 +0100
In-Reply-To: <alpine.LMD.2.02.1403141856050.15847@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<53232C8C.3070403@msgid.tls.msk.ru>
	<alpine.LMD.2.02.1403141834500.15847@jedlik.phy.bme.hu>
	<alpine.LMD.2.02.1403141856050.15847@jedlik.phy.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: Set prog
 interface field of pci config to 16550 compatible
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 12:32:35 -0000



> >> C 07  Communication controller
> >>        00  Serial controller
> >>                00  8250
> >>                01  16450
> >>                02  16550

> >> What about multi_serial_pci_init() -- should it too set prog-if
> >> like this?
> >
> > I'm not completely sure what the correct value should be for 
> > multi_serial_pci_init so I've left that alone. There's also 07 02 00 that 
> > means multiport serial controller that might apply for that case. For the 
> > simple case I've sent the patch for I had a client expecting this value so I 
> > think it is correct for that at least but I don't know about the multiport 
> > case.
> 
> Also Gerd Hoffmann said he has picked this patch up so I'm adding him to 
> cc too.

The multiport variants are simply multiple 16550 chips mapped one after
the other.  So "02" is better than "00".

I don't know what exactly the multiport serial controller is supposed to
be.

cheers,
  Gerd



