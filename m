Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQvTj-0005ul-3l
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 05:11:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQvTa-0005jm-VL
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 05:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WQvTU-00041S-MM
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 05:10:54 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:48231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WQvTG-0003z9-DS; Fri, 21 Mar 2014 05:10:34 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id 6A8A560092; Fri, 21 Mar 2014 10:10:32 +0100 (CET)
Date: Fri, 21 Mar 2014 10:10:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <1395391388.20837.1.camel@nilsson.home.kraxel.org>
Message-ID: <alpine.LMD.2.02.1403211006430.4992@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<53232C8C.3070403@msgid.tls.msk.ru>
	<alpine.LMD.2.02.1403141834500.15847@jedlik.phy.bme.hu>
	<alpine.LMD.2.02.1403141856050.15847@jedlik.phy.bme.hu>
	<1395059524.5663.5.camel@nilsson.home.kraxel.org>
	<alpine.LMD.2.02.1403201057120.1165@jedlik.phy.bme.hu>
	<1395391388.20837.1.camel@nilsson.home.kraxel.org>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 21 Mar 2014 09:11:01 -0000

On Fri, 21 Mar 2014, Gerd Hoffmann wrote:
> On Do, 2014-03-20 at 10:58 +0100, BALATON Zoltan wrote:
>> So what should we do then? Should I send an updated patch which sets
>> 070002 in the multiport case too?
>
> Yes, that would be great.

OK, I'll resubmit it after pc-2.1 is added also with the multiport case.

Thank you,
BALATON Zoltan

