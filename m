Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TPGiN-0007FI-85
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 13:50:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TPGiJ-000753-LJ
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 13:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TPGiI-0007ru-Ae
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 13:50:27 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:49647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TPGiC-0007l7-B4; Fri, 19 Oct 2012 13:50:20 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so492815iam.4
	for <multiple recipients>; Fri, 19 Oct 2012 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UrsGOlPGCcZuNV10L6jWyuQLSAkcu+rYoRbEqcUrdYg=;
	b=k7yDQqveXupTKxlBzs6nzlP2/sYFP6SC3XmAagJSNEWl4S/THqeJKr9BNwkojJNukD
	71MRuA3Bh1oOYSdtK5eST7G0U7W8QhsHNbWcmg1QNh5IKzQB6CjVvHKScYCAmrGqtQnX
	rAivWaAiER+fcM3pLx8AWvajjeRApCQvAg2M0V2dWjN8ADYMv35bOVx1ak2+pgVFovEj
	TYd/Tk5gPlGzc1FzgPpHSc6NbaBGYd5hhEgvXIywCHXLixZ6uAkrp+GJWYc09tAx5ARH
	h7E0EYTFir0WFjBoens6oqW6kZYX2CxqBd1fvgB86yMcA5hkZPVZh4e49dz9Kop66mdc
	H20w==
Received: by 10.50.194.138 with SMTP id hw10mr2291936igc.11.1350669015230;
	Fri, 19 Oct 2012 10:50:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Fri, 19 Oct 2012 10:49:55 -0700 (PDT)
In-Reply-To: <20121019083822.GC4656@stefanha-thinkpad.redhat.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<20121019083822.GC4656@stefanha-thinkpad.redhat.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Fri, 19 Oct 2012 17:49:55 +0000
Message-ID: <CAAu8pHsw6TLNH8zXh8odJA0H2FV1SmJOL4FZQgXFpuYVm4rNKg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 00/11] static patches
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
X-List-Received-Date: Fri, 19 Oct 2012 17:50:29 -0000

On Fri, Oct 19, 2012 at 8:38 AM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sun, Oct 14, 2012 at 07:58:48PM +0000, Blue Swirl wrote:
>> I made a small tool to detect unused functions and
>> variables. Here's some fixes.
>>
>> Blue Swirl (11):
>>   target-sparc: make do_unaligned_access static
>>   vl.c: add missing static
>>   vnc: add missing static and remove unused functions
>>   tap-win32: avoid a warning
>>   m48t59: remove unused m48t59_set_addr
>>   sun4c: remove unused functions
>>   slirp: remove unused function u_sleep
>>   ppc: add missing static and remove unused functions
>>   target-ppc: make some functions static
>>   arm: add missing static and remove unused functions
>>   exec: make some functions static
>>
>>  console.h                         |    2 -
>>  cpu-common.h                      |    5 -
>>  exec-all.h                        |    2 -
>>  exec-obsolete.h                   |    4 -
>>  exec.c                            |   19 ++-
>>  hw/adb.c                          |    8 +-
>>  hw/adb.h                          |    4 -
>>  hw/devices.h                      |    3 -
>>  hw/i2c.h                          |    3 -
>>  hw/m48t59.c                       |    7 -
>>  hw/mac_nvram.c                    |   24 ---
>>  hw/nvram.h                        |   12 --
>>  hw/omap.h                         |    1 -
>>  hw/omap_gpmc.c                    |   21 ---
>>  hw/pcmcia.h                       |    1 -
>>  hw/ppc.c                          |   54 +-----
>>  hw/ppc405.h                       |    6 -
>>  hw/ppc405_uc.c                    |  342 -------------------------------------
>>  hw/ppc_mac.h                      |    2 -
>>  hw/pxa.h                          |    3 -
>>  hw/pxa2xx.c                       |    4 +-
>>  hw/pxa2xx_pcmcia.c                |   21 ---
>>  hw/soc_dma.c                      |   52 ------
>>  hw/soc_dma.h                      |   16 +--
>>  hw/sun4c_intctl.c                 |   23 ---
>>  hw/sun4m.h                        |    4 -
>>  hw/tc6393xb.c                     |   16 --
>>  hw/tmp105.c                       |   16 --
>>  linux-user/arm/nwfpe/fpa11.c      |    4 +-
>>  linux-user/arm/nwfpe/fpa11.h      |    2 -
>>  linux-user/arm/nwfpe/fpa11_cprt.c |    8 +-
>>  net/tap-win32.c                   |    1 +
>>  slirp/misc.c                      |   14 --
>>  slirp/misc.h                      |    1 -
>>  sysemu.h                          |    5 -
>>  target-ppc/cpu.h                  |    9 -
>>  target-ppc/mmu_helper.c           |   11 +-
>>  target-sparc/cpu.h                |    3 -
>>  target-sparc/ldst_helper.c        |    8 +-
>>  ui/vnc-jobs.c                     |   46 +-----
>>  ui/vnc-jobs.h                     |    4 -
>>  ui/vnc.c                          |   14 +-
>>  ui/vnc.h                          |    5 -
>>  vl.c                              |   33 ++---
>>  44 files changed, 69 insertions(+), 774 deletions(-)
>
> Will you send a v2 or will you drop this series?

I'll make a v2 with only 'static' patches and send function removal
patches separately.

>
> Stefan

