Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfyC-0003NC-Nb
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:54:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWfyB-0003Ll-2J
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWfyA-0000Ua-7W
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:54:46 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:43638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YWfy1-0000Su-K2; Sat, 14 Mar 2015 02:54:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7549711810A5; Sat, 14 Mar 2015 07:54:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6KKOyH_LDqow; Sat, 14 Mar 2015 07:54:24 +0100 (CET)
Received: from [192.168.178.24] (p54AC89A6.dip0.t-ipconnect.de
	[84.172.137.166])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E90DD1180F74; Sat, 14 Mar 2015 07:54:23 +0100 (CET)
Message-ID: <5503DB1F.8080305@weilnetz.de>
Date: Sat, 14 Mar 2015 07:54:23 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426303825-9040-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426303825-9040-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com,
	zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/commands-posix: Fix
	resource leak
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
X-List-Received-Date: Sat, 14 Mar 2015 06:54:48 -0000

Am 14.03.2015 um 04:30 schrieb Shannon Zhao:
> It's detected by coverity. Close the dirfd.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>   qga/commands-posix.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d5bb5cb..cbf1c80 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2285,6 +2285,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>       ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);

Why not closing it here? It's no longer needed.

>       if (local_err) {
>           g_free(buf);
> +        close(dirfd);
>           error_propagate(errp, local_err);
>           return NULL;
>       }
> @@ -2293,6 +2294,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>       info->size = strtol(buf, NULL, 16); /* the unit is bytes */
>   
>       g_free(buf);
> +    close(dirfd);
>   
>       return info;
>   }


