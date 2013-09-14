Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKmPt-0007IN-BS
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:45:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmPl-00077T-UL
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmPf-00011O-Vm
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:45:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKmPT-0000kZ-Qq; Sat, 14 Sep 2013 05:44:59 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D30341074;
	Sat, 14 Sep 2013 13:44:59 +0400 (MSK)
Message-ID: <5234301B.9040707@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:44:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1378499051-25832-1-git-send-email-rth@twiddle.net>
In-Reply-To: <1378499051-25832-1-git-send-email-rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg-sparc: Fix parenthesis warning
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
X-List-Received-Date: Sat, 14 Sep 2013 09:45:24 -0000

07.09.2013 00:24, Richard Henderson wrote:
> error: suggest parentheses around comparison in operand of =E2=80=98&=E2=
=80=99 [-Werror=3Dparentheses]

Thanks, applied to the trivial-patches queue.

Cc'ing the SPARC code maintainer for possible NAK.

/mjt

