Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUSZ-00049J-ER
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:06:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUSW-00042d-Vz
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUSW-0005QQ-2v
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:06:48 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:53256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUSS-0005Oi-UW; Sun, 14 Oct 2012 16:06:45 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6861889iea.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yUbqM0+H+cvafU2i4VPnbUMBGem8Dj9cNt54aNmPalA=;
	b=HvGgST3IKAtUHM9RYz2c8Lyn71ZG70SAmUfL5g8e6LxnykBgzRrtVRrngXoJtmuS70
	Cq7vYQMbyxJw32U3KD/lAt7/Tra82SwudCHNgjIO7GXHVWU09w3M27y9TcZ7wmZ8BJSu
	+FHV87Pg8mzypnSupJFXTVqdxRtKOqY+PfDG6aYuffE8mOW8StmxVwxzgr9fo6jj2Ehb
	B60AlUTkP/ewhv1AVxFwjQYwCSeBbrrYXzqnKKdQwUpIEkL0GfGBi5Vqqh7WsCDRCrWg
	ZtSG+G7JGMKVn/TQBYCjOErKnaNIddX8RQN69MkkS4k8/fk3NDueRR0Czfckyc4OtUQ3
	/i4w==
Received: by 10.50.190.137 with SMTP id gq9mr7209103igc.27.1350245204355; Sun,
	14 Oct 2012 13:06:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Sun, 14 Oct 2012 13:06:24 -0700 (PDT)
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 14 Oct 2012 20:06:24 +0000
Message-ID: <CAAu8pHtYEb8PXnFSyWn9ZEZkFvd4y4e77oxc-L+jZOOodLaNJw@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/mixed; boundary=f46d04478493c3eb6e04cc0a75bd
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
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
X-List-Received-Date: Sun, 14 Oct 2012 20:06:50 -0000

--f46d04478493c3eb6e04cc0a75bd
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 14, 2012 at 7:58 PM, Blue Swirl <blauwirbel@gmail.com> wrote:
> I made a small tool to detect unused functions and
> variables. Here's some fixes.

Just run the attached tool in an object directory and after some time,
it will produce a list of suspect symbols:
AES_decrypt ( ./aes.o)
AES_encrypt ( ./aes.o)
AUD_get_elapsed_usec_in ( ./audio/audio.o)
AUD_get_elapsed_usec_out ( ./audio/audio.o)
AUD_init_time_stamp_in ( ./audio/audio.o)
AUD_init_time_stamp_out ( ./audio/audio.o)
AUD_is_active_in ( ./audio/audio.o)
AUD_is_active_out ( ./audio/audio.o)
DEFAULT_ATR ( ./hw/ccid-card-passthru.o)
...

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
>
> --
> 1.7.2.5
>

--f46d04478493c3eb6e04cc0a75bd
Content-Type: application/x-perl; name="statics.pl"
Content-Disposition: attachment; filename="statics.pl"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h8al0x2l0

IyEvdXNyL2Jpbi9lbnYgcGVybAoKbXkgQGRpcnN0YWNrID0gKCIuIik7Cm15ICVzeW1ib2xzX2Rl
ZmluZWQ7Cm15ICVzeW1ib2xzX25lZWRlZDsKCnN1YiB2aXNpdF9maWxlIHsKICAgIG15ICgkZmls
ZSkgPSBAXzsKICAgIG9wZW4obXkgJGZoLCAiLXwiLCAibm0gJGZpbGUiKSB8fCBkaWU7CgogICAg
d2hpbGUgKG15ICRlbnRyeSA9IHJlYWRsaW5lKCRmaCkpIHsKICAgICAgICBjaG9tcCgkZW50cnkp
OwogICAgICAgIG15IEBlbGVtID0gc3BsaXQoIiAiLCAkZW50cnkpOwogICAgICAgIG15ICRhZGRy
LCAkdHlwZSwgJG5hbWU7CiAgICAgICAgaWYgKCQjZWxlbSA9PSAyKSB7CiAgICAgICAgICAgICgk
YWRkciwgJHR5cGUsICRuYW1lKSA9IHNwbGl0KCIgIiwgJGVudHJ5KTsKICAgICAgICB9IGVsc2Ug
ewogICAgICAgICAgICAoJHR5cGUsICRuYW1lKSA9IHNwbGl0KCIgIiwgJGVudHJ5KTsKICAgICAg
ICB9CiAgICAgICAgaWYgKCR0eXBlIGVxICdUJyB8fCAkdHlwZSBlcSAnRCcgfHwgJHR5cGUgZXEg
J0InIHx8ICR0eXBlIGVxICdSJykgewojICAgICAgICAgICAgcHJpbnQgImRlZmluZXMgdHlwZSAk
dHlwZSBuYW1lICRuYW1lXG4iOwogICAgICAgICAgICAkc3ltYm9sc19kZWZpbmVkeyRuYW1lfSA9
ICRzeW1ib2xzX2RlZmluZWR7JG5hbWV9IC4gIiAiIC4gJGZpbGU7CiAgICAgICAgfSBlbHNpZiAo
JHR5cGUgZXEgJ1UnIHx8ICR0eXBlIGVxICdDJykgewojICAgICAgICAgICAgcHJpbnQgIm5lZWRz
IHR5cGUgJHR5cGUgbmFtZSAkbmFtZVxuIjsKICAgICAgICAgICAgJHN5bWJvbHNfbmVlZGVkeyRu
YW1lfSsrOwogICAgICAgIH0KICAgIH0KICAgIGNsb3NlICRmaDsKfQoKCnN1YiB2aXNpdF9kaXIg
ewogICAgbXkgKCRjdXIpID0gQF87CiAgICBvcGVuZGlyKG15ICRkaCwgJGN1cikgfHwgZGllOwoK
ICAgIHdoaWxlIChteSAkZW50cnkgPSByZWFkZGlyICRkaCkgewogICAgICAgIGlmICgkZW50cnkg
bmUgIi4iICYmICRlbnRyeSBuZSAiLi4iKSB7CiAgICAgICAgICAgICRlbnRyeSA9ICRjdXIgLiAi
LyIgLiAkZW50cnk7CiAgICAgICAgICAgIGlmICggLWQgJGVudHJ5KSB7CiAgICAgICAgICAgICAg
ICBwdXNoKEBkaXJzdGFjaywgJGVudHJ5KTsKICAgICAgICAgICAgfSBlbHNpZiAoJGVudHJ5ID1+
IG0vLipcLm8kLykgewojICAgICAgICAgICAgICAgIHByaW50ICJvYmplY3QgJGVudHJ5XG4iOwog
ICAgICAgICAgICAgICAgdmlzaXRfZmlsZSgkZW50cnkpOwogICAgICAgICAgICB9CiAgICAgICAg
fQogICAgfQogICAgY2xvc2VkaXIgJGRoOwp9Cgp3aGlsZSAobXkgJGN1ciA9IHBvcChAZGlyc3Rh
Y2spKSB7CiAgICB2aXNpdF9kaXIoJGN1cik7Cn0KCmZvcmVhY2ggJHN5bWJvbCAoc29ydChrZXlz
ICVzeW1ib2xzX2RlZmluZWQpKSB7CiAgICBpZiAoJHN5bWJvbHNfbmVlZGVkeyRzeW1ib2x9ID09
IDApIHsKICAgICAgICBwcmludCAiJHN5bWJvbCAoJHN5bWJvbHNfZGVmaW5lZHskc3ltYm9sfSlc
biI7CiAgICB9Cn0K
--f46d04478493c3eb6e04cc0a75bd--

