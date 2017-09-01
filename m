Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnkGy-0006sT-5K
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2017 07:38:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnkGs-0006oD-Sk
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnkGr-0000a5-U2
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:37:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dnkGd-0000VR-Rl; Fri, 01 Sep 2017 07:37:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D25DF61485;
	Fri,  1 Sep 2017 11:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D25DF61485
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A86E9341C;
	Fri,  1 Sep 2017 11:37:36 +0000 (UTC)
To: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jsnow@redhat.com, qemu-block@nongnu.org
References: <20170901110706.429-1-otubo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fecde0d9-8289-af04-e1aa-79d0be06ca32@redhat.com>
Date: Fri, 1 Sep 2017 13:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901110706.429-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Sep 2017 11:37:43 +0000 (UTC)
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
X-List-Received-Date: Fri, 01 Sep 2017 11:38:03 -0000

On 01.09.2017 13:07, Eduardo Otubo wrote:
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

Maybe add the reproducer to the commit message:

 qemu-system-ppc64 -S -machine powernv -device isa-fdc

Reviewed-by: Thomas Huth <thuth@redhat.com>

