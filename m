Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwR1n-0006iC-IQ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 06:54:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwR1l-0006gm-1f
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 06:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwR1k-0000qs-9L
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 06:54:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwR1e-0000p4-PI; Mon, 25 Sep 2017 06:54:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D63D741D96;
	Mon, 25 Sep 2017 13:54:08 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id B710017;
	Mon, 25 Sep 2017 13:54:08 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>
References: <20170915090643.6043-1-otubo@redhat.com>
	<fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
	<0e84971b-592e-22f7-8815-2b3e193f6c1d@redhat.com>
	<20170925092641.GD12137@vader>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <52fe072e-8e53-0610-2195-3ef8e120b553@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 13:54:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170925092641.GD12137@vader>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of
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
X-List-Received-Date: Mon, 25 Sep 2017 10:54:18 -0000

25.09.2017 12:26, Eduardo Otubo wrote:
> On Mon, Sep 25, 2017 at 11:11:37AM +0200, Paolo Bonzini wrote:
>> On 24/09/2017 23:02, Michael Tokarev wrote:
>>> 15.09.2017 12:06, Eduardo Otubo wrote:
>>>> QEMU fails when used with the following command line:
>>>>
>>>>   ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
>>>>   qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
>>>>   Aborted (core dumped)
>>>>
>>>> The 40p machine type already creates the device i82374. If specified in the
>>>> command line, it will try to create it again, hence generating the error. The
>>>> function isa_bus_dma() isn't supposed to be called twice for the same bus. One
>>>> way to avoid this problem is to set user_creatable=false.
>>>
>>> Applied to -trivial, thanks!
>>
>> Eduardo, weren't you going to send a version that propagates Error*
>> correctly instead?
> 
> Yes, that's correct. I can revert this patch with the error
> propagation patch as well, if you guys don't mind.

Hmm. After reading the original discussion I concluded this patch
is okay.  I can remove it right now before the series has been
applied, together with another tiny change.

Thanks,

/mjt

