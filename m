Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDx9-0003HV-UY
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:17:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDvb-00052N-UC
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk4MY-0007qE-ET
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 01:03:07 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:9568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk4MX-0007k1-OW; Fri, 31 Oct 2014 01:03:02 -0400
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBP98628; Fri, 31 Oct 2014 13:02:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 13:02:43 +0800
Message-ID: <545317F3.9050105@huawei.com>
Date: Fri, 31 Oct 2014 13:02:43 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<7bdebf1bc921df74cb0edc42d2ea77cda220074c.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <7bdebf1bc921df74cb0edc42d2ea77cda220074c.1414681502.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 4/4] os-posix: reorder parent
	notification for -daemonize
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
X-List-Received-Date: Fri, 31 Oct 2014 15:17:26 -0000

On 2014/10/30 23:07, Michael Tokarev wrote:

> Put "success" parent reporting in os_setup_post() to after
> all other initializers which may also fail, to the very end,
> so more possible failure cases are reported properly to the
> calling process.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  os-posix.c |   19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei


