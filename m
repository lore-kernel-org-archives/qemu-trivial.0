Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdA7-0007OT-SC
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:03:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdA4-0007LL-JQ
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:03:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdA0-0006KA-9m
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:03:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRd9w-0006JZ-01; Thu, 12 Jan 2017 06:03:08 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CC1E840A33;
	Thu, 12 Jan 2017 14:03:07 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 100BE54C;
	Thu, 12 Jan 2017 14:03:07 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <16f18922-1ea0-b34d-e160-9a5ea0cab904@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:03:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] disas/cris.c: Fix Coverity warning about
 unchecked NULL
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
X-List-Received-Date: Thu, 12 Jan 2017 11:03:19 -0000

09.01.2017 22:05, Peter Maydell wrote:
> Coverity (CID 1005689) warns that we don't check that
> spec_reg_info() returned non-NULL before dereferencing.
> Add the check, though as the comment notes this is
> a can't-really-happen case because the earlier constraint
> matching should have ruled out the "unknown reg" case.

Applied to -trivial, thanks!

/mjt

