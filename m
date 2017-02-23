Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cgxEi-0007Bd-MU
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2017 12:31:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cgxEg-0007A8-E2
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2017 12:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cgxEf-0005pE-Eh
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2017 12:31:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:17442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cgxEZ-0005mX-KL; Thu, 23 Feb 2017 12:31:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 90B937456E4;
	Thu, 23 Feb 2017 18:31:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 111407456BC; Thu, 23 Feb 2017 18:31:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 1073E7456AD;
	Thu, 23 Feb 2017 18:31:04 +0100 (CET)
Date: Thu, 23 Feb 2017 18:31:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
cc: Aurelien Jarno <aurelien@aurel32.net>, Magnus Damm <magnus.damm@gmail.com>
In-Reply-To: <cover.1487522123.git.balaton@eik.bme.hu>
Message-ID: <alpine.BSF.2.20.1702231822570.1863@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/10] Improvements for
 sm501 display controller emulation
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
X-List-Received-Date: Thu, 23 Feb 2017 17:31:23 -0000

On Sun, 19 Feb 2017, BALATON Zoltan wrote:
> This series improves the sm501 display controller emulation fixing
> endianness problems that caused mixed up colors in LE hosts, fix hardware
> cursor and adding panel layer support and some missing registers. The
> first few patches update the code style and QOMify the device before
> changes are made to it in subsequent patches.
>
> Including qemu-trivial list as well, both because some of the patches
> are trivial and also I'm not sure how actively maintained this part is
> so that also may need attention from the trivial list to get this merged.
>
> The changes were tested with sh4 image at
> https://people.debian.org/~aurel32/qemu/sh4/
> which accepts video= kernel parameter to excercise different screen modes.
>
> BALATON Zoltan (10):
>  sm501: Fixed code style and a few typos in comments
>  sm501: Use defines instead of constants where available
>  sm501: QOMify
>  sm501: Add emulation of chip connected via PCI
>  sm501: Add missing arbitration control register
>  sm501: Fix device endianness
>  sm501: Fix hardware cursor
>  sm501: Add support for panel layer
>  sm501: Add some more missing registers
>  ppc: Add SM501 device in config for ppc and ppcemb targets
>
> default-configs/ppc-softmmu.mak    |    1 +
> default-configs/ppcemb-softmmu.mak |    1 +
> hw/display/sm501.c                 | 1546 ++++++++++++++++++++----------------
> hw/display/sm501_template.h        |   92 +--
> hw/sh4/r2d.c                       |   11 +-
> include/hw/devices.h               |    5 -
> 6 files changed, 920 insertions(+), 736 deletions(-)

Ping? Is there anyone who could take a look and merge this? It could get 
tested more during the freeze and could be reverted any time if found to 
cause any problems but if it's not merged now it may get delayed for 
months until the next opportunity.
Patchwork links:

http://patchwork.ozlabs.org/patch/729575/
http://patchwork.ozlabs.org/patch/729570/
http://patchwork.ozlabs.org/patch/729571/
http://patchwork.ozlabs.org/patch/729574/
http://patchwork.ozlabs.org/patch/729576/
http://patchwork.ozlabs.org/patch/729577/
http://patchwork.ozlabs.org/patch/729572/
http://patchwork.ozlabs.org/patch/729573/
http://patchwork.ozlabs.org/patch/729569/
http://patchwork.ozlabs.org/patch/729568/


