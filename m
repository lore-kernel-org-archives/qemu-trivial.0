Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c2CZD-0000gC-U1
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2016 03:36:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c2CZB-0000em-LE
	for qemu-trivial@nongnu.org; Thu, 03 Nov 2016 03:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c2CZA-0000Kv-Rk
	for qemu-trivial@nongnu.org; Thu, 03 Nov 2016 03:36:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c2CZ3-0000I3-Gb; Thu, 03 Nov 2016 03:35:57 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 019D77F76D;
	Thu,  3 Nov 2016 07:35:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA37ZsQf006851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Nov 2016 03:35:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BB18611386CE; Thu,  3 Nov 2016 08:35:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Thu, 03 Nov 2016 08:35:53 +0100
In-Reply-To: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Wed, 2 Nov 2016 17:18:50 +0300")
Message-ID: <8737j9582u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 03 Nov 2016 07:35:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: move pidfile
 creation up the line
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
X-List-Received-Date: Thu, 03 Nov 2016 07:36:06 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> With current code, pid file is open after various
> sockets, chardevs, fsdevs and the like.  This causes
> interesting effects, for example when monitor is a
> unix-socket, and another qemu instance is already
> running, new qemu first "damages" the socket and
> next complain that it can't acquire the pid file and
> exits, making running qemu unreachable.
>
> Move pid file creation earlier, right after the call
> to os_daemonize(), where we know our process id (pid).
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> v2: move the pid file creation even earlier, as per
> comment by Markus Armbruster
>
> diff --git a/vl.c b/vl.c
> index 368510f..ce7e998 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4058,6 +4058,11 @@ int main(int argc, char **argv, char **envp)
>  
>      os_daemonize();
>  
> +    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> +        error_report("could not acquire pid file: %s", strerror(errno));
> +        exit(1);
> +    }
> +
>      if (qemu_init_main_loop(&main_loop_err)) {
>          error_report_err(main_loop_err);
>          exit(1);
> @@ -4335,11 +4340,6 @@ int main(int argc, char **argv, char **envp)
>      }
>  #endif
>  
> -    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> -        error_report("could not acquire pid file: %s", strerror(errno));
> -        exit(1);
> -    }
> -
>      if (qemu_opts_foreach(qemu_find_opts("device"),
>                            device_help_func, NULL, NULL)) {
>          exit(0);

Right after os_daemonize() is as early as possible.  There might be
stuff happening before os_daemonize() that shouldn't, but I'm not
demanding you search for it to get this patch in.

The wider problem: we spread around parsing, checking and acting upon
command line options pretty carelessly, even though checking after
daemonize and acting before it is problematic.

Regardless,
Reviewed-by: Markus Armbruster <armbru@redhat.com>

