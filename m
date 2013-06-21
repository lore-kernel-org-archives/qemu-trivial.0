Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq5mE-0007xn-8e
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:09:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5mB-0007qh-Bn
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5mA-0001rS-D0
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:09:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq5m7-0001qP-1X; Fri, 21 Jun 2013 14:09:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5584A41DCF;
	Fri, 21 Jun 2013 22:09:30 +0400 (MSK)
Message-ID: <51C496D8.3060503@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:09:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] configure: Add signed*signed check to
 [u]int128_t test
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
X-List-Received-Date: Fri, 21 Jun 2013 18:09:36 -0000

21.06.2013 17:01, Peter Maydell wrote:
> clang 3.8 with -fsanitize=undefined will fail to link code containing an
> int128_t * int128_t multiply (http://llvm.org/bugs/show_bug.cgi?id=16404)
> so add this to our configure test for whether [u]int128_t are usable.

I accept it as granted (with the fixup s/3.8/3.3/), I didn't try to verify
whenever it's actually true for clang.

Applied to the trivial patches queue (with the fixup), thanks!

/mjt

