Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9uPW-000216-B9
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2016 09:17:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b9uPU-0001zZ-2M
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 09:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b9uPT-0003lM-4K
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 09:17:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b9uPN-0003kC-Jb; Mon, 06 Jun 2016 09:17:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88B656408E;
	Mon,  6 Jun 2016 13:17:32 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56DHTir023585; Mon, 6 Jun 2016 09:17:30 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
	<ac8eb9b954f267b8d9145cb8833a2f0b346f5913.1465112552.git.mjt@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <92ecec92-44d4-f192-ea66-9425383782eb@redhat.com>
Date: Mon, 6 Jun 2016 15:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <ac8eb9b954f267b8d9145cb8833a2f0b346f5913.1465112552.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 06 Jun 2016 13:17:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PULL 50/52] pc-bios/s390-ccw: Use DIV_ROUND_UP
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
X-List-Received-Date: Mon, 06 Jun 2016 13:17:41 -0000



On 05/06/2016 09:43, Michael Tokarev wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
> 
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
> 
> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  pc-bios/s390-ccw/bootmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
> index 611102e..ecdc52d 100644
> --- a/pc-bios/s390-ccw/bootmap.c
> +++ b/pc-bios/s390-ccw/bootmap.c
> @@ -599,7 +599,7 @@ static void load_iso_bc_entry(IsoBcSection *load)
>  
>      if (real_size) {
>          /* Round up blocks to load */
> -        blks_to_load = (real_size + ISO_SECTOR_SIZE - 1) / ISO_SECTOR_SIZE;
> +        blks_to_load = DIV_ROUND_UP(real_size, ISO_SECTOR_SIZE);
>          sclp_print("ISO boot image size verified\n");
>      } else {
>          sclp_print("ISO boot image size could not be verified\n");
> 

I think this one must be dropped from the pull request as s390-ccw files
have no access to the definition of DIV_ROUND_UP.

I missed that because it is not built by default and can only be built
on a s390 system (or with some tricks with a cross-compiler).

Thanks,
Laurent

