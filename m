Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZQlB-0005xG-9H
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 17:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZQl9-0005wq-8O
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 17:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZQl5-0008TJ-3F
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 17:48:59 -0400
Received: from mail-yk0-f170.google.com ([209.85.160.170]:35449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZQl5-0008TC-0A
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 17:48:55 -0400
Received: by ykdu9 with SMTP id u9so65777489ykd.2
	for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2015 14:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fRe7o6Ij6HHpL79gym26kv8wvo8o3JpZrLuX9X/JJIs=;
	b=Arg47yLcXdEx6z84hFRBqYHvA8DMzc/Xwtt6Jvuo+xmNi/yTxv8N5dG8MkXX2WAMRA
	VkeyrA6hxMI883Qt0Zm7pxpjY6eTplK0g5THbmsY9vENT3jouwF4Vnm+ZSJxiAxAtADq
	Z3MWZGrzdPe6ON96OkfIDyGjjJEJUer00cYmnX/TPKmciHH4tt/wtENROJ+volDJb++7
	kKUpN+pf2IMZ4i1Z2bpgpNJZhaQ67GayU5aLmn+i2FFro6zMOAXfbV+sSC8vf3i1Eawx
	C+65FRt9ndwmQM0saUUh9VugwbW3Tpg9307Tep0a31tB/xoR41U7GSzi08b3GYwccy1s
	RSGQ==
X-Gm-Message-State: ALoCoQkxzQCYdIdqx0GqwpkXkDhJoj/mwjaoSEAZy0qx8RGIBeq2UTBaTacdeldw+2o7hsvVML74
X-Received: by 10.129.50.73 with SMTP id y70mr30744742ywy.3.1441748934388;
	Tue, 08 Sep 2015 14:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 8 Sep 2015 14:48:34 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1509082244420.7825@citymarket.hu>
References: <alpine.DEB.2.02.1509082244420.7825@citymarket.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2015 22:48:34 +0100
Message-ID: <CAFEAcA8ktWn1Cw-NiPCUD6kSyCQDoOd41YhHoFwqeGe_w0C6FA@mail.gmail.com>
To: Veres Lajos <vlajos@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] typofixes - v4 -
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
X-List-Received-Date: Tue, 08 Sep 2015 21:49:00 -0000

On 8 September 2015 at 22:45, Veres Lajos <vlajos@gmail.com> wrote:
> Signed-off-by: Veres Lajos <vlajos@gmail.com>
> ---
>  disas/i386.c                    |    2 +-
>  disas/s390.c                    |    4 ++--
>  docs/specs/ppc-spapr-hcalls.txt |    4 ++--
>  docs/writing-qmp-commands.txt   |    2 +-
>  hw/audio/fmopl.c                |    2 +-
>  hw/core/qdev.c                  |    2 +-
>  hw/cris/axis_dev88.c            |    2 +-
>  hw/display/qxl-render.c         |    2 +-
>  hw/dma/xilinx_axidma.c          |    2 +-
>  hw/input/stellaris_input.c      |    2 +-
>  hw/intc/xics.c                  |    2 +-
>  hw/net/fsl_etsec/etsec.c        |    2 +-
>  hw/sd/pl181.c                   |    2 +-
>  hw/vfio/pci.c                   |    2 +-
>  hw/xen/xen-host-pci-device.c    |    2 +-
>  include/block/scsi.h            |    2 +-
>  include/exec/memory.h           |    2 +-
>  libcacard/card_7816t.h          |    2 +-
>  libdecnumber/decContext.c       |    2 +-
>  libdecnumber/decNumber.c        |    8 ++++----
>  linux-user/syscall.c            |    1 -
>  linux-user/syscall_defs.h       |    4 ++--
>  qga/commands-posix.c            |    2 +-
>  target-alpha/mem_helper.c       |    2 +-
>  target-arm/cpu.h                |    4 ++--
>  target-cris/cpu.h               |    2 +-
>  target-cris/translate.c         |    6 +++---
>  target-mips/helper.c            |    2 +-
>  target-s390x/kvm.c              |    4 ++--
>  target-sh4/helper.c             |    6 +++---
>  tcg/ia64/tcg-target.c           |    2 +-
>  tcg/tcg.c                       |    4 ++--
>  tests/image-fuzzer/runner.py    |    2 +-
>  tests/qemu-iotests/041          |    2 +-
>  util/qemu-thread-posix.c        |    2 +-
>  35 files changed, 47 insertions(+), 48 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

