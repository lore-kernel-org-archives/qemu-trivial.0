Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwE71-0002dN-Ha
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE6z-0002bu-2t
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE6y-00052r-B1
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:06:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwE6s-0004xN-6g; Sun, 24 Sep 2017 17:06:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EBCD541C78;
	Mon, 25 Sep 2017 00:06:40 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id D0DA13C3;
	Mon, 25 Sep 2017 00:06:40 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
	Victor Kaplansky <victork@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1506049617-25716-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <513bbb2d-280b-92f8-b45f-89963f7118e2@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 00:06:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1506049617-25716-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests/boot-sector: Increase timeout to
 600 seconds
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
X-List-Received-Date: Sun, 24 Sep 2017 21:06:50 -0000

22.09.2017 06:06, Thomas Huth wrote:
> If QEMU has been compiled with the flags --enable-tcg-interpreter and
> --enable-debug, the guest is running incredibly slow. The pxe boot test
> can take up to 400 seconds when testing the pseries ppc64 machine. While
> we should still look for ways to speed up the test on the pseries machine,
> it's better to increase the timeout in this test to 600 seconds anyway to
> allow the test to pass successfully now with this unusal configuration
> already.

Applied to -trivial, thanks!

/mjt

