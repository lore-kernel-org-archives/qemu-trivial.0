Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmBfS-0008U5-Uq
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2015 22:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ZmBeT-00085Z-Cz
	for qemu-trivial@nongnu.org; Tue, 13 Oct 2015 22:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ZmBeS-0004xM-Ec
	for qemu-trivial@nongnu.org; Tue, 13 Oct 2015 22:18:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1ZmBeN-0004wz-TE; Tue, 13 Oct 2015 22:18:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 6A500C07585F;
	Wed, 14 Oct 2015 02:18:42 +0000 (UTC)
Received: from [10.72.4.102] (vpn1-4-102.pek2.redhat.com [10.72.4.102])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9E2IcXB031723; Tue, 13 Oct 2015 22:18:39 -0400
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-devel@nongnu.org
References: <1444638301-10401-1-git-send-email-sebastian.huber@embedded-brains.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <561DBB7D.4000600@redhat.com>
Date: Wed, 14 Oct 2015 10:18:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444638301-10401-1-git-send-email-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: cadence_gem: Set
	initial MAC address
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
X-List-Received-Date: Wed, 14 Oct 2015 02:18:50 -0000



On 10/12/2015 04:25 PM, Sebastian Huber wrote:
> Set initial MAC address to the one specified by the command line.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> Reviewed-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 1127223..3639fc1 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -964,6 +964,7 @@ static void gem_reset(DeviceState *d)
>  {
>      int i;
>      CadenceGEMState *s = CADENCE_GEM(d);
> +    const uint8_t *a;
>  
>      DB_PRINT("\n");
>  
> @@ -982,6 +983,11 @@ static void gem_reset(DeviceState *d)
>      s->regs[GEM_DESCONF5] = 0x002f2145;
>      s->regs[GEM_DESCONF6] = 0x00000200;
>  
> +    /* Set MAC address */
> +    a = &s->conf.macaddr.a[0];
> +    s->regs[GEM_SPADDR1LO] = a[0] | (a[1] << 8) | (a[2] << 16) | (a[3] << 24);
> +    s->regs[GEM_SPADDR1HI] = a[4] | (a[5] << 8);
> +
>      for (i = 0; i < 4; i++) {
>          s->sar_active[i] = false;
>      }

Applied in https://github.com/jasowang/qemu/commits/net

Thanks

