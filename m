Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9X9S-0006XO-Fr
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:46:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9X9K-0006OZ-T4
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:46:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9X9E-0006Fs-Ta
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:46:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9X8y-0006DA-Go; Sat, 01 Feb 2014 04:45:44 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CC71C4001A;
	Sat,  1 Feb 2014 13:45:43 +0400 (MSK)
Message-ID: <52ECC247.9010103@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:45:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1391029710-11780-1-git-send-email-rth@twiddle.net>
In-Reply-To: <1391029710-11780-1-git-send-email-rth@twiddle.net>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, borntraeger@de.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg/s390: Remove sigill_handler
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
X-List-Received-Date: Sat, 01 Feb 2014 09:46:13 -0000

30.01.2014 01:08, Richard Henderson wrote:
> Commit c9baa30f42a87f61627391698f63fa4d1566d9d8 failed to
> delete all of the relevant code, leading to Werrors about
> unused symbols.

Applied to the trivial-patches queue, thank you!

/mjt

