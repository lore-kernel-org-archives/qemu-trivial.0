Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6vpq-0007tX-QO
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 04:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vpm-0007ja-RF
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vpk-0002CB-Ur
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:12:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6vpf-0002BQ-Fj; Sun, 29 May 2016 04:12:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2412442C2C;
	Sun, 29 May 2016 11:12:16 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574AA45F.9020408@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 11:12:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 0/5] muldiv64() trivial fixes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 08:12:33 -0000

09.05.2016 16:24, Laurent Vivier wrote:
> Some fixes in the use of muldiv64()
> 
> The patches have been generated with the help of coccinelle.
> 
> The first patch contains the scripts used to generate the two following
> patches. As it is done for linux, I've added the scripts under
> scripts/coccinelle.
> 
> v2:
> - rework scripts/coccinelle/swap_muldiv64.cocci, to simplify it
> - add overflow_muldiv64.cocci and simplify_muldiv64.cocci
> - add resulting patches
> 
> Laurent Vivier (5):
>   scripts: add muldiv64() checking coccinelle scripts
>   The only 64bit parameter of muldiv64() is the first one.
>   remove useless muldiv64()
>   replace muldiv64(a, b, c) by (uint64_t)a * b / c
>   ppc: Remove a potential overflow in muldiv64()

Applied series to -trivial, thanks!

/mjt


