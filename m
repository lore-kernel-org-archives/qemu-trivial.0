Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCOCV-00045F-Ew
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 05:30:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOCT-00042I-7N
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOCR-0008EH-83
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:30:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCOCM-0008D9-GA; Mon, 13 Jun 2016 05:30:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0044F80E47;
	Mon, 13 Jun 2016 09:30:22 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D9UGRw009306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 05:30:18 -0400
To: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org
References: <1465495115-24665-1-git-send-email-sergey.fedorov@linaro.org>
Cc: qemu-trivial@nongnu.org, patches@linaro.org,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b9be9cb-0e90-bc03-6fac-4bccf90880dd@redhat.com>
Date: Mon, 13 Jun 2016 11:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465495115-24665-1-git-send-email-sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 Jun 2016 09:30:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Fix tag file generation targets
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
X-List-Received-Date: Mon, 13 Jun 2016 09:30:30 -0000



On 09/06/2016 19:58, Sergey Fedorov wrote:
> From: Sergey Fedorov <serge.fdrv@gmail.com>
> 
> "ctags" produces a file named "tags", not "ctags". It doesn't look
> reasonable to use phony target name as a file name to remove. Just use
> exact file names to remove in "ctags" and "TAGS" target receipts.
> 
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b8563db68677..61bf1bf9e2bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -478,12 +478,12 @@ test speed: all
>  
>  .PHONY: ctags
>  ctags:
> -	rm -f $@
> +	rm -f tags
>  	find "$(SRC_PATH)" -name '*.[hc]' -exec ctags --append {} +
>  
>  .PHONY: TAGS
>  TAGS:
> -	rm -f $@
> +	rm -f TAGS
>  	find "$(SRC_PATH)" -name '*.[hc]' -exec etags --append {} +
>  
>  cscope:
> 

Queued, thanks.

Paolo

