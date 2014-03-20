Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQZl0-0002ji-82
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 05:59:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQZkr-0002Zc-T9
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 05:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQZkl-0000Me-SW
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 05:59:17 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:48074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WQZkZ-0000Hj-My; Thu, 20 Mar 2014 05:58:59 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id 6626F60092; Thu, 20 Mar 2014 10:58:57 +0100 (CET)
Date: Thu, 20 Mar 2014 10:58:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <1395059524.5663.5.camel@nilsson.home.kraxel.org>
Message-ID: <alpine.LMD.2.02.1403201057120.1165@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<53232C8C.3070403@msgid.tls.msk.ru>
	<alpine.LMD.2.02.1403141834500.15847@jedlik.phy.bme.hu>
	<alpine.LMD.2.02.1403141856050.15847@jedlik.phy.bme.hu>
	<1395059524.5663.5.camel@nilsson.home.kraxel.org>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
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
X-List-Received-Date: Thu, 20 Mar 2014 09:59:24 -0000

On Mon, 17 Mar 2014, Gerd Hoffmann wrote:
>>>> C 07  Communication controller
>>>>        00  Serial controller
>>>>                00  8250
>>>>                01  16450
>>>>                02  16550
>
>>>> What about multi_serial_pci_init() -- should it too set prog-if
>>>> like this?
>>>
>>> I'm not completely sure what the correct value should be for
>>> multi_serial_pci_init so I've left that alone. There's also 07 02 00 that
>>> means multiport serial controller that might apply for that case. For the
>>> simple case I've sent the patch for I had a client expecting this value so I
>>> think it is correct for that at least but I don't know about the multiport
>>> case.
>>
>> Also Gerd Hoffmann said he has picked this patch up so I'm adding him to
>> cc too.
>
> The multiport variants are simply multiple 16550 chips mapped one after
> the other.  So "02" is better than "00".
>
> I don't know what exactly the multiport serial controller is supposed to
> be.

So what should we do then? Should I send an updated patch which sets 
070002 in the multiport case too?

Regards,
BALATON Zoltan

