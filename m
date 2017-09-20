Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duZi2-0003EV-5z
	for mharc-qemu-trivial@gnu.org; Wed, 20 Sep 2017 03:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1duZhz-0003CC-7p
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 03:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1duZhy-0000cJ-5T
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 03:46:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1duZhr-0000Aj-Dl; Wed, 20 Sep 2017 03:46:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C5CF356D8;
	Wed, 20 Sep 2017 07:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6C5CF356D8
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.62] (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 587A95D6A4;
	Wed, 20 Sep 2017 07:46:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1495613046-6430-1-git-send-email-thuth@redhat.com>
Message-ID: <5e647277-d688-071d-7def-bd8d57dd7e66@redhat.com>
Date: Wed, 20 Sep 2017 09:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1495613046-6430-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 20 Sep 2017 07:46:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Mark the 'hubport'
 netdev as deprecated
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
X-List-Received-Date: Wed, 20 Sep 2017 07:46:12 -0000

On 24.05.2017 10:04, Thomas Huth wrote:
> The 'hubport' netdev is closely tied to the 'vlan' concept which
> has been marked as deprecated in commit a2dbe1356faff3cb6 already.
> Thus we should also mark the hubport netdevs as deprecated to make
> the remaining users aware that they should not use this anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  net/hub.c       | 4 ++++
>  qemu-options.hx | 6 ++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/net/hub.c b/net/hub.c
> index 32d8cf5..85bd5bc 100644
> --- a/net/hub.c
> +++ b/net/hub.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "monitor/monitor.h"
>  #include "net/net.h"
>  #include "clients.h"
> @@ -286,6 +287,9 @@ int net_init_hubport(const Netdev *netdev, const char *name,
>  {
>      const NetdevHubPortOptions *hubport;
>  
> +    error_report("hubports are deprecated and will be removed in a "
> +                 "future release");
> +
>      assert(netdev->type == NET_CLIENT_DRIVER_HUBPORT);
>      assert(!peer);
>      hubport = &netdev->u.hubport;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dc1a48a..efb555c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1810,7 +1810,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev vhost-user,id=str,chardev=dev[,vhostforce=on|off]\n"
>      "                configure a vhost-user network, backed by a chardev 'dev'\n"
>      "-netdev hubport,id=str,hubid=n\n"
> -    "                configure a hub port on QEMU VLAN 'n'\n", QEMU_ARCH_ALL)
> +    "                configure a hub port on QEMU VLAN 'n' (deprecated)\n", QEMU_ARCH_ALL)
>  DEF("net", HAS_ARG, QEMU_OPTION_net,
>      "-net nic[,vlan=n][,macaddr=mac][,model=type][,name=str][,addr=str][,vectors=v]\n"
>      "                old way to create a new NIC and connect it to VLAN 'n'\n"
> @@ -2239,7 +2239,9 @@ Create a hub port on QEMU "vlan" @var{hubid}.
>  
>  The hubport netdev lets you connect a NIC to a QEMU "vlan" instead of a single
>  netdev.  @code{-net} and @code{-device} with parameter @option{vlan} create the
> -required hub automatically.
> +required hub automatically. Note that the "vlan" concept and thus the hubport
> +option, too, are considered as deprecated and might be removed in a future
> +release of QEMU.
>  
>  @item -netdev vhost-user,chardev=@var{id}[,vhostforce=on|off][,queues=n]
>  
> 

ping?

 Thomas

