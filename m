Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XAW-0007YG-4v
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:47:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XAP-0007Pb-2R
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XAI-0006Pb-V3
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:47:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XA6-0006LO-Nv; Sat, 01 Feb 2014 04:46:54 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D835240053;
	Sat,  1 Feb 2014 13:46:53 +0400 (MSK)
Message-ID: <52ECC28D.40002@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:46:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1390670304-381-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1390670304-381-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] readline: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Sat, 01 Feb 2014 09:47:19 -0000

25.01.2014 21:18, Stefan Weil wrote:
> This fixes a compiler warning with -Werror=missing-format-attribute
> and allows improved compiler checks for variable argument lists.

Thanks, applied to the trivial-patches queue.

/mjt

