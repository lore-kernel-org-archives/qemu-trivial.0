Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwE3I-0000mN-1N
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:03:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE3F-0000kf-SG
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE3F-00021w-6O
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:02:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwE39-0001wX-2i; Sun, 24 Sep 2017 17:02:51 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 37D6441C78;
	Mon, 25 Sep 2017 00:02:50 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id E54993C3;
	Mon, 25 Sep 2017 00:02:49 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>, 
	pbonzini@redhat.com
References: <20170915090643.6043-1-otubo@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 00:02:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170915090643.6043-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [[PATCH] dma/i82374: avoid double creation of
 i82374 device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 21:02:58 -0000

15.09.2017 12:06, Eduardo Otubo wrote:
> QEMU fails when used with the following command line:
> 
>   ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
>   qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
>   Aborted (core dumped)
> 
> The 40p machine type already creates the device i82374. If specified in the
> command line, it will try to create it again, hence generating the error. The
> function isa_bus_dma() isn't supposed to be called twice for the same bus. One
> way to avoid this problem is to set user_creatable=false.

Applied to -trivial, thanks!

/mjt

