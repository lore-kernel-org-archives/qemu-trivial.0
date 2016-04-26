Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auxCU-0000xv-4R
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 03:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1auxCR-0000tb-LW
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 03:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1auxCQ-0004Fb-Ly
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 03:14:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1auxCL-0004F5-32; Tue, 26 Apr 2016 03:14:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D4A23455AE;
	Tue, 26 Apr 2016 07:14:16 +0000 (UTC)
Received: from [10.72.5.164] (vpn1-5-164.pek2.redhat.com [10.72.5.164])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3Q7ECEM020225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2016 03:14:14 -0400
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
From: Jason Wang <jasowang@redhat.com>
Message-ID: <571F1544.2090109@redhat.com>
Date: Tue, 26 Apr 2016 15:14:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/tap: Allocating Large
 sized arrays to heap
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
X-List-Received-Date: Tue, 26 Apr 2016 07:14:24 -0000



On 04/26/2016 09:26 AM, Zhou Jie wrote:
> net_init_tap has a huge stack usage of 8192 bytes approx.
> Moving large arrays to heap to reduce stack usage.
>
> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
> ---
>  net/tap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/net/tap.c b/net/tap.c
> index 740e8a2..49817c7 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -769,8 +769,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>              return -1;
>          }
>      } else if (tap->has_fds) {
> -        char *fds[MAX_TAP_QUEUES];
> -        char *vhost_fds[MAX_TAP_QUEUES];
> +        char **fds = g_new(char *, MAX_TAP_QUEUES);
> +        char **vhost_fds = g_new(char *, MAX_TAP_QUEUES);
>          int nfds, nvhosts;
>  
>          if (tap->has_ifname || tap->has_script || tap->has_downscript ||
> @@ -818,6 +818,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>                  return -1;
>              }
>          }
> +        g_free(fds);
> +        g_free(vhost_fds);
>      } else if (tap->has_helper) {
>          if (tap->has_ifname || tap->has_script || tap->has_downscript ||
>              tap->has_vnet_hdr || tap->has_queues || tap->has_vhostfds) {

Apply to net-next.

Thanks

