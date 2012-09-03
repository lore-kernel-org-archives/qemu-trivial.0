Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8ZpS-0006BG-79
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 12:48:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8ZpL-00068Y-LE
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8ZpG-00012o-Ku
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:48:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T8ZpG-00012a-Bm; Mon, 03 Sep 2012 12:48:38 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q83GmYoD019425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Sep 2012 12:48:34 -0400
Received: from doriath.home (ovpn-113-57.phx2.redhat.com [10.3.113.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q83GmWpQ020557; Mon, 3 Sep 2012 12:48:32 -0400
Date: Mon, 3 Sep 2012 13:49:20 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120903134920.2dff4a3d@doriath.home>
In-Reply-To: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
References: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: Remove unreachable
 code after g_error
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
X-List-Received-Date: Mon, 03 Sep 2012 16:48:49 -0000

On Sat,  1 Sep 2012 09:34:15 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Report from smatch:
> qemu-ga.c:117 register_signal_handlers(11) info: ignoring unreachable code.
> qemu-ga.c:122 register_signal_handlers(16) info: ignoring unreachable code.
> 
> g_error calls abort which terminates the program.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-ga.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/qemu-ga.c b/qemu-ga.c
> index 7623079..b747470 100644
> --- a/qemu-ga.c
> +++ b/qemu-ga.c
> @@ -114,12 +114,10 @@ static gboolean register_signal_handlers(void)
>      ret = sigaction(SIGINT, &sigact, NULL);
>      if (ret == -1) {
>          g_error("error configuring signal handler: %s", strerror(errno));
> -        return false;

Good catch, but we should really drop g_error() usage as qemu-ga will not
fail gracefully otherwise (will leak the pidfile, for example). We either
just drop g_error() or replace it by fprintf().

>      }
>      ret = sigaction(SIGTERM, &sigact, NULL);
>      if (ret == -1) {
>          g_error("error configuring signal handler: %s", strerror(errno));
> -        return false;
>      }
>  
>      return true;


