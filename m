Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2yoj-0004Kt-4d
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:21:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2yog-0004HF-S9
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2yof-0002SG-F0
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:21:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2yoa-0002Ql-Ko; Sat, 27 Jul 2013 03:21:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BDAAE42F73;
	Sat, 27 Jul 2013 11:21:10 +0400 (MSK)
Message-ID: <51F374E6.2090708@msgid.tls.msk.ru>
Date: Sat, 27 Jul 2013 11:21:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374769288-19745-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374769288-19745-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] misc: Use g_assert_not_reached for code
 which is expected to be unreachable
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
X-List-Received-Date: Sat, 27 Jul 2013 07:21:27 -0000

25.07.2013 20:21, Stefan Weil wrote:
> The macro g_assert_not_reached is a better self documenting replacement
> for assert(0) or assert(false).

Thanks, applied to the trivial patches queue.

/mjt

