Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLMMS-0007XT-D7
	for mharc-qemu-trivial@gnu.org; Wed, 23 May 2018 01:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fLMML-0007SL-0u
	for qemu-trivial@nongnu.org; Wed, 23 May 2018 01:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fLMMK-0004ZD-63
	for qemu-trivial@nongnu.org; Wed, 23 May 2018 01:30:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50992 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fLMMA-0004VX-Et; Wed, 23 May 2018 01:30:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBF8C4022909;
	Wed, 23 May 2018 05:30:37 +0000 (UTC)
Received: from [10.36.116.80] (ovpn-116-80.ams2.redhat.com [10.36.116.80])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0841D20A8471;
	Wed, 23 May 2018 05:30:35 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Michael Davidsaver <mdavidsaver@gmail.com>
References: <20180522191743.12872-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <336d4fa2-623c-1cb6-829d-71cf7039431e@redhat.com>
Date: Wed, 23 May 2018 07:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180522191743.12872-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 23 May 2018 05:30:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 23 May 2018 05:30:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] ppc: move at24c to its own
 CONFIG_ symbol
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
X-List-Received-Date: Wed, 23 May 2018 05:30:54 -0000

On 22.05.2018 21:17, Paolo Bonzini wrote:
> AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
> being included in all emulators that use I2C, even if they do not
> really need it.  Separate it and, since it was added for the e500
> machines, add it to qemu-system-ppc and qemu-system-ppc64.
> ---
>  default-configs/ppc-softmmu.mak | 1 +
>  hw/nvram/Makefile.objs          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
> index 4d7be45ac5..c57e568121 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -26,6 +26,7 @@ CONFIG_USB_EHCI_SYSBUS=y
>  CONFIG_SM501=y
>  CONFIG_IDE_SII3112=y
>  CONFIG_I2C=y
> +CONFIG_AT24C=y
>  
>  # For Macs
>  CONFIG_MAC=y
> diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
> index a912d25391..b318e53a43 100644
> --- a/hw/nvram/Makefile.objs
> +++ b/hw/nvram/Makefile.objs
> @@ -1,6 +1,6 @@
>  common-obj-$(CONFIG_DS1225Y) += ds1225y.o
>  common-obj-y += eeprom93xx.o
> -common-obj-$(CONFIG_I2C) += eeprom_at24c.o
> +common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
>  common-obj-y += fw_cfg.o
>  common-obj-y += chrp_nvram.o
>  common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o

Since this is a device that can only be added by the user (no board is
using it automatically, as far as I can see), it could be useful for
other machines, too, I guess? Anyway, it's a good idea to have a
separate config switch available for it, and we can add it to other
machines again later if somebody feels that it is necessary, so (once
you add your SoB):

Reviewed-by: Thomas Huth <thuth@redhat.com>

