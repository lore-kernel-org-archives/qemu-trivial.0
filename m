Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpN7k-0000g7-QS
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 14:01:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpN7d-0000YN-Lk
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 14:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpN7X-0004Xq-NL
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 14:01:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpN7L-0004X0-FB; Sat, 07 Dec 2013 14:00:43 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E9AC640CDB;
	Sat,  7 Dec 2013 23:00:40 +0400 (MSK)
Message-ID: <52A37058.8080001@msgid.tls.msk.ru>
Date: Sat, 07 Dec 2013 23:00:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2 0/5] Replace sizeof(array) /
	sizeof(*array)
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
X-List-Received-Date: Sat, 07 Dec 2013 19:01:07 -0000

07.12.2013 17:48, Stefan Weil wrote:
> These patches were previously sent as single patches instead of
> a patch series. They all replace sizeof(array) / sizeof(*array)
> by macros.
> 
> v2: Fix typos in commit messages (thanks to Peter Maydell).

Applied to trivial-patches queue.

> [PATCH v2 1/5] misc: Use macro ARRAY_SIZE where possible
> [PATCH v2 2/5] ui/cocoa: Use macro ARRAY_SIZE where possible
> [PATCH v2 3/5] exynos4210: Use macro ARRAY_SIZE where possible
> [PATCH v2 4/5] target-mips: Use macro ARRAY_SIZE where possible

Especially this one is nice.  Original code was rather obscure,
copied into multiple places.

In this patch I fixed a minor formatting issue (uneven row of
backslashes in MIPSDSP32_UNOP_ENV macro definition).

> [PATCH v2 5/5] linux-user: Use macro TARGET_NSIG_WORDS where possible

All the changes appears to be fine and simple.

Stefan, at this rate, whole qemu-trivial becomes solely your baby.. ;)

Thanks!

/mjt


