Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQf7M-0007Rt-ST
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 11:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQf7G-0007KX-Ut
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQf7B-0007Le-TP
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:42:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQf71-0007Fz-T1; Thu, 20 Mar 2014 11:42:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9F48242A21;
	Thu, 20 Mar 2014 19:42:21 +0400 (MSK)
Message-ID: <532B0C5D.5060905@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 19:42:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
In-Reply-To: <alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 20 Mar 2014 15:42:51 -0000

10.03.2014 22:40, BALATON Zoltan wrote:
> Ping!
> http://patchwork.ozlabs.org/patch/324674/

Thanks, applied to -trivial.

/mjt

