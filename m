Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXPN3-0006Lo-Jl
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 03:23:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXPN1-0006Iv-6R
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXPN0-000211-40
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:23:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXPMv-000202-B8; Mon, 16 Mar 2015 03:23:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2G7NHFX009946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Mar 2015 03:23:18 -0400
Received: from blackfin.pond.sub.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2G7NFD2015525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 16 Mar 2015 03:23:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8D98C303F19F; Mon, 16 Mar 2015 08:23:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
Date: Mon, 16 Mar 2015 08:23:14 +0100
In-Reply-To: <1426410988-3695-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Sun, 15 Mar 2015 10:16:28 +0100")
Message-ID: <87egop4d99.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] vl: fix resource leak
	with monitor_fdset_add_fd
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
X-List-Received-Date: Mon, 16 Mar 2015 07:23:28 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	v1->v2: line length [Fam], pass &error_abort [Shannon]
>         v2->v3: use "!!" instead of "? true : false" [Markus]
> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index eba5d4c..5985680 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1011,6 +1011,7 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
>      int fd, dupfd, flags;
>      int64_t fdset_id;
>      const char *fd_opaque = NULL;
> +    AddfdInfo *fdinfo;
>  
>      fd = qemu_opt_get_number(opts, "fd", -1);
>      fdset_id = qemu_opt_get_number(opts, "set", -1);
> @@ -1060,8 +1061,9 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
>      }
>  
>      /* add the duplicate fd, and optionally the opaque string, to the fd set */
> -    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
> -                         fd_opaque, NULL);
> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
> +                                  &error_abort);
> +    g_free(fdinfo);
>  
>      return 0;
>  }

Aside: monitor_fdset_add_fd()'s two has_ parameters are rather
unnatural.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

