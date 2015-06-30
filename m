Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9k4q-0002kQ-Gc
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2015 21:11:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z9k4j-0002ZP-BK
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 21:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z9k4Y-0000hR-8J
	for qemu-trivial@nongnu.org; Mon, 29 Jun 2015 21:11:01 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:23653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z9k4G-0000WM-Ky; Mon, 29 Jun 2015 21:10:33 -0400
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNV49117; Tue, 30 Jun 2015 09:10:13 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 30 Jun 2015 09:10:09 +0800
Message-ID: <5591EC63.40305@huawei.com>
Date: Tue, 30 Jun 2015 09:09:55 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: John Snow <jsnow@redhat.com>, <qemu-devel@nongnu.org>
References: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
In-Reply-To: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] trivial: remove trailing
 newline from error_report
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
X-List-Received-Date: Tue, 30 Jun 2015 01:11:06 -0000

On 2015/6/30 4:56, John Snow wrote:
> Minor cleanup.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  hw/ide/ahci.c      | 2 +-
>  hw/vfio/platform.c | 2 +-
>  net/tap-linux.c    | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>


