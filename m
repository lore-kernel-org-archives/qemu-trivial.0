Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2N3P-0003Wp-Km
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2012 09:57:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T2N3N-0003Wh-5L
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:57:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T2N3M-0003EZ-94
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:57:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T2N3M-0003ET-0q; Fri, 17 Aug 2012 09:57:32 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7HDvU5t011017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 17 Aug 2012 09:57:30 -0400
Received: from doriath.home (ovpn-113-87.phx2.redhat.com [10.3.113.87])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7HDvS9X026796; Fri, 17 Aug 2012 09:57:28 -0400
Date: Fri, 17 Aug 2012 10:58:12 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120817105812.36060af8@doriath.home>
In-Reply-To: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] monitor: Fix warning from clang
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
X-List-Received-Date: Fri, 17 Aug 2012 13:57:34 -0000

On Fri, 17 Aug 2012 15:34:04 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> ccc-analyzer reports these warnings:
> 
> monitor.c:3532:21: warning: Division by zero
>                 val %= val2;
>                     ^
> monitor.c:3530:21: warning: Division by zero
>                 val /= val2;
>                     ^
> 
> Rewriting the code fixes this (and also a style issue).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

Although I wonder how far we're going "fixing" clang warnings/false positives...

> ---
>  monitor.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index 0c34934..0ea2c14 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
>              break;
>          case '/':
>          case '%':
> -            if (val2 == 0)
> +            if (val2 == 0) {
>                  expr_error(mon, "division by zero");
> -            if (op == '/')
> +            } else if (op == '/') {
>                  val /= val2;
> -            else
> +            } else {
>                  val %= val2;
> +            }
>              break;
>          }
>      }


