Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1Jvp-0003zZ-Rp
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2013 13:29:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1Jvm-0003qe-9t
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 13:29:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1Jvl-0001mR-Cf
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 13:29:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1Jvj-0001jn-7L; Mon, 22 Jul 2013 13:29:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 10A1D42821;
	Mon, 22 Jul 2013 21:29:42 +0400 (MSK)
Message-ID: <51ED6C04.2080702@msgid.tls.msk.ru>
Date: Mon, 22 Jul 2013 21:29:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1372518648-10862-1-git-send-email-sw@weilnetz.de>
	<51E98AB2.5020000@weilnetz.de>
In-Reply-To: <51E98AB2.5020000@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] aes: Remove unused code (NDEBUG, u16)
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
X-List-Received-Date: Mon, 22 Jul 2013 17:29:55 -0000

19.07.2013 22:51, Stefan Weil wrote:
> Am 29.06.2013 17:10, schrieb Stefan Weil:
>> The current code includes assert.h very early (from qemu-common.h),
>> so the definition of NDEBUG was without any effect.

>> Type u16 is also unused and therefore does not need a type definition.

Thanks, applied to the trivial patches queue.

/mjt

