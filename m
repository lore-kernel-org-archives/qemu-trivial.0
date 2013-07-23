Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1g8Y-0002hq-7d
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1g8U-0002cg-EP
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1g8T-0000dW-Ak
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:12:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1g8O-0000ca-1u; Tue, 23 Jul 2013 13:12:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 547CF429A8;
	Tue, 23 Jul 2013 21:12:23 +0400 (MSK)
Message-ID: <51EEB976.8070507@msgid.tls.msk.ru>
Date: Tue, 23 Jul 2013 21:12:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374417794-22611-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374417794-22611-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] exec: Remove env from list of poisoned
 names
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
X-List-Received-Date: Tue, 23 Jul 2013 17:12:32 -0000

21.07.2013 18:43, Stefan Weil wrote:
> The global variable env was removed some time ago, so this name may be
> used without any restriction now.

Thanks, applied to the trivial patches queue.

/mjt

