Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPrD-0000m3-Pw
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:42:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWHz4-00083p-SJ
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWHz3-00053u-QH
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:18:06 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:22149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWHyy-0004vG-Ti; Fri, 13 Mar 2015 01:18:01 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKS85049; Fri, 13 Mar 2015 13:17:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 13 Mar 2015 13:17:41 +0800
Message-ID: <550272F4.30309@huawei.com>
Date: Fri, 13 Mar 2015 13:17:40 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
X-Mailman-Approved-At: Fri, 13 Mar 2015 09:42:30 -0400
Cc: qemu-trivial@nongnu.org, Hangaohuai <hangaohuai@huawei.com>,
	"Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
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
X-List-Received-Date: Fri, 13 Mar 2015 05:18:07 -0000

On 2015/3/12 22:57, Paolo Bonzini wrote:
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
> +                                  fd_opaque, NULL);
> +    g_free(fdinfo);
>  
>      return 0;
>  }
> 

Hi Paolo,

Not about the resource leak, but I think we should check fdinfo == NULL and return -1.
Then when error occurs, qemu will exit. Besides we should pass a meaningful errp not NULL.
So qemu can report the error reason. Right?

-- 
Thanks,
Shannon


