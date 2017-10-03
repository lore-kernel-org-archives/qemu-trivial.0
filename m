Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzKOz-0001ZX-Cy
	for mharc-qemu-trivial@gnu.org; Tue, 03 Oct 2017 06:26:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dzKOx-0001Xq-Hd
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 06:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dzKOw-00041y-O6
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 06:26:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dzKOl-0003rw-Hx; Tue, 03 Oct 2017 06:25:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 391F581233;
	Tue,  3 Oct 2017 10:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 391F581233
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.122] (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C04DF4DA24;
	Tue,  3 Oct 2017 10:25:55 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <1507024644-14853-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <56ac2027-6aa5-6dc9-f2e3-3de54fe8f230@redhat.com>
Date: Tue, 3 Oct 2017 12:25:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507024644-14853-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 03 Oct 2017 10:25:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/block/onenand: Remove dead code block
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
X-List-Received-Date: Tue, 03 Oct 2017 10:26:12 -0000

On 03/10/2017 11:57, Thomas Huth wrote:
> The condition of the for-loop makes sure that b is always smaller
> than s->blocks, so the "if (b >= s->blocks)" statement is completely
> superfluous here.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1715007
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/onenand.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/block/onenand.c b/hw/block/onenand.c
> index 30e40f3..de65c9e 100644
> --- a/hw/block/onenand.c
> +++ b/hw/block/onenand.c
> @@ -520,10 +520,6 @@ static void onenand_command(OneNANDState *s)
>          s->intstatus |= ONEN_INT;
>  
>          for (b = 0; b < s->blocks; b ++) {
> -            if (b >= s->blocks) {
> -                s->status |= ONEN_ERR_CMD;
> -                break;
> -            }
>              if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
>                  break;
>  
> 

Looks like a bad cut'n'paste from case 0x23.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

