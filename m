Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsmtF-0001Ro-WC
	for mharc-qemu-trivial@gnu.org; Fri, 15 Sep 2017 05:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dsmtD-0001PX-82
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 05:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dsmt9-00040H-B6
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 05:26:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dsmt4-0003wU-5G; Fri, 15 Sep 2017 05:26:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41460C0587F5;
	Fri, 15 Sep 2017 09:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 41460C0587F5
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-68.ams2.redhat.com [10.36.117.68])
	by smtp.corp.redhat.com (Postfix) with SMTP id 5D1CE614D3;
	Fri, 15 Sep 2017 09:26:08 +0000 (UTC)
Date: Fri, 15 Sep 2017 11:26:07 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>,
	Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com
Message-ID: <20170915092607.GA6835@vader>
References: <20170915090643.6043-1-otubo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170915090643.6043-1-otubo@redhat.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 15 Sep 2017 09:26:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 15 Sep 2017 09:26:24 -0000

(oups, forgot the v2 on Subject)

On Fri, Sep 15, 2017 at 11:06:43AM +0200, Eduardo Otubo wrote:
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
> 
> A possible fix in a near future would be making
> isa_bus_dma()/DMA_init()/i82374_realize() return an error instead of asserting
> as well.
> 
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> ---
>  hw/dma/i82374.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> index 6c0f975df0..e76dea8dc7 100644
> --- a/hw/dma/i82374.c
> +++ b/hw/dma/i82374.c
> @@ -139,6 +139,11 @@ static void i82374_class_init(ObjectClass *klass, void *data)
>      dc->realize = i82374_realize;
>      dc->vmsd = &vmstate_i82374;
>      dc->props = i82374_properties;
> +    dc->user_creatable = false;
> +    /*
> +     * Reason: i82374_realize() crashes (assertion failure inside isa_bus_dma()
> +     *         if the device is instantiated twice.
> +     */
>  }
>  
>  static const TypeInfo i82374_info = {
> -- 
> 2.13.5
> 
> 

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

