Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8sT0-0002UZ-SS
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 08:15:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8sSx-0002PY-GP
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 08:15:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8sSu-0008Kq-Ls
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 08:15:07 -0500
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:42204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8sSu-0008Gp-3o
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 08:15:04 -0500
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Fri, 22 Feb 2013 23:08:51 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 22 Feb 2013 23:08:48 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 304302BB0050;
	Sat, 23 Feb 2013 00:14:50 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r1MD2INj786750; Sat, 23 Feb 2013 00:02:19 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r1MDEnoE020015; Sat, 23 Feb 2013 00:14:49 +1100
Received: from titi.na.relay.ibm.com (sig-9-49-153-3.mts.ibm.com [9.49.153.3])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r1MDEdKW019873; Sat, 23 Feb 2013 00:14:45 +1100
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
In-Reply-To: <1361514481-26164-1-git-send-email-sw@weilnetz.de>
References: <1361514481-26164-1-git-send-email-sw@weilnetz.de>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Fri, 22 Feb 2013 07:14:39 -0600
Message-ID: <87obfcxzgg.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13022213-6102-0000-0000-0000030BDAD7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.145
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/gtk: Fix build (missing
	include for setlocale)
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
X-List-Received-Date: Fri, 22 Feb 2013 13:15:09 -0000

Stefan Weil <sw@weilnetz.de> writes:

> At least for Ubuntu Linux locale.h is needed.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, what version of Ubuntu?  I'm running 11.10 and don't have this
problem.

Regards,

Anthony Liguori

> ---
>
> This is a build regression, please apply without waiting for qemu-trivial.
>
> Thanks,
> Stefan
>
>  ui/gtk.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 29156be..5f91de4 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -37,6 +37,7 @@
>  #include <gtk/gtk.h>
>  #include <gdk/gdkkeysyms.h>
>  #include <glib/gi18n.h>
> +#include <locale.h>
>  #include <vte/vte.h>
>  #include <sys/types.h>
>  #include <sys/socket.h>
> -- 
> 1.7.10.4


