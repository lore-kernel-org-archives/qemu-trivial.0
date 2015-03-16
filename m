Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXOI2-0000q6-Mv
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 02:14:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YXOI0-0000nT-9i
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YXOHz-0006st-9F
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:14:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YXOHu-0006rx-8d; Mon, 16 Mar 2015 02:14:06 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 16DDB8F309;
	Mon, 16 Mar 2015 06:14:05 +0000 (UTC)
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2G6E3uq006341; Mon, 16 Mar 2015 02:14:04 -0400
Date: Mon, 16 Mar 2015 14:14:02 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150316061402.GB15098@ad.nay.redhat.com>
References: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	armbru@redhat.com
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
X-List-Received-Date: Mon, 16 Mar 2015 06:14:13 -0000

On Sun, 03/15 10:16, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Fam Zheng <famz@redhat.com>

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
> -- 
> 2.3.0
> 
> 

