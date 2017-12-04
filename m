Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLsvT-0005m3-Qd
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 10:44:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eLsvN-0005fl-BM
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eLsvH-0001Vv-RK
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:44:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1eLsvC-0001Rw-2q; Mon, 04 Dec 2017 10:44:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 790ED7970A;
	Mon,  4 Dec 2017 15:44:40 +0000 (UTC)
Received: from localhost (ovpn-12-25.pek2.redhat.com [10.72.12.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4E1619F7;
	Mon,  4 Dec 2017 15:44:39 +0000 (UTC)
Date: Mon, 4 Dec 2017 23:44:36 +0800
From: Fam Zheng <famz@redhat.com>
To: Shravan Rajinikanth <shravan2x@utexas.edu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171204154436.GC10628@lemon>
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Dec 2017 15:44:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Mon, 04 Dec 2017 15:44:58 -0000

On Sat, 12/02 14:37, Shravan Rajinikanth wrote:
> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 68b375f..bea9268 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *check, bool quiet)
>          if (check->leaks) {
>              qprintf(quiet,
>                      "\n%" PRId64 " leaked clusters were found on the image.\n"
> -                    "This means waste of disk space, but no harm to data.\n",
> +                    "This means disk space is wasted, but data is safe.\n",

To me both versions seem fine, could you explain the grammatical error in the
old message?

Fam

>                      check->leaks);
>          }
>  
> -- 
> 2.7.4
> 
> 

