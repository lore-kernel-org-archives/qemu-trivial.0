Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WglV2-0007V1-72
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 21:45:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WglUw-0007Of-Dt
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 21:45:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WglUr-0000oe-4x
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 21:45:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WglUf-0000nO-CC; Sat, 03 May 2014 21:45:29 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s441jSuv023121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 3 May 2014 21:45:28 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s441jQ1H001698; Sat, 3 May 2014 21:45:27 -0400
Date: Sun, 4 May 2014 09:45:39 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140504014539.GD1124@T430.nay.redhat.com>
References: <1399030854-23359-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399030854-23359-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefiles: convert some obj-specific
 CFLAGS to use new foo.o-cflags syntax
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
X-List-Received-Date: Sun, 04 May 2014 01:45:51 -0000

On Fri, 05/02 15:40, Michael Tokarev wrote:
> Current Makefile system allows using foo.o-cflags variables to store
> object-specific CFLAGS.  Convert some usages of old syntax
> (using QEMU_CFLAGS += construct) to the new syntax.

Thanks for doing this! Two minor comments below, but not showstopper,

Reviewed-by: Fam Zheng <famz@redhat.com>

> 
> Do not touch multifile modules for now, as build system isn't ready for this.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  Makefile               |    6 ------
>  Makefile.objs          |    2 ++
>  audio/Makefile.objs    |    2 +-
>  backends/Makefile.objs |    2 +-
>  disas/Makefile.objs    |    2 +-
>  ui/Makefile.objs       |    2 +-
>  6 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 423e373..0e32b27 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -148,10 +148,6 @@ endif
>  
>  all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules
>  
> -vl.o: QEMU_CFLAGS+=$(GPROF_CFLAGS)
> -
> -vl.o: QEMU_CFLAGS+=$(SDL_CFLAGS)
> -
>  config-host.h: config-host.h-timestamp
>  config-host.h-timestamp: config-host.mak
>  qemu-options.def: $(SRC_PATH)/qemu-options.hx
> @@ -195,8 +191,6 @@ ALL_SUBDIRS=$(TARGET_DIRS) $(patsubst %,pc-bios/%, $(ROMS))
>  
>  recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
>  
> -bt-host.o: QEMU_CFLAGS += $(BLUEZ_CFLAGS)
> -
>  $(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc $(BUILD_DIR)/config-host.h | $(BUILD_DIR)/version.lo
>  	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"  RC    version.o")
>  $(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc $(BUILD_DIR)/config-host.h
> diff --git a/Makefile.objs b/Makefile.objs
> index a6e0e2a..f0069ba 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -64,9 +64,11 @@ common-obj-y += hw/
>  
>  common-obj-y += ui/
>  common-obj-y += bt-host.o bt-vhci.o
> +bt-host.o-cflags := $(BLUEZ_CFLAGS)
>  
>  common-obj-y += dma-helpers.o
>  common-obj-y += vl.o
> +vl.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS)
>  common-obj-y += tpm.o
>  
>  common-obj-$(CONFIG_SLIRP) += slirp/
> diff --git a/audio/Makefile.objs b/audio/Makefile.objs
> index d71a877..bdb12c6 100644
> --- a/audio/Makefile.objs
> +++ b/audio/Makefile.objs
> @@ -14,4 +14,4 @@ common-obj-$(CONFIG_AUDIO_WIN_INT) += audio_win_int.o
>  common-obj-y += wavcapture.o
>  
>  $(obj)/audio.o $(obj)/fmodaudio.o: QEMU_CFLAGS += $(FMOD_CFLAGS)
> -$(obj)/sdlaudio.o: QEMU_CFLAGS += $(SDL_CFLAGS)
> +sdlaudio.o-cflags  := $(SDL_CFLAGS)

s/  / /

> diff --git a/backends/Makefile.objs b/backends/Makefile.objs
> index 42557d5..bbe8a2d 100644
> --- a/backends/Makefile.objs
> +++ b/backends/Makefile.objs
> @@ -3,6 +3,6 @@ common-obj-$(CONFIG_POSIX) += rng-random.o
>  
>  common-obj-y += msmouse.o
>  common-obj-$(CONFIG_BRLAPI) += baum.o
> -$(obj)/baum.o: QEMU_CFLAGS += $(SDL_CFLAGS) 
> +baum.o-cflags := $(SDL_CFLAGS) 

Could remove the ending whitespace since you are touch this line.

Thanks,
Fam

>  
>  common-obj-$(CONFIG_TPM) += tpm.o
> diff --git a/disas/Makefile.objs b/disas/Makefile.objs
> index 41c2374..8dae4da 100644
> --- a/disas/Makefile.objs
> +++ b/disas/Makefile.objs
> @@ -4,7 +4,7 @@ common-obj-$(CONFIG_ARM_DIS) += arm.o
>  common-obj-$(CONFIG_ARM_A64_DIS) += arm-a64.o
>  common-obj-$(CONFIG_ARM_A64_DIS) += libvixl/
>  libvixldir = $(SRC_PATH)/disas/libvixl
> -$(obj)/arm-a64.o: QEMU_CFLAGS += -I$(libvixldir)
> +arm-a64.o-cflags := -I$(libvixldir)
>  common-obj-$(CONFIG_CRIS_DIS) += cris.o
>  common-obj-$(CONFIG_HPPA_DIS) += hppa.o
>  common-obj-$(CONFIG_I386_DIS) += i386.o
> diff --git a/ui/Makefile.objs b/ui/Makefile.objs
> index 6f2294e..4af420b 100644
> --- a/ui/Makefile.objs
> +++ b/ui/Makefile.objs
> @@ -17,4 +17,4 @@ common-obj-$(CONFIG_GTK) += gtk.o x_keymap.o
>  
>  $(obj)/sdl.o $(obj)/sdl_zoom.o $(obj)/sdl2.o: QEMU_CFLAGS += $(SDL_CFLAGS)
>  
> -$(obj)/gtk.o: QEMU_CFLAGS += $(GTK_CFLAGS) $(VTE_CFLAGS)
> +gtk.o-cflags := $(GTK_CFLAGS) $(VTE_CFLAGS)
> -- 
> 1.7.10.4
> 

