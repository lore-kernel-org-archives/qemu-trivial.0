Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1clag5-0007dg-Uc
	for mharc-qemu-trivial@gnu.org; Wed, 08 Mar 2017 07:26:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1clag3-0007Zc-2N
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 07:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1clag1-0004Ha-Il
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 07:26:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1clafw-0004E6-Gl; Wed, 08 Mar 2017 07:26:40 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58298C0528A9;
	Wed,  8 Mar 2017 12:26:40 +0000 (UTC)
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v28CQbRA026770; Wed, 8 Mar 2017 07:26:37 -0500
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1488975205-26312-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <1ab2599d-2ef2-5a2e-85e2-44620f436488@redhat.com>
Date: Wed, 8 Mar 2017 13:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488975205-26312-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Mar 2017 12:26:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Fix broken URLs of amnhltm.zip
 and dosidle210.zip
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
X-List-Received-Date: Wed, 08 Mar 2017 12:26:48 -0000

On 08/03/2017 13:13, Thomas Huth wrote:
> There are some broken URLs in the qemu-doc which reference tools that
> are not available at their original location anymore. Fortunately, they
> have been mirrored to archive.org, so point to that location instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  qemu-doc.texi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 794ab4a..50411bc 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -1878,8 +1878,8 @@ resolution modes which the Cirrus Logic BIOS does not support (i.e. >=
>  Windows 9x does not correctly use the CPU HLT
>  instruction. The result is that it takes host CPU cycles even when
>  idle. You can install the utility from
> -@url{http://www.user.cityline.ru/~maxamn/amnhltm.zip} to solve this
> -problem. Note that no such tool is needed for NT, 2000 or XP.
> +@url{http://web.archive.org/web/20060212132151/http://www.user.cityline.ru/~maxamn/amnhltm.zip}
> +to solve this problem. Note that no such tool is needed for NT, 2000 or XP.
>  
>  @subsubsection Windows 2000 disk full problem
>  
> @@ -1927,9 +1927,9 @@ vvfat block device ("-hdb fat:directory_which_holds_the_SP").
>  @subsubsection CPU usage reduction
>  
>  DOS does not correctly use the CPU HLT instruction. The result is that
> -it takes host CPU cycles even when idle. You can install the utility
> -from @url{http://www.vmware.com/software/dosidle210.zip} to solve this
> -problem.
> +it takes host CPU cycles even when idle. You can install the utility from
> +@url{http://web.archive.org/web/20051222085335/http://www.vmware.com/software/dosidle210.zip}
> +to solve this problem.
>  
>  @node QEMU System emulator for non PC targets
>  @chapter QEMU System emulator for non PC targets
> 


