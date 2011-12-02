Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWNYO-0003aO-Es
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 02:29:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWNYM-0003aB-CI
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:29:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWNYL-0002QA-F0
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:29:02 -0500
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:40722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWNYK-0002Pf-Qf
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:29:01 -0500
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wudxw@linux.vnet.ibm.com>;
	Fri, 2 Dec 2011 12:58:52 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
	by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2011 12:58:48 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB27Slmf3391742; Fri, 2 Dec 2011 12:58:48 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pB27SjDD024218; Fri, 2 Dec 2011 18:28:46 +1100
Received: from oc4654482034.ibm.com ([9.115.122.62])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB27SgsI024119; Fri, 2 Dec 2011 18:28:42 +1100
Message-ID: <4ED87E29.1010207@linux.vnet.ibm.com>
Date: Fri, 02 Dec 2011 15:28:41 +0800
From: Mark Wu <wudxw@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110927 Red Hat/3.1.15-1.el6_1
	Thunderbird/3.1.15
MIME-Version: 1.0
To: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
References: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
In-Reply-To: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
x-cbid: 11120207-5816-0000-0000-00000049FE8B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.2
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-nbd.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 07:29:03 -0000

On 12/02/2011 11:34 AM, Li Zhi Hui wrote:
> Signed-off-by: Li Zhi Hui<zhihuili@linux.vnet.ibm.com>
> ---
>   qemu-nbd.c |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 291cba2..ab7fa6c 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -500,8 +500,10 @@ int main(int argc, char **argv)
>           sharing_fds[0] = tcp_socket_incoming(bindto, port);
>       }
>
> -    if (sharing_fds[0] == -1)
> +    if (sharing_fds[0] == -1) {
> +        g_free(sharing_fds);
>           return 1;
> +    }
>
>       if (device) {
>           int ret;
Zhihui,

Kernel should free all memory used by the process after it exits.  So  
there's no memory leak even without explicit free.


