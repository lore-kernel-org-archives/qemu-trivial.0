Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEk2e-000399-GN
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2012 12:55:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEk2c-00032d-C3
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 12:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEk2X-0008US-MR
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 12:55:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:39293)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TEk2L-0008S1-LB; Thu, 20 Sep 2012 12:55:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AF1847280033; Thu, 20 Sep 2012 18:55:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id T9KoDPfNd3-S; Thu, 20 Sep 2012 18:55:33 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9B9D.dip.t-dialin.net [84.173.155.157])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C72187280032; Thu, 20 Sep 2012 18:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TEk2H-00012X-Bh; Thu, 20 Sep 2012 18:55:33 +0200
Message-ID: <505B4A85.3030600@weilnetz.de>
Date: Thu, 20 Sep 2012 18:55:33 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1346485226-26554-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346485226-26554-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: Fix potential memory leak
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
X-List-Received-Date: Thu, 20 Sep 2012 16:55:55 -0000

Am 01.09.2012 09:40, schrieb Stefan Weil:
> The old code leaks variable 'peer'.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   qemu-sockets.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Report from smatch:
> qemu-sockets.c:404 inet_dgram_opts(101) warn: variable dereferenced before check 'peer' (see line 401)
>
> It looks like this warning does not make sense, but nevertheless
> it helped me to discover the leak.
>
> Regards,
> Stefan Weil
>
> diff --git a/qemu-sockets.c b/qemu-sockets.c
> index 361d890..037775b 100644
> --- a/qemu-sockets.c
> +++ b/qemu-sockets.c
> @@ -353,7 +353,7 @@ int inet_dgram_opts(QemuOpts *opts)
>       if (0 != (rc = getaddrinfo(addr, port,&ai,&local))) {
>           fprintf(stderr,"getaddrinfo(%s,%s): %s\n", addr, port,
>                   gai_strerror(rc));
> -        return -1;
> +        goto err;
>       }
>
>       /* create socket */


Ping? That code is from 2009, so the patch could also be applied
to stable (even if the chance of getting that leak is small).

Regards

Stefan Weil


