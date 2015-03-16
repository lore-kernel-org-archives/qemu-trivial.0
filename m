Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXJob-0001rc-VD
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 21:27:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YXJoZ-0001p0-DF
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 21:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YXJoY-0005KB-JP
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 21:27:31 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:23824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YXJoS-0005Iu-Oh; Sun, 15 Mar 2015 21:27:26 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDD19209; Mon, 16 Mar 2015 09:27:18 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Mar 2015 09:27:10 +0800
Message-ID: <5506316D.2050001@huawei.com>
Date: Mon, 16 Mar 2015 09:27:09 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, <qemu-devel@nongnu.org>
References: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0C0205.55063177.00A4, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 00cb3369b4f282d6a507ea6919c1d7c0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	sw@weilnetz.de, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
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
X-List-Received-Date: Mon, 16 Mar 2015 01:27:32 -0000

On 2015/3/14 17:52, Shannon Zhao wrote:
> It's detected by coverity. Close the dirfd.
>

Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

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
>



