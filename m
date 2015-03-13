Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWL1q-0001ad-Cm
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 04:33:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YWL1n-0001Vz-Ca
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 04:33:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YWL1f-0007Cr-87
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 04:33:07 -0400
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:55056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YWL1e-0007CY-Ji
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 04:32:59 -0400
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Fri, 13 Mar 2015 18:32:55 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 13 Mar 2015 18:32:52 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 53C2D3578047;
	Fri, 13 Mar 2015 19:32:51 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2D8Wha430736564; Fri, 13 Mar 2015 19:32:51 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2D8WH7a016489; Fri, 13 Mar 2015 19:32:17 +1100
Received: from skywalker.linux.vnet.ibm.com ([9.77.213.26])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2D8WE4k016007
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 13 Mar 2015 19:32:15 +1100
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
In-Reply-To: <1426225687-12104-1-git-send-email-zhaoshenglong@huawei.com>
References: <1426225687-12104-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Fri, 13 Mar 2015 14:01:59 +0530
Message-ID: <87zj7h9u2o.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031308-0021-0000-0000-000000E8C925
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.148
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-posix-acl: Fix
	out-of-bounds access
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
X-List-Received-Date: Fri, 13 Mar 2015 08:33:08 -0000

Shannon Zhao <zhaoshenglong@huawei.com> writes:

> It's detected by coverity. Fix out-of-bounds access of the function mp_dacl_listxattr.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/9pfs/virtio-9p-posix-acl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/9pfs/virtio-9p-posix-acl.c b/hw/9pfs/virtio-9p-posix-acl.c
> index 803d9d9..09dad07 100644
> --- a/hw/9pfs/virtio-9p-posix-acl.c
> +++ b/hw/9pfs/virtio-9p-posix-acl.c
> @@ -114,7 +114,7 @@ static ssize_t mp_dacl_listxattr(FsContext *ctx, const char *path,
>      }
>
>      /* len includes the trailing NUL */
> -    memcpy(value, ACL_ACCESS, len);
> +    memcpy(value, ACL_DEFAULT, len);
>      return 0;
>  }

Applied.

Thanks
-aneesh


