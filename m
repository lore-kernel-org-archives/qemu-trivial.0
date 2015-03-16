Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXORT-0004Iv-BA
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 02:23:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXORP-0004DO-5v
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXORC-0001AT-5r
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:23:55 -0400
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:33038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXORB-0001AE-Gw
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:23:42 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Mon, 16 Mar 2015 16:23:37 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Mar 2015 16:23:36 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 665802CE804E;
	Mon, 16 Mar 2015 17:23:35 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2G6NQ3U46137412; Mon, 16 Mar 2015 17:23:35 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2G6N0v6022690; Mon, 16 Mar 2015 17:23:00 +1100
Received: from skywalker.linux.vnet.ibm.com ([9.109.222.219])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2G6MufM022156
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 16 Mar 2015 17:22:58 +1100
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
In-Reply-To: <1426468829-8024-1-git-send-email-zhaoshenglong@huawei.com>
References: <1426468829-8024-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 16 Mar 2015 11:52:41 +0530
Message-ID: <87mw3dmpfy.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031606-0005-0000-0000-000001756CEE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.144
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] fsdev/virtfs-proxy-helper: Fix improper
	use of negative value
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
X-List-Received-Date: Mon, 16 Mar 2015 06:23:58 -0000

Shannon Zhao <zhaoshenglong@huawei.com> writes:

> It's detected by coverity. Check the return value of proxy_marshal.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

Applied

> ---
>  fsdev/virtfs-proxy-helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index c1da2d7..bf2e5f3 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -262,6 +262,9 @@ static int send_status(int sockfd, struct iovec *iovec, int status)
>       */
>      msg_size = proxy_marshal(iovec, 0, "ddd", header.type,
>                               header.size, status);
> +    if (msg_size < 0) {
> +        return msg_size;
> +    }
>      retval = socket_write(sockfd, iovec->iov_base, msg_size);
>      if (retval < 0) {
>          return retval;
> -- 
> 1.8.3.1


