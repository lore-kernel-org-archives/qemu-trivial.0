Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUwPS-0003wg-UC
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 10:45:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dUwPQ-0003ux-Pe
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 10:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dUwPQ-0000zq-6n
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 10:45:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dUwPO-0000yJ-6y; Tue, 11 Jul 2017 10:45:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5CFDB40D6C;
	Tue, 11 Jul 2017 17:45:01 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 062566A4;
	Tue, 11 Jul 2017 17:45:00 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1499094812-13239-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <79d90350-be7e-0f5b-0bd8-71280fba4b29@msgid.tls.msk.ru>
Date: Tue, 11 Jul 2017 17:45:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499094812-13239-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] include/hw/ptimer.h: Add documentation
 comments
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
X-List-Received-Date: Tue, 11 Jul 2017 14:45:05 -0000

03.07.2017 18:13, Peter Maydell wrote:
> Add documentation comments describing the public API of the
> ptimer countdown timer.

Applied to -trivial, thanks a lot!

/mjt

