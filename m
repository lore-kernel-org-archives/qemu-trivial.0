Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XeKl7-0003xz-OF
	for mharc-qemu-trivial@gnu.org; Wed, 15 Oct 2014 05:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XeKky-0003hD-Di
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XeKks-0004ie-9Y
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:20:32 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:21405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XeKkf-0004bv-Aw; Wed, 15 Oct 2014 05:20:13 -0400
Received: from 172.24.2.119 (EHLO szxeml450-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCW91958; Wed, 15 Oct 2014 17:19:59 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml450-hub.china.huawei.com
	(10.82.67.193) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 15 Oct 2014 17:19:51 +0800
Message-ID: <543E3C33.3070708@huawei.com>
Date: Wed, 15 Oct 2014 17:19:47 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1413363855-31606-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1413363855-31606-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vga: drop unused dmask16
 and dmask4 to avoid compiler warnings
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
X-List-Received-Date: Wed, 15 Oct 2014 09:20:39 -0000

On 2014/10/15 17:04, Igor Mammedov wrote:

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/display/vga.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 

AFAICT, Peter had posted this patch, which had queued in vga-next branch by Gerd. :)

[PATCH] hw/display/vga: Remove unused arrays dmask4	and dmask16

Best regards,
-Gonglei


