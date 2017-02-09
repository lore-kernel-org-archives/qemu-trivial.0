Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbpkI-0002gD-31
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2017 09:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1cbpkF-0002eb-OQ
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 09:30:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1cbpkF-0006dp-0u
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 09:30:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1cbpk2-0006at-Gg; Thu, 09 Feb 2017 09:30:34 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CD358050D;
	Thu,  9 Feb 2017 14:30:34 +0000 (UTC)
Received: from localhost (ovpn-116-19.phx2.redhat.com [10.3.116.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v19EUW2d025592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 9 Feb 2017 09:30:33 -0500
Date: Thu, 9 Feb 2017 09:30:31 -0500
From: Jeff Cody <jcody@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Liu Yuan <namei.unix@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170209143031.GK27752@localhost.localdomain>
References: <1486642218-18520-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486642218-18520-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 09 Feb 2017 14:30:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-options: Fix broken sheepdog URL
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
X-List-Received-Date: Thu, 09 Feb 2017 14:30:48 -0000

On Thu, Feb 09, 2017 at 01:10:18PM +0100, Thomas Huth wrote:
> The sheepdog URL is broken twice: First it uses a duplicated
> http:// prefix, second the website seems to have moved to
> https://sheepdog.github.io/sheepdog/ instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ad2f8fc..38113b9 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2583,7 +2583,7 @@ Example
>  qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine
>  @end example
>  
> -See also @url{http://http://www.osrg.net/sheepdog/}.
> +See also @url{https://sheepdog.github.io/sheepdog/}.
>  
>  @item GlusterFS
>  GlusterFS is a user space distributed file system.
> -- 
> 1.8.3.1
> 

Thanks,

Applied to my block branch:

git://github.com/codyprime/qemu-kvm-jtc.git block

-Jeff

