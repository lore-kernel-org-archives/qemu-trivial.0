Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwWVa-0002ZG-CI
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 06:50:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWVS-00029Q-3W
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWVR-0002mZ-6e
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:50:22 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:60393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SwWVK-0002l8-3y; Wed, 01 Aug 2012 06:50:14 -0400
Received: by wgbfm10 with SMTP id fm10so5419838wgb.10
	for <multiple recipients>; Wed, 01 Aug 2012 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FeN0XOaKuK8WwQcZHHpV0GrEMXGpzsDi1AVrNjS10co=;
	b=q17MLxfou1mrir0HPiMBqAJruEWDHexh90f7dDAdvwgdIEgz9cwnLrZ5v79sTGtDHT
	by0XxHvIPY9pgGIlMcuG76XShnBusxh095Qg5ShvwlSliCGiJn7hdFP3m55fMM4bxBBI
	pVcGQQ+s8Kit0tJvKySHn1ZCQjdeYu/4sA9vwMovcNoOCqRrv5sgaag/oWJUoJpG+ihh
	K9gEdkHNi2wx57xvaJ6F7KU0J1oKJI07vPdjXsS6Ajc0Mqj4JIcC8Gd8YihIjSUUG47x
	SjArXrCAQfQqSCVpcU4QqRoDRdf4x4zmXc39dK2Wp0xkioiTYlmQjO1FR09499HN41Zw
	lKMA==
Received: by 10.216.244.202 with SMTP id m52mr7608731wer.28.1343818213036;
	Wed, 01 Aug 2012 03:50:13 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm27311569wiy.3.2012.08.01.03.50.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 03:50:12 -0700 (PDT)
Date: Wed, 1 Aug 2012 11:50:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Amos Kong <akong@redhat.com>
Message-ID: <20120801105011.GC17816@stefanha-thinkpad.localdomain>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
	<1343811543-12137-2-git-send-email-akong@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343811543-12137-2-git-send-email-akong@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [RESEND PATCH 1/3] socket: remove redundant check
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
X-List-Received-Date: Wed, 01 Aug 2012 10:50:28 -0000

On Wed, Aug 01, 2012 at 04:59:01PM +0800, Amos Kong wrote:
> It's aleady in the end of loop, error should be set.
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  qemu-sockets.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-sockets.c b/qemu-sockets.c
> index 668fa93..c636882 100644
> --- a/qemu-sockets.c
> +++ b/qemu-sockets.c
> @@ -181,9 +181,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
>                  fprintf(stderr,"%s: bind(%s,%s,%d): %s\n", __FUNCTION__,
>                          inet_strfamily(e->ai_family), uaddr, inet_getport(e),
>                          strerror(errno));
> -                if (!e->ai_next) {
> -                    error_set(errp, QERR_SOCKET_BIND_FAILED);
> -                }
> +                error_set(errp, QERR_SOCKET_BIND_FAILED);
>              }
>          }
>          closesocket(slisten);

This isn't obvious.  It looks like the intent of the if (!e->ai_next) is
to suppress the error so that the next iteration of the *outer* loop can
succeed.

Why is it okay to set QERR_SOCKET_BIND_FAILED?  We may have more
addrinfos left to try in the outer loop.  They may succeed so we don't
want an error in that case.

Stefan

