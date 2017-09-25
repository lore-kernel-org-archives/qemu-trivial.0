Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwPQf-0006U4-Dt
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 05:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwPQc-0006Rw-P8
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwPQb-0001dD-Tn
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dwPQW-0001ZY-8s; Mon, 25 Sep 2017 05:11:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FEEDC0587DE;
	Mon, 25 Sep 2017 09:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2FEEDC0587DE
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.32.181.85] (unknown [10.32.181.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CAF06C1EE;
	Mon, 25 Sep 2017 09:11:38 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>,
	qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>
References: <20170915090643.6043-1-otubo@redhat.com>
	<fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e84971b-592e-22f7-8815-2b3e193f6c1d@redhat.com>
Date: Mon, 25 Sep 2017 11:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 25 Sep 2017 09:11:43 +0000 (UTC)
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
X-List-Received-Date: Mon, 25 Sep 2017 09:11:51 -0000

On 24/09/2017 23:02, Michael Tokarev wrote:
> 15.09.2017 12:06, Eduardo Otubo wrote:
>> QEMU fails when used with the following command line:
>>
>>   ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
>>   qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
>>   Aborted (core dumped)
>>
>> The 40p machine type already creates the device i82374. If specified in the
>> command line, it will try to create it again, hence generating the error. The
>> function isa_bus_dma() isn't supposed to be called twice for the same bus. One
>> way to avoid this problem is to set user_creatable=false.
> 
> Applied to -trivial, thanks!

Eduardo, weren't you going to send a version that propagates Error*
correctly instead?

Paolo


