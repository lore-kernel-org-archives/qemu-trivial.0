Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VZzpY-0004Za-PJ
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:06:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VZzpT-0004OE-49
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VZzpO-0001nn-Hz
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:06:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VZzpC-0001m1-Me; Sat, 26 Oct 2013 05:06:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D60543713;
	Sat, 26 Oct 2013 13:06:18 +0400 (MSK)
Message-ID: <526B860A.9030902@msgid.tls.msk.ru>
Date: Sat, 26 Oct 2013 13:06:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Weng Fan <wengfan-fnst@cn.fujitsu.com>
References: <5269E751.8090107@cn.fujitsu.com>
In-Reply-To: <5269E751.8090107@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Qemu-devel@nongnu.org" <Qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] docs/ccid.txt: fix the
	typo
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
X-List-Received-Date: Sat, 26 Oct 2013 09:06:47 -0000

25.10.2013 07:36, Weng Fan wrote:
> From: WengFan <wengfan-fnst@cn.fujitsu.com>
> Date: Wed, 25 Oct 2013 11:18:22 -0400
> Subject: [PATCH 1/1] fix the typo

> Signed-off-by: WengFan <wengfan-fnst@cn.fujitsu.com>
> ---
>   qemu-master/docs/ccid.txt |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)

I had to fix the filename (qemu git tree does not have
"qemu-master" subdir), and the context for a bit.  The typo
is there still, and the change is really trivial, so I haven't
asked for a v2/resent of the patch.

Thanks, applied to the trivial-patches queue.

/mjt

