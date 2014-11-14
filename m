Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xp7BG-0003GC-Rx
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 22:04:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xp7BA-0003Fy-FX
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 22:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xp7B5-0007xi-Bm
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 22:04:08 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:12966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xp7B4-0007x5-QD; Thu, 13 Nov 2014 22:04:03 -0500
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEK37197; Fri, 14 Nov 2014 11:03:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml420-hub.china.huawei.com
	(10.82.67.159) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 14 Nov 2014 11:03:42 +0800
Message-ID: <54657105.50802@huawei.com>
Date: Fri, 14 Nov 2014 11:03:33 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] l2tpv3: fix possible double
	free
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
X-List-Received-Date: Fri, 14 Nov 2014 03:04:13 -0000

On 2014/11/14 9:39, zhanghailiang wrote:

> freeaddrinfo(result) does not assign result = NULL, after frees it.
> There will be a double free when it goes error case.
> It is reported by covertiy.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  net/l2tpv3.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Gonglei <arei.gonglei@huawei.com>


