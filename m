Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWinv-0003KX-AZ
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 05:56:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWint-0003HF-3Q
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:56:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWins-0006pE-At
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:56:21 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=52100
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YWink-0006nl-Nd; Sat, 14 Mar 2015 05:56:12 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A58B511810A5; Sat, 14 Mar 2015 10:56:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id tSpNS9renfQ4; Sat, 14 Mar 2015 10:56:09 +0100 (CET)
Received: from [192.168.178.24] (p54AC89A6.dip0.t-ipconnect.de
	[84.172.137.166])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	667D81180F74; Sat, 14 Mar 2015 10:56:09 +0100 (CET)
Message-ID: <550405B9.4010604@weilnetz.de>
Date: Sat, 14 Mar 2015 10:56:09 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com,
	zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] qga/commands-posix: Fix resource leak
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
X-List-Received-Date: Sat, 14 Mar 2015 09:56:22 -0000

Am 14.03.2015 um 10:52 schrieb Shannon Zhao:
> It's detected by coverity. Close the dirfd.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>      v1->v2: close after use [Stefan Weil]
> ---
>   qga/commands-posix.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d5bb5cb..ba8de62 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2283,6 +2283,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>   
>       buf = g_malloc0(20);
>       ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
> +    close(dirfd);
>       if (local_err) {
>           g_free(buf);
>           error_propagate(errp, local_err);

Thanks.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


