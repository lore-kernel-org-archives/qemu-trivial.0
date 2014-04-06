Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWhDP-00076Z-5s
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 03:10:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWhDD-0006uo-Kv
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 03:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWhD7-0002kx-EA
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 03:09:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWhCo-0002iv-Hi; Sun, 06 Apr 2014 03:09:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 14A4140AFB;
	Sun,  6 Apr 2014 11:09:24 +0400 (MSK)
Message-ID: <5340FDA3.1080902@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 11:09:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/3] int128.h: Avoid undefined behaviours
 involving signed arithmetic
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
X-List-Received-Date: Sun, 06 Apr 2014 07:09:59 -0000

28.03.2014 19:12, Peter Maydell wrote:
> Add casts when we're performing arithmetic on the .hi parts of an
> Int128, to avoid undefined behaviour.
[]
>  static inline Int128 int128_sub(Int128 a, Int128 b)
>  {
> -    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
> +    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };

What was wrong with this one?  I don't think casting to unsigned here is
a good idea.

Thanks,

/mjt

