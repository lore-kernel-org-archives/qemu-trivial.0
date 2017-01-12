Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRcia-0006vu-Qr
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:34:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRciY-0006ty-HL
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:34:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRciX-0003nk-QW
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:34:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRciP-0003jv-2U; Thu, 12 Jan 2017 05:34:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F2B8F409D2;
	Thu, 12 Jan 2017 13:34:40 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 49E6554C;
	Thu, 12 Jan 2017 13:34:40 +0300 (MSK)
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, qemu-devel@nongnu.org
References: <1480390462-14130-1-git-send-email-po-hsu.lin@canonical.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <683d2bd3-4944-160c-a235-f18ac9448962@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1480390462-14130-1-git-send-email-po-hsu.lin@canonical.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] qemu-options: cleanup duplicated help
 message for kernel_irqchip
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
X-List-Received-Date: Thu, 12 Jan 2017 10:34:51 -0000

29.11.2016 06:34, Po-Hsu Lin wrote:
> Remove the duplicated help message for 'kernel_irqchip'.

Applied to -trivial, thank you!

/mjt

