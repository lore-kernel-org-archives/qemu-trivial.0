Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWCfD-0004QI-FI
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 19:37:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YWCfA-0004MR-J8
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 19:37:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YWCf9-0008Fx-RY
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 19:37:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YWCf4-0008FJ-Lw; Thu, 12 Mar 2015 19:37:06 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2CNb5It024251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Mar 2015 19:37:06 -0400
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2CNb4H5017373; Thu, 12 Mar 2015 19:37:05 -0400
Date: Fri, 13 Mar 2015 07:37:04 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150312233704.GC32054@ad.nay.redhat.com>
References: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix resource leak with
 monitor_fdset_add_fd
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
X-List-Received-Date: Thu, 12 Mar 2015 23:37:13 -0000

On Thu, 03/12 15:57, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index eba5d4c..8902435 100644
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
> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,

Too long a line, with that fixed,

Reviewed-by: Fam Zheng <famz@redhat.com>

> +                                  fd_opaque, NULL);
> +    g_free(fdinfo);
>  
>      return 0;
>  }
> -- 
> 2.3.0
> 
> 

