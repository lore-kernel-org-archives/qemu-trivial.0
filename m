Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymhnn-0008Dn-By
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 08:06:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymhnh-00085F-HV
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymhne-0000p2-Cc
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:06:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YmhnV-0000jP-9Q; Mon, 27 Apr 2015 08:06:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AC9E04274A;
	Mon, 27 Apr 2015 15:06:00 +0300 (MSK)
Message-ID: <553E2628.9080401@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 15:06:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
	<553E2571.2000700@msgid.tls.msk.ru>
In-Reply-To: <553E2571.2000700@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH target-arm 2/2] arm: cpu.h: Delete unused
	cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 12:06:17 -0000

27.04.2015 15:02, Michael Tokarev wrote:
> 27.04.2015 04:38, Peter Crosthwaite wrote:
>> No code uses the cpu_pc_from_tb() function. Delete.

> This function is also used in target-tricore/cpu.h, and is mentioned

Not _used_ but defined, the same way as it is defined but not used in
target-arm/cpu.h.

> in comments in tcg/tcg.h.  Should these be removed as well?

Thanks,

/mjt


