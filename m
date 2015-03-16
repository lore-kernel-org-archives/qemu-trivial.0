Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXOYy-0005tx-Hn
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 02:31:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXOYw-0005tr-59
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXOYs-0003eQ-WD
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:31:42 -0400
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:34550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXOYs-0003Yy-Bq
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 02:31:38 -0400
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Mon, 16 Mar 2015 12:01:34 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Mar 2015 12:01:31 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id F00121258059;
	Mon, 16 Mar 2015 12:03:01 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2G6VSq232112644; Mon, 16 Mar 2015 12:01:28 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2G6VQmL009407; Mon, 16 Mar 2015 12:01:27 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.109.222.219])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2G6VPUM009372
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 16 Mar 2015 12:01:25 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
In-Reply-To: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
References: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 16 Mar 2015 12:01:24 +0530
Message-ID: <87ioe1mp1f.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031606-0025-0000-0000-000003CB120F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.7
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] fsdev/virtfs-proxy-helper: Fix
	possible overflow
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
X-List-Received-Date: Mon, 16 Mar 2015 06:31:43 -0000

Shannon Zhao <zhaoshenglong@huawei.com> writes:

> It's detected by coverity. As max of sockaddr_un.sun_path is
> sizeof(helper.sun_path), should check the length of source
> and use strncpy instead of strcpy.

updated such that,

The socket name specified should fit in the sockadd_un.sun_path. If not
abort.

with that applied.

>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>     v1->v2: Still use strcpy [Paolo]
> ---
>  fsdev/virtfs-proxy-helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index bf2e5f3..13fe032 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
>          return -1;
>      }
>  
> +    g_assert(strlen(path) < sizeof(proxy.sun_path));
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          do_perror("socket");
> -- 
> 1.8.3.1


