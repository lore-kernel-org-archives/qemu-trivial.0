Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQufk-0003CB-Dw
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 04:19:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQufd-00033E-Hn
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 04:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQufY-0001Kf-Mn
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 04:19:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQufO-00018B-Kf; Fri, 21 Mar 2014 04:19:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 23DD542CA3;
	Fri, 21 Mar 2014 12:19:00 +0400 (MSK)
Message-ID: <532BF5F4.7000803@msgid.tls.msk.ru>
Date: Fri, 21 Mar 2014 12:19:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<532B0C5D.5060905@msgid.tls.msk.ru> <532B0E71.1000009@redhat.com>
In-Reply-To: <532B0E71.1000009@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [Qemu-trivial] [PATCH] serial-pci: Set prog interface field of
 pci config to 16550 compatible
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
X-List-Received-Date: Fri, 21 Mar 2014 08:19:22 -0000

20.03.2014 19:51, Paolo Bonzini wrote:
> Il 20/03/2014 16:42, Michael Tokarev ha scritto:
>> 10.03.2014 22:40, BALATON Zoltan wrote:
>>> Ping!
>>> http://patchwork.ozlabs.org/patch/324674/
>>
>> Thanks, applied to -trivial.
> 
> No, please don't; this needs to be done for new machine types only.

I thought about this too, but decided this is too minor a difference
to warrant special per-machine-type handling.  Oh well.

/mjt

