Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auxh3-0003dc-9g
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 03:46:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auxgw-0003Nw-Hx
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 03:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auxgs-0002XB-LC
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 03:45:54 -0400
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:46667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auxgs-0002Wk-Az
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 03:45:50 -0400
Received: from localhost
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 26 Apr 2016 08:45:48 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 26 Apr 2016 08:45:44 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id E468317D805A; 
	Tue, 26 Apr 2016 08:46:33 +0100 (BST)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u3Q7jhLG60882972; Tue, 26 Apr 2016 07:45:43 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u3Q7jgVf000858; Tue, 26 Apr 2016 01:45:43 -0600
Received: from oc1450873852.ibm.com (dyn-9-152-224-38.boeblingen.de.ibm.com
	[9.152.224.38])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u3Q7jeUh000709; Tue, 26 Apr 2016 01:45:40 -0600
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, jasowang@redhat.com
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <571F1CA4.70306@de.ibm.com>
Date: Tue, 26 Apr 2016 09:45:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042607-0041-0000-0000-0000167A2FDF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
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
X-List-Received-Date: Tue, 26 Apr 2016 07:46:00 -0000

On 04/26/2016 03:26 AM, Zhou Jie wrote:
> net_init_tap has a huge stack usage of 8192 bytes approx.
> Moving large arrays to heap to reduce stack usage.

I am wondering. Why is 8k a problem for a user space program? 

Please note that malloc/new like allocations are much more expensive
than stack allocation in terms of performance. This does not matter
here, but in your other patch that deals with the xmit function, I would
not be surprised if that actually harms performance.

Christian



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
> 


