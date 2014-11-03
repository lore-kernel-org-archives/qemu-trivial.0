Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlGaY-0007wL-Od
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 07:18:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlGaQ-0007h8-7k
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 07:18:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlGaK-0000OS-44
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 07:18:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlGa7-0000MA-BG; Mon, 03 Nov 2014 07:17:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 55C38404DE;
	Mon,  3 Nov 2014 15:17:57 +0300 (MSK)
Message-ID: <54577274.9070604@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 15:17:56 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	Peter Maydell <peter.maydell@linaro.org>
References: <54574A46.3060709@gmail.com>
In-Reply-To: <54574A46.3060709@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pc-bios: petalogix-s3adsp1800.dtb: Use
 'xlnx, xps-ethernetlite-2.00.a' instead of 'xlnx, xps-ethernetlite-2.00.b'
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
X-List-Received-Date: Mon, 03 Nov 2014 12:18:24 -0000

03.11.2014 12:26, Chen Gang wrote:
> For Linux upstream kernel (e.g. 3.17-rc7), the related compatible string
> 'xlnx,xps-ethernetlite-2.00.a' is supported, but 'b' is not supported,
> so change qemu dtb file to match kernel driver.

/me does not know anything about this stuff at all.  But anyway...

> diff --git a/pc-bios/petalogix-s3adsp1800.dtb b/pc-bios/petalogix-s3adsp1800.dtb
> index 93c5973fd81244268aace6e5e6006ad6fb4d6199..8ac80f2f2d191a8491b71182be50b3df2989551d 100644
> GIT binary patch
> delta 14
> VcmX@?aM)pkI6GtFW(js}NdPEw1Wf<{
> 
> delta 14
> VcmX@?aM)pkI6Gs~W(js}NdPE$1Wo_|

Is it a binary-only file without source?  Where it come from?

(it is not a simple question, eg, on Debian, binary files are
disallowed (at least in main section)).

Thanks,

/mjt


