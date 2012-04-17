Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKCM0-0001jh-NE
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:38:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SKCLu-0001QW-GX
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SKCLp-0005Id-RA
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:38:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1SKCLi-0005F1-V9; Tue, 17 Apr 2012 13:37:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3HHbpTD014696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 17 Apr 2012 13:37:51 -0400
Received: from doriath.home (ovpn-113-173.phx2.redhat.com [10.3.113.173])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3HHbnRN016392; Tue, 17 Apr 2012 13:37:50 -0400
Date: Tue, 17 Apr 2012 14:38:02 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120417143802.5838db99@doriath.home>
In-Reply-To: <1334682459-27835-2-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1334682459-27835-2-git-send-email-mdroth@linux.vnet.ibm.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-ga: fix help output
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
X-List-Received-Date: Tue, 17 Apr 2012 17:38:10 -0000

On Tue, 17 Apr 2012 12:07:39 -0500
Michael Roth <mdroth@linux.vnet.ibm.com> wrote:

> 
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qemu-ga.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-ga.c b/qemu-ga.c
> index d6f786e..74a1b02 100644
> --- a/qemu-ga.c
> +++ b/qemu-ga.c
> @@ -117,12 +117,13 @@ static gboolean register_signal_handlers(void)
>  static void usage(const char *cmd)
>  {
>      printf(
> -"Usage: %s -c <channel_opts>\n"
> +"Usage: %s [-m <method> -p <path>] [<options>]\n"
>  "QEMU Guest Agent %s\n"
>  "\n"
>  "  -m, --method      transport method: one of unix-listen, virtio-serial, or\n"
>  "                    isa-serial (virtio-serial is the default)\n"
> -"  -p, --path        device/socket path (%s is the default for virtio-serial)\n"
> +"  -p, --path        device/socket path (the default for virtio-serial is:\n"
> +"                    %s)\n"
>  "  -l, --logfile     set logfile path, logs to stderr by default\n"
>  "  -f, --pidfile     specify pidfile (default is %s)\n"
>  "  -v, --verbose     log extra debugging information\n"
> @@ -131,7 +132,7 @@ static void usage(const char *cmd)
>  #ifdef _WIN32
>  "  -s, --service     service commands: install, uninstall\n"
>  #endif
> -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\""
> +"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>  "                    to list available RPCs)\n"
>  "  -h, --help        display this help and exit\n"
>  "\n"


