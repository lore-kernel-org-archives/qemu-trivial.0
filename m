Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjnLE-0006uI-TW
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 06:52:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnL7-0006o5-Ud
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnL3-0007us-E2
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:52:25 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:10416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjnKt-0007nL-8D; Thu, 30 Oct 2014 06:52:12 -0400
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDR03279; Thu, 30 Oct 2014 18:52:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 18:52:02 +0800
Message-ID: <54521852.3040209@huawei.com>
Date: Thu, 30 Oct 2014 18:52:02 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414656378-10064-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1414656378-10064-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] virtio-9p-proxy: improve error messages
	in connect_namedsocket()
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
X-List-Received-Date: Thu, 30 Oct 2014 10:52:31 -0000

On 2014/10/30 16:06, Michael Tokarev wrote:

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/9pfs/virtio-9p-proxy.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei


