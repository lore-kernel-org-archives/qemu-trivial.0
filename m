Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4L7-0002Kc-6r
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:10:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4Kz-000273-6c
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:10:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4Kt-0000bg-8v
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:10:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vv4Kg-0000NP-E4; Mon, 23 Dec 2013 07:10:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6EDE042F83;
	Mon, 23 Dec 2013 16:10:01 +0400 (MSK)
Message-ID: <52B82819.5050601@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:10:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1387722749-29348-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1387722749-29348-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pxa27x: Reduce size of keyboard matrix
 mapping
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
X-List-Received-Date: Mon, 23 Dec 2013 12:10:27 -0000

22.12.2013 18:32, Stefan Weil wrote:
> The row and column values use only a very limited range (-1 ... 7),
> so a byte value is sufficient.

Thanks, applied to the trivial-patches queue.

/mjt

