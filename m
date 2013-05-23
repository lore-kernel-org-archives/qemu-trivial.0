Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfOxs-0006XH-Rz
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 02:25:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UfOxq-0006Tn-Fb
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UfOxp-0003yQ-DV
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1UfOxm-0003xY-CS; Thu, 23 May 2013 02:25:22 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4N6PAkZ010073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 23 May 2013 02:25:11 -0400
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4N6P9OM029175; Thu, 23 May 2013 02:25:10 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EF0C8200B4; Thu, 23 May 2013 08:25:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1366084439-7475-1-git-send-email-lig.fnst@cn.fujitsu.com>
Date: Thu, 23 May 2013 08:25:08 +0200
In-Reply-To: <1366084439-7475-1-git-send-email-lig.fnst@cn.fujitsu.com>
	(liguang's message of "Tue, 16 Apr 2013 11:53:57 +0800")
Message-ID: <874ndu9prv.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/3] debugcon: fix always
	print "addr=0x0, val=0x0" bug
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
X-List-Received-Date: Thu, 23 May 2013 06:25:27 -0000

Cc'ing qemu-trivial.

liguang <lig.fnst@cn.fujitsu.com> writes:

> when use DEBUG_DEBUGCON, screen spits:
> debugcon: write addr=0x0000 val=0x00
> Rdebugcon: write addr=0x0000 val=0x00
> udebugcon: write addr=0x0000 val=0x00
> ndebugcon: write addr=0x0000 val=0x00
> ndebugcon: write addr=0x0000 val=0x00
> idebugcon: write addr=0x0000 val=0x00
> ndebugcon: write addr=0x0000 val=0x00
> gdebugcon: write addr=0x0000 val=0x00
>  debugcon: write addr=0x0000 val=0x00
> odebugcon: write addr=0x0000 val=0x00
> pdebugcon: write addr=0x0000 val=0x00
> tdebugcon: write addr=0x0000 val=0x00
> idebugcon: write addr=0x0000 val=0x00
> odebugcon: write addr=0x0000 val=0x00
> ndebugcon: write addr=0x0000 val=0x00
>  debugcon: write addr=0x0000 val=0x00
> rdebugcon: write addr=0x0000 val=0x00
> odebugcon: write addr=0x0000 val=0x00
> mdebugcon: write addr=0x0000 val=0x00
>  debugcon: write addr=0x0000 val=0x00
> adebugcon: write addr=0x0000 val=0x00
> tdebugcon: write addr=0x0000 val=0x00
>  debugcon: write addr=0x0000 val=0x00
>
> Oh, that's wrong, val is not always be 0.
> this bug caused by lack of length modifier
> for specifier 'x'.

Subject is misleading, it doesn't "always print", only when
DEBUG_DEBUGCON is enabled.

Recommend to abridge the commit message radically.

> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/char/debugcon.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index 0588eeb..44c93e1 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>      unsigned char ch = val;
>  
>  #ifdef DEBUG_DEBUGCON
> -    printf("debugcon: write addr=0x%04x val=0x%02x\n", addr, val);
> +    printf("debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02x\n", addr, val);
>  #endif
>  
>      qemu_chr_fe_write(s->chr, &ch, 1);

