Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLTzV-0003gH-DK
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 05:21:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLTzO-0003VT-Jz
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLTzI-0003D2-7W
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:21:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLTz5-0003AH-KF; Sun, 24 Aug 2014 05:21:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E790E4494D;
	Sun, 24 Aug 2014 13:21:10 +0400 (MSK)
Message-ID: <53F9AE86.7040700@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 13:21:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1408525330-25414-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1408525330-25414-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] libdecnumber: Fix warnings from smatch
 (missing static, boolean operations)
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
X-List-Received-Date: Sun, 24 Aug 2014 09:21:36 -0000

Applied to -trivial, thank you!

But I've a small concern - should we really do this on "external" sources,
and divirge from upstream needlessly?

Thanks,

/mjt

