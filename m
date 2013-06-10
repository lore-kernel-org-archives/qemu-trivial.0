Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um4As-0004dd-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 11:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um4An-0004W1-In
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um4Am-0007oZ-4d
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:38:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um4Ai-0007mu-Od; Mon, 10 Jun 2013 11:38:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F0057410E7;
	Mon, 10 Jun 2013 19:38:15 +0400 (MSK)
Message-ID: <51B5F2E6.3000207@msgid.tls.msk.ru>
Date: Mon, 10 Jun 2013 19:38:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] audio: Replace macro GCC_ATTR by
 GCC_FMT_ATTR and use inline functions
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
X-List-Received-Date: Mon, 10 Jun 2013 15:38:26 -0000

09.06.2013 16:22, Stefan Weil wrote:
> GCC_ATTR was only used in audio_int.h, so it is now unused and
> the definition can be removed from compiler.h.

Thanks, applied to the trivial patches queue.

/mjt

