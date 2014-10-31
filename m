Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDwV-00038F-8q
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:16:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDvm-0001Hj-7t
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk4Il-0003Xi-JP
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 00:59:12 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:37839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk4Ik-0003U0-TX; Fri, 31 Oct 2014 00:59:07 -0400
Received: from 172.24.2.119 (EHLO szxeml452-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDS16425; Fri, 31 Oct 2014 12:58:54 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml452-hub.china.huawei.com
	(10.82.67.195) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 12:58:49 +0800
Message-ID: <54531708.8020804@huawei.com>
Date: Fri, 31 Oct 2014 12:58:48 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<7f7296d3c342924c26aa0ef62e9f89ad64f5fd42.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <7f7296d3c342924c26aa0ef62e9f89ad64f5fd42.1414681502.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 2/4] os-posix: replace goto again with a
	proper loop
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
X-List-Received-Date: Fri, 31 Oct 2014 15:16:45 -0000

On 2014/10/30 23:07, Michael Tokarev wrote:

> Elminiate two fullwrite implementations with goto replacing them with

s/Elminiate/Eliminate/

> a proper do..while loop.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  os-posix.c |   16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei


