Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WK6KK-0000pS-MY
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 08:21:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6KD-0000g1-Ie
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:21:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6K7-0004um-KL
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:21:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WK6Jv-0004p9-Ai; Sun, 02 Mar 2014 08:20:43 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AD7B4045C;
	Sun,  2 Mar 2014 17:20:42 +0400 (MSK)
Message-ID: <5313302A.5040601@msgid.tls.msk.ru>
Date: Sun, 02 Mar 2014 17:20:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1393457987-24791-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1393457987-24791-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andrea?= =?ISO-8859-1?Q?s_F=E4rber?=
	<andreas.faerber@web.de>, patches@linaro.org,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] tests/test-int128: Don't use __noclone__
 attribute on clang
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
X-List-Received-Date: Sun, 02 Mar 2014 13:21:07 -0000

27.02.2014 03:39, Peter Maydell wrote:
> clang doesn't support the __noclone__ attribute and emits a warning about
> it. Fortunately clang also implements a mechanism for asking if a particular
> attribute is implemented; use it. We assume that if the compiler doesn't
> support __has_attribute() then it must be GCC and must support __noclone__.

Applied to -trivial, thank you!

/mjt

