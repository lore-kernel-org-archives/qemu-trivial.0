Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZXZc-0006kN-SL
	for mharc-qemu-trivial@gnu.org; Wed, 09 Sep 2015 01:05:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZZXZX-0006eB-4x
	for qemu-trivial@nongnu.org; Wed, 09 Sep 2015 01:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZZXZW-0006lB-5g
	for qemu-trivial@nongnu.org; Wed, 09 Sep 2015 01:05:27 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:34666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZZXZN-0006gA-RX; Wed, 09 Sep 2015 01:05:17 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BD17011810AE; Wed,  9 Sep 2015 07:05:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BNm6XYDMpPcG; Wed,  9 Sep 2015 07:05:14 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54ACAD39.dip0.t-ipconnect.de
	[84.172.173.57])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	79B1C11810A3; Wed,  9 Sep 2015 07:05:14 +0200 (CEST)
Message-ID: <55EFBE0A.9060708@weilnetz.de>
Date: Wed, 09 Sep 2015 07:05:14 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Veres Lajos <vlajos@gmail.com>
References: <alpine.DEB.2.02.1509082244420.7825@citymarket.hu>
	<CAFEAcA8ktWn1Cw-NiPCUD6kSyCQDoOd41YhHoFwqeGe_w0C6FA@mail.gmail.com>
In-Reply-To: <CAFEAcA8ktWn1Cw-NiPCUD6kSyCQDoOd41YhHoFwqeGe_w0C6FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] typofixes - v4 -
	https://github.com/vlajos/misspell_fixer
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
X-List-Received-Date: Wed, 09 Sep 2015 05:05:31 -0000

Am 08.09.2015 um 23:48 schrieb Peter Maydell:
> On 8 September 2015 at 22:45, Veres Lajos <vlajos@gmail.com> wrote:
>> Signed-off-by: Veres Lajos <vlajos@gmail.com>
>> ---
>>  disas/i386.c                    |    2 +-
>>  disas/s390.c                    |    4 ++--
>>  docs/specs/ppc-spapr-hcalls.txt |    4 ++--
>>  docs/writing-qmp-commands.txt   |    2 +-
>>  hw/audio/fmopl.c                |    2 +-
>>  hw/core/qdev.c                  |    2 +-
>>  hw/cris/axis_dev88.c            |    2 +-
>>  hw/display/qxl-render.c         |    2 +-
>>  hw/dma/xilinx_axidma.c          |    2 +-
>>  hw/input/stellaris_input.c      |    2 +-
>>  hw/intc/xics.c                  |    2 +-
>>  hw/net/fsl_etsec/etsec.c        |    2 +-
>>  hw/sd/pl181.c                   |    2 +-
>>  hw/vfio/pci.c                   |    2 +-
>>  hw/xen/xen-host-pci-device.c    |    2 +-
>>  include/block/scsi.h            |    2 +-
>>  include/exec/memory.h           |    2 +-
>>  libcacard/card_7816t.h          |    2 +-
>>  libdecnumber/decContext.c       |    2 +-
>>  libdecnumber/decNumber.c        |    8 ++++----
>>  linux-user/syscall.c            |    1 -
>>  linux-user/syscall_defs.h       |    4 ++--
>>  qga/commands-posix.c            |    2 +-
>>  target-alpha/mem_helper.c       |    2 +-
>>  target-arm/cpu.h                |    4 ++--
>>  target-cris/cpu.h               |    2 +-
>>  target-cris/translate.c         |    6 +++---
>>  target-mips/helper.c            |    2 +-
>>  target-s390x/kvm.c              |    4 ++--
>>  target-sh4/helper.c             |    6 +++---
>>  tcg/ia64/tcg-target.c           |    2 +-
>>  tcg/tcg.c                       |    4 ++--
>>  tests/image-fuzzer/runner.py    |    2 +-
>>  tests/qemu-iotests/041          |    2 +-
>>  util/qemu-thread-posix.c        |    2 +-
>>  35 files changed, 47 insertions(+), 48 deletions(-)
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>

The subject of this patch can be fixed when it is applied to trivial.

Regards
Stefan


