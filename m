Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIKQR-0003sr-NP
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 13:09:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKQQ-0003s1-Dh
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 13:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKQP-00081A-JD
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 13:09:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIKQL-00080W-D3; Sun, 10 Jan 2016 13:09:05 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3131840359;
	Sun, 10 Jan 2016 21:09:06 +0300 (MSK)
To: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>, qemu-devel@nongnu.org
References: <1450996286-23127-1-git-send-email-jm.ouwerkerk@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929E40.2060602@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 21:09:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450996286-23127-1-git-send-email-jm.ouwerkerk@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add missing syscall nrs. This updates
 the QEMU syscall tables to more recent Linux kernels.
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
X-List-Received-Date: Sun, 10 Jan 2016 18:09:11 -0000

25.12.2015 01:31, Johan Ouwerkerk wrote:
> This change covers arm, aarch64, mips. Others to follow?
> 
> The change was prompted by QEMU warning about a syscall 384 (get_random()) with Debian armhf binaries (ARMv7).

Applied to -trivial after word-wrapping the commit message
and trimming subject line a bit.  Thanks!

/mjt

