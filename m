Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRd95-0006VP-IE
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:02:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd91-0006Rc-Dl
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:02:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd8t-0005VO-CA
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:02:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRd8m-0005TB-EU; Thu, 12 Jan 2017 06:01:56 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3417F40A33;
	Thu, 12 Jan 2017 14:01:56 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 66FCF54C;
	Thu, 12 Jan 2017 14:01:55 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1483724714-5469-1-git-send-email-peter.maydell@linaro.org>
Cc: Michael Walle <michael@walle.cc>, patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <aa5da18b-4dbd-9f8b-f61f-661faf3d7695@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:01:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483724714-5469-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] lm32: milkymist-tmu2: fix another
 integer overflow
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
X-List-Received-Date: Thu, 12 Jan 2017 11:02:14 -0000

06.01.2017 20:45, Peter Maydell wrote:
> Don't truncate the multiplication and do a 64 bit one instead
> because the result is stored in a 64 bit variable.
> 
> This fixes a similar coverity warning to commit 237a8650d640,
> in a similar way, and is the other half of the fix for
> coverity CID 1167561.

Applied to -trivial, thanks!

/mjt

