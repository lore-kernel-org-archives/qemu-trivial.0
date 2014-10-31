Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDxH-0003Kq-7h
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:17:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDvo-0007iz-T8
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk4HL-000295-3U
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 00:57:43 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:47744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk4HK-00023M-DY; Fri, 31 Oct 2014 00:57:39 -0400
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWK01012; Fri, 31 Oct 2014 12:57:28 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 12:57:14 +0800
Message-ID: <545316A7.2010601@huawei.com>
Date: Fri, 31 Oct 2014 12:57:11 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<6b6f5fbff3574bffafe4204d2153258fc4440120.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <6b6f5fbff3574bffafe4204d2153258fc4440120.1414681502.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.545316B8.0186, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 350ba5f0aaf473b7b9088ab5fc94217f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/4] os-posix: use global daemon_pipe
 instead of cryptic fds[1]
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
X-List-Received-Date: Fri, 31 Oct 2014 15:17:33 -0000

On 2014/10/30 23:07, Michael Tokarev wrote:

> When asked to -daemonize, we fork a child and setup a pipe between
> it and parent to pass exit status.  os-posix.c used global fds[2]
> array for that, but actually only the writing side of the pipe is
> needed to be global, and this name is really too generic.  Use
> just one interger for the writing side of the pipe, and name it
> daemon_pipe to be more understandable than cryptic fds[1].
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  os-posix.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei


