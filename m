Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcSUN-0006lo-Vy
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2015 01:43:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YcSUM-0006k5-2v
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 01:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YcSUL-0005qp-9C
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 01:43:54 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=57750
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YcSUH-0005pw-2J; Mon, 30 Mar 2015 01:43:49 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2BD4C11810A9; Mon, 30 Mar 2015 07:43:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ArbiTm5F1d9H; Mon, 30 Mar 2015 07:43:46 +0200 (CEST)
Received: from [192.168.178.24] (p54AC85EB.dip0.t-ipconnect.de
	[84.172.133.235])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E06341180041; Mon, 30 Mar 2015 07:43:45 +0200 (CEST)
Message-ID: <5518E291.6020708@weilnetz.de>
Date: Mon, 30 Mar 2015 07:43:45 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>, 
 "Emilio G. Cota" <cota@braap.org>
References: <5518742e.451f460a.1d9b.66ce@mx.google.com>
In-Reply-To: <5518742e.451f460a.1d9b.66ce@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: optimise memory layout
	of TCGTemp
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
X-List-Received-Date: Mon, 30 Mar 2015 05:43:54 -0000

Am 29.03.2015 um 23:52 schrieb Richard Henderson:
> No decrease in boot time is good. We /know/ we're saving memory, after all.

Well, I would not mind a decrease in boot time, too.
The more it decreases, the better. :-)

To be honest: in my version I only used 1 bit bitfield entries for
boolean values, but 8 bit values (aligned on byte boundaries)
for other values because as far as I know, most (all?) cpu
architectures will need more time to extract some bits from
a machine word than to extract a byte.

I have no idea whether this makes a difference in performance
as I did not run any runtime benchmark.

Stefan


