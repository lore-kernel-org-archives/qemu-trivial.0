Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP86F-0006An-H2
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:38:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP86B-00060f-RK
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP86A-0003bK-PM
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:38:31 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:51745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP864-0003Ui-Vs; Fri, 19 Oct 2012 04:38:25 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so68983bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nLTwSKUQM9LJZ9axBzSfD93z2UFNAJUZPxJugrAWi7U=;
	b=fwKP8uFRAGBQEl6yAIltmnhj1nHiI4uCjdb2b9tLOIkf5m/Xl+/7S7LgPZOosNnOV7
	JO/xfHNAeV8UoyDDf+ZJI0yE+E2ttlkj02tt4OdHTtaVXXM2ji8NPXiS1gqvrS/uNnPy
	vq/DWY59lRdRfV61TPG0gERG5ezMOZrVAoU4RZVT1WyFhMIs7AlfbwIEzEgBECWZHXtM
	hiZOoKZ2Ik7beZyaM7NzzHgmX2qSJMmvripPUteiJslU4LQsy3TMP0XtLxKrjgCDUQrh
	tNaVdL523JUoHqj9plJGX38s3u5ng3HYOowtn9UKkUeDmgyb45wRHX5/aIF4zSXvFu5J
	GS1A==
Received: by 10.204.15.193 with SMTP id l1mr147156bka.95.1350635904005;
	Fri, 19 Oct 2012 01:38:24 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id gy18sm315072bkc.4.2012.10.19.01.38.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:38:23 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:38:22 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
Message-ID: <20121019083822.GC4656@stefanha-thinkpad.redhat.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
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
X-List-Received-Date: Fri, 19 Oct 2012 08:38:32 -0000

On Sun, Oct 14, 2012 at 07:58:48PM +0000, Blue Swirl wrote:
> I made a small tool to detect unused functions and
> variables. Here's some fixes.
> 
> Blue Swirl (11):
>   target-sparc: make do_unaligned_access static
>   vl.c: add missing static
>   vnc: add missing static and remove unused functions
>   tap-win32: avoid a warning
>   m48t59: remove unused m48t59_set_addr
>   sun4c: remove unused functions
>   slirp: remove unused function u_sleep
>   ppc: add missing static and remove unused functions
>   target-ppc: make some functions static
>   arm: add missing static and remove unused functions
>   exec: make some functions static
> 
>  console.h                         |    2 -
>  cpu-common.h                      |    5 -
>  exec-all.h                        |    2 -
>  exec-obsolete.h                   |    4 -
>  exec.c                            |   19 ++-
>  hw/adb.c                          |    8 +-
>  hw/adb.h                          |    4 -
>  hw/devices.h                      |    3 -
>  hw/i2c.h                          |    3 -
>  hw/m48t59.c                       |    7 -
>  hw/mac_nvram.c                    |   24 ---
>  hw/nvram.h                        |   12 --
>  hw/omap.h                         |    1 -
>  hw/omap_gpmc.c                    |   21 ---
>  hw/pcmcia.h                       |    1 -
>  hw/ppc.c                          |   54 +-----
>  hw/ppc405.h                       |    6 -
>  hw/ppc405_uc.c                    |  342 -------------------------------------
>  hw/ppc_mac.h                      |    2 -
>  hw/pxa.h                          |    3 -
>  hw/pxa2xx.c                       |    4 +-
>  hw/pxa2xx_pcmcia.c                |   21 ---
>  hw/soc_dma.c                      |   52 ------
>  hw/soc_dma.h                      |   16 +--
>  hw/sun4c_intctl.c                 |   23 ---
>  hw/sun4m.h                        |    4 -
>  hw/tc6393xb.c                     |   16 --
>  hw/tmp105.c                       |   16 --
>  linux-user/arm/nwfpe/fpa11.c      |    4 +-
>  linux-user/arm/nwfpe/fpa11.h      |    2 -
>  linux-user/arm/nwfpe/fpa11_cprt.c |    8 +-
>  net/tap-win32.c                   |    1 +
>  slirp/misc.c                      |   14 --
>  slirp/misc.h                      |    1 -
>  sysemu.h                          |    5 -
>  target-ppc/cpu.h                  |    9 -
>  target-ppc/mmu_helper.c           |   11 +-
>  target-sparc/cpu.h                |    3 -
>  target-sparc/ldst_helper.c        |    8 +-
>  ui/vnc-jobs.c                     |   46 +-----
>  ui/vnc-jobs.h                     |    4 -
>  ui/vnc.c                          |   14 +-
>  ui/vnc.h                          |    5 -
>  vl.c                              |   33 ++---
>  44 files changed, 69 insertions(+), 774 deletions(-)

Will you send a v2 or will you drop this series?

Stefan

