Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWagm-00046Y-DY
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 21:16:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWagj-00046M-UL
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 21:16:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWage-0000LJ-VZ
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 21:16:25 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:23207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWage-0000J5-7V; Fri, 13 Mar 2015 21:16:20 -0400
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDB76013; Sat, 14 Mar 2015 09:16:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 14 Mar 2015 09:16:00 +0800
Message-ID: <55038BCE.8030700@huawei.com>
Date: Sat, 14 Mar 2015 09:15:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.55038BDA.00E4, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c9b7a26edf56deec8eadd1883b22b007
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, famz@redhat.com,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: fix resource leak with
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
X-List-Received-Date: Sat, 14 Mar 2015 01:16:26 -0000

On 2015/3/13 20:55, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	v1->v2: line length [Fam], pass &error_abort [Shannon]
> ---
>  vl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> diff --git a/vl.c b/vl.c
> index eba5d4c..9eae8f9 100644
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
> @@ -1060,8 +1061,10 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
>      }
>  
>      /* add the duplicate fd, and optionally the opaque string, to the fd set */
> -    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
> -                         fd_opaque, NULL);
> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id,
> +                                  fd_opaque ? true : false, fd_opaque,
> +                                  &error_abort);
> +    g_free(fdinfo);
>  
>      return 0;
>  }
> 


-- 
Thanks,
Shannon


