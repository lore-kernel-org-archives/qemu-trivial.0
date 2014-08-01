Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDDMC-0001wF-P6
	for mharc-qemu-trivial@gnu.org; Fri, 01 Aug 2014 09:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XDDM6-0001lb-1c
	for qemu-trivial@nongnu.org; Fri, 01 Aug 2014 09:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XDDM0-0007aP-U6
	for qemu-trivial@nongnu.org; Fri, 01 Aug 2014 09:58:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1XDDLq-0007ND-Gc; Fri, 01 Aug 2014 09:58:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s71DwSq8011791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 1 Aug 2014 09:58:28 -0400
Received: from localhost (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s71DwP3B006479; Fri, 1 Aug 2014 09:58:26 -0400
Date: Fri, 1 Aug 2014 09:58:24 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140801095824.1c0e79d6@redhat.com>
In-Reply-To: <1406672560-21029-1-git-send-email-kroosec@gmail.com>
References: <1406672560-21029-1-git-send-email-kroosec@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove hardcoded watchdog event
	names
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
X-List-Received-Date: Fri, 01 Aug 2014 13:58:51 -0000

On Tue, 29 Jul 2014 23:22:40 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> Signed-off-by: Hani Benhabiles <hani@linux.com>

Applied to the qmp-next branch, thanks.

> ---
>  monitor.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index 5bc70a6..7465775 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4520,16 +4520,15 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
>  
>  void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
>  {
> +    int i;
> +
>      if (nb_args != 2) {
>          return;
>      }
>      readline_set_completion_index(rs, strlen(str));
> -    add_completion_option(rs, str, "reset");
> -    add_completion_option(rs, str, "shutdown");
> -    add_completion_option(rs, str, "poweroff");
> -    add_completion_option(rs, str, "pause");
> -    add_completion_option(rs, str, "debug");
> -    add_completion_option(rs, str, "none");
> +    for (i = 0; WatchdogExpirationAction_lookup[i]; i++) {
> +        add_completion_option(rs, str, WatchdogExpirationAction_lookup[i]);
> +    }
>  }
>  
>  void migrate_set_capability_completion(ReadLineState *rs, int nb_args,


