Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxduD-0003ux-PU
	for mharc-qemu-trivial@gnu.org; Sat, 04 Aug 2012 08:56:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SxduA-0003ti-Sm
	for qemu-trivial@nongnu.org; Sat, 04 Aug 2012 08:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Sxdu9-0004ZZ-Kl
	for qemu-trivial@nongnu.org; Sat, 04 Aug 2012 08:56:30 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:55468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Sxdu9-0004ZP-G1
	for qemu-trivial@nongnu.org; Sat, 04 Aug 2012 08:56:29 -0400
Received: by obbta14 with SMTP id ta14so2527797obb.4
	for <qemu-trivial@nongnu.org>; Sat, 04 Aug 2012 05:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=adsbgGYZ5NPhaS7Yz3UiwevTFNghR6YsbMTuCXK42Rg=;
	b=bweCjIo7Pb6Z59m4mkt8n/qzMqzX9XpTdkepaI5+CGkHFbMkZK2jsP0r8p8M2fmFS4
	vqmzLuqxbwXj5oYMfdJfGiweKYGr6HW0mC2Vx1vm+KiqjHEyX0szGeOqSUuw4utaw5cC
	00qhxfx9P2SPrbSeZC4fQy4k2IGYwCm2YHZXYRCn0hOwb0k0LhtS/ui5Stlu1gjQ0oiT
	9R4idHq3ZkPP7LHuAUzT5ehRSMAvtdflZRsGcBTAKD5pw6WL7ENhoV1qpi2mwDrwQufK
	Gr08tenWPGGBZmjomZGXo7Wb2XicZ+C0OArSK11EtISAgswGInTcYU7CVbcKbOfHkJQL
	uEZA==
Received: by 10.182.216.99 with SMTP id op3mr10644640obc.30.1344084988532;
	Sat, 04 Aug 2012 05:56:28 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-123-145-39.austin.res.rr.com.
	[70.123.145.39])
	by mx.google.com with ESMTPS id kc5sm12462183obb.21.2012.08.04.05.56.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 05:56:28 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: riegamaths@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
In-Reply-To: <1344079795-8050-1-git-send-email-riegamaths@gmail.com>
References: <1344079795-8050-1-git-send-email-riegamaths@gmail.com>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Sat, 04 Aug 2012 07:56:25 -0500
Message-ID: <87boiqbyti.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQnkPcoeAZabsNDyAuREcUaeHjviynPqZcJwNTa4IsUSZsct8MZ8bELY185A332cdrzhnmig
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build: Fix build breakage
	detected by buildbot
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
X-List-Received-Date: Sat, 04 Aug 2012 12:56:32 -0000

riegamaths@gmail.com writes:

> From: Dunrong Huang <riegamaths@gmail.com>
>
> More details:
> http://buildbot.b1-systems.de/qemu/builders/xen_unstable/builds/83/steps/compile/logs/stdio
>
> VLANState has been removed since commit a005d07, so "vlan id" should be
> fetched using net_hub_id_for_client().
>
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>

Applied. Thanks.

Regards,

Anthony Liguori

> ---
>  hw/xen_backend.h   |    1 +
>  hw/xen_devconfig.c |   10 ++++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/hw/xen_backend.h b/hw/xen_backend.h
> index 3305630..fea86dd 100644
> --- a/hw/xen_backend.h
> +++ b/hw/xen_backend.h
> @@ -4,6 +4,7 @@
>  #include "xen_common.h"
>  #include "sysemu.h"
>  #include "net.h"
> +#include "net/hub.h"
>  
>  /* ------------------------------------------------------------- */
>  
> diff --git a/hw/xen_devconfig.c b/hw/xen_devconfig.c
> index 0928613..d83e8d0 100644
> --- a/hw/xen_devconfig.c
> +++ b/hw/xen_devconfig.c
> @@ -123,19 +123,21 @@ int xen_config_dev_nic(NICInfo *nic)
>  {
>      char fe[256], be[256];
>      char mac[20];
> +    int vlan_id = -1;
>  
> +    net_hub_id_for_client(nic->netdev, &vlan_id);
>      snprintf(mac, sizeof(mac), "%02x:%02x:%02x:%02x:%02x:%02x",
>               nic->macaddr.a[0], nic->macaddr.a[1], nic->macaddr.a[2],
>               nic->macaddr.a[3], nic->macaddr.a[4], nic->macaddr.a[5]);
> -    xen_be_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", nic->vlan->id, mac);
> -    xen_config_dev_dirs("vif", "qnic", nic->vlan->id, fe, be, sizeof(fe));
> +    xen_be_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", vlan_id, mac);
> +    xen_config_dev_dirs("vif", "qnic", vlan_id, fe, be, sizeof(fe));
>  
>      /* frontend */
> -    xenstore_write_int(fe, "handle",     nic->vlan->id);
> +    xenstore_write_int(fe, "handle",     vlan_id);
>      xenstore_write_str(fe, "mac",        mac);
>  
>      /* backend */
> -    xenstore_write_int(be, "handle",     nic->vlan->id);
> +    xenstore_write_int(be, "handle",     vlan_id);
>      xenstore_write_str(be, "mac",        mac);
>  
>      /* common stuff */
> -- 
> 1.7.8.6

