Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1NdO-0003ok-0M
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2016 21:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1NdL-0003oT-T2
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 21:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1NdI-0007Yp-OZ
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 21:12:59 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:57400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c1NdI-0007Wn-0h; Mon, 31 Oct 2016 21:12:56 -0400
Received: from 172.24.1.137 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DPX64195; Tue, 01 Nov 2016 09:12:24 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Nov 2016
	09:12:13 +0800
To: Jeff Cody <jcody@redhat.com>, <qemu-devel@nongnu.org>
References: <259818682e41b95ae60f1423b87954a3fe377639.1477950393.git.jcody@redhat.com>
CC: <qemu-block@nongnu.org>, <mark.cave-ayland@ilande.co.uk>,
	<quintela@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	<qemu-trivial@nongnu.org>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <5817EBEC.5020703@huawei.com>
Date: Tue, 1 Nov 2016 09:12:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <259818682e41b95ae60f1423b87954a3fe377639.1477950393.git.jcody@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-trivial] [PATCH 1/1] migration: fix compiler warning on
 uninitialized variable
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
X-List-Received-Date: Tue, 01 Nov 2016 01:13:01 -0000

On 2016/11/1 5:50, Jeff Cody wrote:
> Some older GCC versions (e.g. 4.4.7) report a warning on an
> uninitialized variable for 'request', even though all possible code
> paths that reference 'request' will be initialized.   To appease
> these versions, initialize the variable to 0.
>

Thanks for reporting this,  I think this patch can go through trivial
branch.

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org

> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Jeff Cody <jcody@redhat.com>

Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

> ---
>   migration/colo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/colo.c b/migration/colo.c
> index e7224b8..93c85c5 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -439,7 +439,7 @@ void *colo_process_incoming_thread(void *opaque)
>       }
>
>       while (mis->state == MIGRATION_STATUS_COLO) {
> -        int request;
> +        int request = 0;
>
>           colo_wait_handle_message(mis->from_src_file, &request, &local_err);
>           if (local_err) {
>


