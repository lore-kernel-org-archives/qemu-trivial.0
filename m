Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eA92H-0000N7-92
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 02:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eA92E-0000Li-IQ
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 02:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eA92D-0002ct-RQ
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 02:31:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eA928-0002XC-3i; Thu, 02 Nov 2017 02:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C7B881DEB;
	Thu,  2 Nov 2017 06:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C7B881DEB
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.111] (ovpn-116-111.ams2.redhat.com [10.36.116.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A64F60602;
	Thu,  2 Nov 2017 06:31:15 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170126153837.25597-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3ca6376a-ae3e-1e5c-503f-239e4e62799c@redhat.com>
Date: Thu, 2 Nov 2017 07:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20170126153837.25597-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 02 Nov 2017 06:31:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] aio-posix: drop
 QEMU_AIO_POLL_MAX_NS env var
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
X-List-Received-Date: Thu, 02 Nov 2017 06:31:27 -0000

On 26.01.2017 16:38, Stefan Hajnoczi wrote:
> This hunk should not have been merged but I forgot to remove it.  Let's
> remove it before it slips into a QEMU release.

Too late - looks like this patch has never been committed :-(

> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  aio-posix.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/aio-posix.c b/aio-posix.c
> index 9453d83..9a6348b 100644
> --- a/aio-posix.c
> +++ b/aio-posix.c
> @@ -723,13 +723,6 @@ bool aio_poll(AioContext *ctx, bool blocking)
>  
>  void aio_context_setup(AioContext *ctx)
>  {
> -    /* TODO remove this in final patch submission */
> -    if (getenv("QEMU_AIO_POLL_MAX_NS")) {
> -        fprintf(stderr, "The QEMU_AIO_POLL_MAX_NS environment variable has "
> -                "been replaced with -object iothread,poll-max-ns=NUM\n");
> -        exit(1);
> -    }
> -
>  #ifdef CONFIG_EPOLL_CREATE1
>      assert(!ctx->epollfd);
>      ctx->epollfd = epoll_create1(EPOLL_CLOEXEC);
> 

Could we get this at least added for QEMU 2.11 ?

Reviewed-by: Thomas Huth <thuth@redhat.com>

