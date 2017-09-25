Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwPod-0005NT-UI
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 05:36:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwPoc-0005Lz-7h
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwPob-00089N-CQ
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:36:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dwPoW-00087x-Fn; Mon, 25 Sep 2017 05:36:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D35580F99;
	Mon, 25 Sep 2017 09:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6D35580F99
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.32.181.85] (unknown [10.32.181.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF276C1FD;
	Mon, 25 Sep 2017 09:36:26 +0000 (UTC)
To: Eduardo Otubo <otubo@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	ehabkost@redhat.com, qemu-trivial@nongnu.org, Alexander Graf
	<agraf@suse.de>, Markus Armbruster <armbru@redhat.com>
References: <20170915090643.6043-1-otubo@redhat.com>
	<fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
	<0e84971b-592e-22f7-8815-2b3e193f6c1d@redhat.com>
	<20170925092641.GD12137@vader>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <66316562-cecb-3da5-7fbc-89fa20caead2@redhat.com>
Date: Mon, 25 Sep 2017 11:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170925092641.GD12137@vader>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 25 Sep 2017 09:36:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 25 Sep 2017 09:36:39 -0000

On 25/09/2017 11:26, Eduardo Otubo wrote:
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

Sure, that's fine too.

Paolo

