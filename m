Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7inS-0004xe-9N
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 10:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1e7iJQ-0006B8-Cb
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 09:35:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1e7iJK-0006Xh-AN
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 09:35:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1e7iJE-0006QD-Gj; Thu, 26 Oct 2017 09:34:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CABFA2CE97B;
	Thu, 26 Oct 2017 13:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CABFA2CE97B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B90B7F76F;
	Thu, 26 Oct 2017 13:34:48 +0000 (UTC)
Date: Thu, 26 Oct 2017 15:34:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 26 Oct 2017 13:34:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 26 Oct 2017 10:06:09 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 13:35:12 -0000

On Tue, Oct 24, 2017 at 07:57:37PM +0200, Jason A. Donenfeld wrote:
> Hey folks,
> 
> In case you're curious, this is the kind of hideous workaround
> required until this is fixed:
> 
> https://git.zx2c4.com/WireGuard/commit/?id=2456a56729f7247bf88476317fed0ac822a31e92
> 
> Please let me know if you intend to fix this or if you will accept
> working patches from me for it, or if you simply don't care.
>

You could make the PL011 user instantiate-able and make the necessary
changes to use the dynamic FDT node generation framework (sysbus-fdt),
and then you'd be able to add as many additional UARTs as you like to
mach-virt's platform bus. I played around with that idea once, and have
some patches rotting somewhere that could maybe be dug back up.

drew

