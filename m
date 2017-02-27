Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ciPmC-0000Eb-02
	for mharc-qemu-trivial@gnu.org; Mon, 27 Feb 2017 13:12:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ciPmA-0000D3-G9
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 13:11:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ciPm9-0004Yc-SL
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 13:11:58 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ciPm3-0004UK-M3; Mon, 27 Feb 2017 13:11:51 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 051A443418;
	Mon, 27 Feb 2017 21:11:42 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A07EE2C;
	Mon, 27 Feb 2017 21:11:40 +0300 (MSK)
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <cover.1488068248.git.balaton@eik.bme.hu>
Cc: Magnus Damm <magnus.damm@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <7df56441-6efd-e178-a31d-e77d6d594319@msgid.tls.msk.ru>
Date: Mon, 27 Feb 2017 21:11:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1488068248.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 00/14] Improvements for SM501 display
 controller emulation
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
X-List-Received-Date: Mon, 27 Feb 2017 18:11:59 -0000

26.02.2017 03:17, BALATON Zoltan wrote:
> Second try, addressing review comments.

So.. I'm not sure what to do with this :)

I can apply it to -trivial, but this smells a bit unfair
on my side, while on the other hand, is there any more
appropriate tree?

Thanks,

/mjt

