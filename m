Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6RgS-0005VH-C1
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 16:19:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1W6RgL-0005F4-C4
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 16:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1W6RgG-0001Yh-9c
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 16:19:25 -0500
Received: from paradis.irqsave.net ([62.212.105.220]:48190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1W6Rg5-0001Xy-W8; Thu, 23 Jan 2014 16:19:10 -0500
Received: from irqsave.net (laure.irqsave.net [192.168.77.2])
	by paradis.irqsave.net (Postfix) with ESMTP id 1F7AB5B5B7;
	Thu, 23 Jan 2014 22:47:26 +0100 (CET)
Date: Thu, 23 Jan 2014 22:19:08 +0100
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20140123211908.GB22578@irqsave.net>
References: <1390508879-13729-1-git-send-email-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1390508879-13729-1-git-send-email-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep: drop unused #include
	"trace.h"
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
X-List-Received-Date: Thu, 23 Jan 2014 21:19:30 -0000

Le Thursday 23 Jan 2014 =E0 14:27:59 (-0600), Stefan Hajnoczi a =E9crit :
> osdep.c does not use trace_*() so we can just drop the include.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/osdep.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/util/osdep.c b/util/osdep.c
> index 62072b4..bd4f530 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -46,7 +46,6 @@ extern int madvise(caddr_t, size_t, int);
>  #endif
> =20
>  #include "qemu-common.h"
> -#include "trace.h"
>  #include "qemu/sockets.h"
>  #include "monitor/monitor.h"
> =20
> --=20
> 1.8.4.2
>=20
>=20
Reviewed-by: Benoit Canet <benoit@irqsave.net>

