Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhDTG-0006gA-KK
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 04:10:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhDT9-0006Tw-GR
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 04:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhDT3-0005yf-3m
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 04:10:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhDSq-0005xI-GE; Thu, 23 Oct 2014 04:09:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7258C455FF;
	Thu, 23 Oct 2014 12:09:42 +0400 (MSK)
Message-ID: <5448B7C6.8070604@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 12:09:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, peter.maydell@linaro.org, 
	"rth@twiddle.net" <rth@twiddle.net>
References: <54369514.5000004@gmail.com>
In-Reply-To: <54369514.5000004@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 23 Oct 2014 08:10:09 -0000

On 10/09/2014 06:00 PM, Chen Gang wrote:
> The related variables are useless, need be removed, or can not pass
> microblaze building, after fix it, can build microblaze, successfully.
...

Applied to trivial (with subject fixup), thanks!

/mjt

