Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VE1TU-0008PL-Co
	for mharc-qemu-trivial@gnu.org; Mon, 26 Aug 2013 14:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1VDzAR-0003gf-Q9
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 11:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1VDzAM-0004h1-Um
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 11:57:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1VDzAC-0004du-LL; Mon, 26 Aug 2013 11:57:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7QFv72D015224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 26 Aug 2013 11:57:07 -0400
Received: from localhost (ovpn-113-60.phx2.redhat.com [10.3.113.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7QFv5oF010631; Mon, 26 Aug 2013 11:57:06 -0400
Date: Mon, 26 Aug 2013 11:48:59 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130826114859.640f5d87@redhat.com>
In-Reply-To: <1377199809-12208-1-git-send-email-sw@weilnetz.de>
References: <1377199809-12208-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 26 Aug 2013 14:25:11 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] monitor: Add missing attributes to local
	function
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
X-List-Received-Date: Mon, 26 Aug 2013 15:57:29 -0000

On Thu, 22 Aug 2013 21:30:09 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Function expr_error gets a format string and variable arguments like printf.
> It also never returns. Add the necessary attributes.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Applied to the qmp branch, thanks.

> ---
>  monitor.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/monitor.c b/monitor.c
> index da9c9a2..6413d44 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -3171,7 +3171,8 @@ static const MonitorDef monitor_defs[] = {
>      { NULL },
>  };
>  
> -static void expr_error(Monitor *mon, const char *fmt, ...)
> +static void GCC_FMT_ATTR(2, 3) QEMU_NORETURN
> +expr_error(Monitor *mon, const char *fmt, ...)
>  {
>      va_list ap;
>      va_start(ap, fmt);


