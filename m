Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLIYE-0002XZ-Ro
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2012 14:59:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1TLIYC-0002PC-12
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 14:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1TLIYB-0003G0-7z
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 14:59:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1TLIY8-0003EO-6q; Mon, 08 Oct 2012 14:59:32 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q98IxUIX012912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 8 Oct 2012 14:59:30 -0400
Received: from redhat.com (vpn1-4-246.ams2.redhat.com [10.36.4.246])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id q98IxSWs030919; Mon, 8 Oct 2012 14:59:28 -0400
Date: Mon, 8 Oct 2012 22:01:20 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121008200120.GB17303@redhat.com>
References: <1349298662-16666-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349298662-16666-1-git-send-email-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-barrier: Fix compiler version check
 for future gcc versions
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
X-List-Received-Date: Mon, 08 Oct 2012 18:59:37 -0000

On Wed, Oct 03, 2012 at 11:11:02PM +0200, Stefan Weil wrote:
> The current check will give a wrong result for gcc-5.x with x < 4.
> Using QEMU_GNUC_PREREQ is simpler and fixes that issue.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> With current gcc versions (gcc-4.x) there is no problem.
> Nevertheless, I suggest to fix this in stable versions, too.
> 
> Regards
> 
> Stefan Weil

ACK for stable tree.

>  qemu-barrier.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-barrier.h b/qemu-barrier.h
> index 7e11197..16f0942 100644
> --- a/qemu-barrier.h
> +++ b/qemu-barrier.h
> @@ -19,7 +19,7 @@
>   * mfence on 32 bit as well, e.g. if built with -march=pentium-m.
>   * However, on i386, there seem to be known bugs as recently as 4.3.
>   * */
> -#if defined(__GNUC__) && __GNUC__ >= 4 && __GNUC_MINOR__ >= 4
> +#if QEMU_GNUC_PREREQ(4, 4)
>  #define smp_mb() __sync_synchronize()
>  #else
>  #define smp_mb() asm volatile("lock; addl $0,0(%%esp) " ::: "memory")
> -- 
> 1.7.10

