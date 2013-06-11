Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmKeX-0007xD-QY
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 05:14:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmKeU-0007tK-Fw
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:14:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmKeT-00013G-F4
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:14:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmKeM-00010n-SS; Tue, 11 Jun 2013 05:13:59 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 43D9E411FC;
	Tue, 11 Jun 2013 13:13:56 +0400 (MSK)
Message-ID: <51B6EA52.1060906@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 13:13:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <cover.1370572420.git.peter.crosthwaite@xilinx.com>
	<1ec46fbd250efe78699a1e4cf6838c0c88f4acc7.1370572420.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz7vk_8z+KzFMfj0iWjLPeykkLUP4ePu8AECLSHn1t3KcQ@mail.gmail.com>
	<51B26065.3000705@msgid.tls.msk.ru>
	<CAEgOgz7RRbcT_0Vyga=NQv-8cAjthm4Gn8RzZrTvfGdu3KRpAA@mail.gmail.com>
In-Reply-To: <CAEgOgz7RRbcT_0Vyga=NQv-8cAjthm4Gn8RzZrTvfGdu3KRpAA@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/5] intc/xilinx_intc:
 Use qemu_set_irq
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
X-List-Received-Date: Tue, 11 Jun 2013 09:14:08 -0000

11.06.2013 04:41, Peter Crosthwaite wrote:
> On Sat, Jun 8, 2013 at 8:36 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Thanks, applied to the trivial patches queue.
> 
> I need to respin the later patches in this series but as you have
> taken this ill drop it from the respin. No conflict issues.

heh.  I haven't even noticed this is 1/5 ;)

Please don't send just some patches from a series
for applying to other trees.  Because if you do
the respin, at least in some cases you'll have to wait
for the applied bits to reach master first... ;)

It's as trivial to remove this one from -trivial as
to keep it there, it's your call ;)

Thanks,

/mjt

