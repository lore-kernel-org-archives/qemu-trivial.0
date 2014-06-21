Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyMxB-0001L4-3W
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 11:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMx2-0001AI-Of
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMww-0000Ki-KA
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:11:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyMwi-0000GV-Cn; Sat, 21 Jun 2014 11:11:12 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 79A9741E41;
	Sat, 21 Jun 2014 19:11:11 +0400 (MSK)
Message-ID: <53A5A08F.5050600@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 19:11:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] tcg: mark tcg_out* and tcg_patch* with
 attribute 'unused'
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
X-List-Received-Date: Sat, 21 Jun 2014 15:11:39 -0000

07.06.2014 21:08, Peter Maydell wrote:
> The tcg_out* and tcg_patch* functions are utility routines that may or
> may not be used by a particular backend; mark them with the 'unused'
> attribute to suppress spurious warnings if they aren't used.

Applied to -trivial, thank you!

/mjt

