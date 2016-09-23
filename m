Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnMua-0000Q9-Ta
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 05:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bnMuX-0000L9-5f
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 05:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bnMuV-0001pZ-Bo
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 05:36:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bnMuO-0001kY-NK; Fri, 23 Sep 2016 05:36:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1038DB0433;
	Fri, 23 Sep 2016 09:36:40 +0000 (UTC)
Received: from localhost (vpn1-5-228.pek2.redhat.com [10.72.5.228])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N9acvx027802; Fri, 23 Sep 2016 05:36:39 -0400
Date: Fri, 23 Sep 2016 17:36:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Lin Ma <lma@suse.com>
Cc: qemu-devel@nongnu.org, mjt@tls.msk.ru, qemu-trivial@nongnu.org
Message-ID: <20160923093637.GI8832@lemon>
References: <20160923091606.20323-1-lma@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160923091606.20323-1-lma@suse.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 23 Sep 2016 09:36:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] maint: Add module_block.h
 to .gitignore
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
X-List-Received-Date: Fri, 23 Sep 2016 09:36:52 -0000

On Fri, 09/23 17:16, Lin Ma wrote:
> Commit 0c0c1fd9 generated module_block.h automatically, Add it to .gitignore to
> avoid checking in it by 'git add .'.
> 
> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index c91d018..97aca6c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -55,6 +55,7 @@
>  /qemu-monitor-info.texi
>  /qemu-version.h
>  /qemu-version.h.tmp
> +/module_block.h
>  /vscclient
>  /fsdev/virtfs-proxy-helper
>  *.[1-9]
> -- 
> 2.9.2
> 
> 

Reviewed-by: Fam Zheng <famz@redhat.com>

