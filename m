Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1s13-0003Wq-K4
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 05:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c1s11-0003Va-F1
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 05:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c1s10-0007KS-Ht
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 05:39:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c1s0t-0007FO-OC; Wed, 02 Nov 2016 05:39:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3416C04B31F;
	Wed,  2 Nov 2016 09:39:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA29dDVr019506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 2 Nov 2016 05:39:14 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1D73311386CE; Wed,  2 Nov 2016 10:39:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1477728462-16774-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Wed, 02 Nov 2016 10:39:13 +0100
In-Reply-To: <1477728462-16774-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Sat, 29 Oct 2016 11:07:42 +0300")
Message-ID: <87ziliqkzi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 02 Nov 2016 09:39:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: move pidfile creation
 up
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
X-List-Received-Date: Wed, 02 Nov 2016 09:39:28 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> With current code, pid file is open after various
> sockets, chardevs, fsdevs and the like.  This causes
> interesting effects, for example when monitor is a
> unix-socket, and another qemu instance is already
> running, new qemu first "damages" the socket and
> next complain that it can't acquire the pid file and
> exits, making running qemu unreachable.
>
> Move pid file creation a bit earlier.

Makes sense, but ...

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 55763f7..7989f75 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4305,6 +4305,11 @@ int main(int argc, char **argv, char **envp)
>          exit(1);
>      }
>  
> +    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> +        error_report("could not acquire pid file: %s", strerror(errno));
> +        exit(1);
> +    }
> +
>      page_size_init();
>      socket_init();
>  

... is this early enough?  For instance, we clobber the log file another
200 lines further up.

A "don't clobber anything externally visible before this spot" comment
could be useful.

> @@ -4326,11 +4331,6 @@ int main(int argc, char **argv, char **envp)
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

