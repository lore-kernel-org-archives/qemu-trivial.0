Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnrda-0000tQ-Tz
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2017 15:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dnrdW-0000pb-EG
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 15:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dnrdR-0007UL-Nn
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 15:29:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dnrdD-0007LR-L0; Fri, 01 Sep 2017 15:29:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC7DA7EA9D;
	Fri,  1 Sep 2017 19:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AC7DA7EA9D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.130] (dhcp-17-130.bos.redhat.com [10.18.17.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDFF7BB6D;
	Fri,  1 Sep 2017 19:29:28 +0000 (UTC)
To: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <20170901110706.429-1-otubo@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <af65a01a-d4a5-e043-b222-87bbaf797d2a@redhat.com>
Date: Fri, 1 Sep 2017 15:29:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170901110706.429-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Sep 2017 19:29:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] isa-fdc: assert replaced by
 proper error exit
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
X-List-Received-Date: Fri, 01 Sep 2017 19:29:53 -0000



On 09/01/2017 07:07 AM, Eduardo Otubo wrote:
> When not available, isa-fdc falls into assert instead of proper error
> exit. This patch fixes this behavior.
> 
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> ---
>  hw/block/fdc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 401129073b..0b6def4e1d 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2699,11 +2699,15 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
>      fdctrl->dma_chann = isa->dma;
>      if (fdctrl->dma_chann != -1) {
>          fdctrl->dma = isa_get_dma(isa_bus_from_device(isadev), isa->dma);
> -        assert(fdctrl->dma);
> +        if (!fdctrl->dma) {
> +            error_setg(errp, "isa-fdc not supported");
> +            goto error;
> +        }
>      }
>  
>      qdev_set_legacy_instance_id(dev, isa->iobase, 2);
>      fdctrl_realize_common(dev, fdctrl, &err);
> +error:
>      if (err != NULL) {
>          error_propagate(errp, err);
>          return;
> 

I was going to ask if we needn't take care of undoing the portio or IRQ
registration, but it turns out that there is not one single caller of
portio_list_destroy in all of QEMU...

Paolo admitted as much in e3fb0ade83420a86464ee50c71f2daf5641cab10 when
he updated the destroy function :)

It looks like the way we assign IRQs to ISA devices is kind of simple
and not trivial to undo correctly, so instead of barking up that tree,
why don't we hoist the isa_get_dma call up and fail before we try to
initialize portio or IRQs?

