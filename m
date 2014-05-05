Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDl-00049L-Jz
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDd-0003uC-SO
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDY-00018v-RN
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDN-00016N-6w; Mon, 05 May 2014 14:02:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9BC6D40752;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7A1E8661;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24210 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:42 +0400
Message-Id: <1399312923-24129-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/22] Makefiles: convert some obj-specific
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
X-List-Received-Date: Mon, 05 May 2014 18:02:31 -0000

Current Makefile system allows using foo.o-cflags variables to store
object-specific CFLAGS.  Convert some usages of old syntax
(using QEMU_CFLAGS += construct) to the new syntax.

Do not touch multifile modules for now, as build system isn't ready for this.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Fam Zheng <famz@redhat.com>
---
 Makefile               |    6 ------
 Makefile.objs          |    2 ++
 audio/Makefile.objs    |    2 +-
 backends/Makefile.objs |    2 +-
 disas/Makefile.objs    |    2 +-
 ui/Makefile.objs       |    2 +-
 6 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 423e373..0e32b27 100644
--- a/Makefile
+++ b/Makefile
@@ -148,10 +148,6 @@ endif
 
 all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules
 
-vl.o: QEMU_CFLAGS+=$(GPROF_CFLAGS)
-
-vl.o: QEMU_CFLAGS+=$(SDL_CFLAGS)
-
 config-host.h: config-host.h-timestamp
 config-host.h-timestamp: config-host.mak
 qemu-options.def: $(SRC_PATH)/qemu-options.hx
@@ -195,8 +191,6 @@ ALL_SUBDIRS=$(TARGET_DIRS) $(patsubst %,pc-bios/%, $(ROMS))
 
 recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
 
-bt-host.o: QEMU_CFLAGS += $(BLUEZ_CFLAGS)
-
 $(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc $(BUILD_DIR)/config-host.h | $(BUILD_DIR)/version.lo
 	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"  RC    version.o")
 $(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc $(BUILD_DIR)/config-host.h
diff --git a/Makefile.objs b/Makefile.objs
index a6e0e2a..f0069ba 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -64,9 +64,11 @@ common-obj-y += hw/
 
 common-obj-y += ui/
 common-obj-y += bt-host.o bt-vhci.o
+bt-host.o-cflags := $(BLUEZ_CFLAGS)
 
 common-obj-y += dma-helpers.o
 common-obj-y += vl.o
+vl.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS)
 common-obj-y += tpm.o
 
 common-obj-$(CONFIG_SLIRP) += slirp/
diff --git a/audio/Makefile.objs b/audio/Makefile.objs
index d71a877..26a0ac9 100644
--- a/audio/Makefile.objs
+++ b/audio/Makefile.objs
@@ -14,4 +14,4 @@ common-obj-$(CONFIG_AUDIO_WIN_INT) += audio_win_int.o
 common-obj-y += wavcapture.o
 
 $(obj)/audio.o $(obj)/fmodaudio.o: QEMU_CFLAGS += $(FMOD_CFLAGS)
-$(obj)/sdlaudio.o: QEMU_CFLAGS += $(SDL_CFLAGS)
+sdlaudio.o-cflags := $(SDL_CFLAGS)
diff --git a/backends/Makefile.objs b/backends/Makefile.objs
index 42557d5..591ddcf 100644
--- a/backends/Makefile.objs
+++ b/backends/Makefile.objs
@@ -3,6 +3,6 @@ common-obj-$(CONFIG_POSIX) += rng-random.o
 
 common-obj-y += msmouse.o
 common-obj-$(CONFIG_BRLAPI) += baum.o
-$(obj)/baum.o: QEMU_CFLAGS += $(SDL_CFLAGS) 
+baum.o-cflags := $(SDL_CFLAGS)
 
 common-obj-$(CONFIG_TPM) += tpm.o
diff --git a/disas/Makefile.objs b/disas/Makefile.objs
index 41c2374..8dae4da 100644
--- a/disas/Makefile.objs
+++ b/disas/Makefile.objs
@@ -4,7 +4,7 @@ common-obj-$(CONFIG_ARM_DIS) += arm.o
 common-obj-$(CONFIG_ARM_A64_DIS) += arm-a64.o
 common-obj-$(CONFIG_ARM_A64_DIS) += libvixl/
 libvixldir = $(SRC_PATH)/disas/libvixl
-$(obj)/arm-a64.o: QEMU_CFLAGS += -I$(libvixldir)
+arm-a64.o-cflags := -I$(libvixldir)
 common-obj-$(CONFIG_CRIS_DIS) += cris.o
 common-obj-$(CONFIG_HPPA_DIS) += hppa.o
 common-obj-$(CONFIG_I386_DIS) += i386.o
diff --git a/ui/Makefile.objs b/ui/Makefile.objs
index 6f2294e..4af420b 100644
--- a/ui/Makefile.objs
+++ b/ui/Makefile.objs
@@ -17,4 +17,4 @@ common-obj-$(CONFIG_GTK) += gtk.o x_keymap.o
 
 $(obj)/sdl.o $(obj)/sdl_zoom.o $(obj)/sdl2.o: QEMU_CFLAGS += $(SDL_CFLAGS)
 
-$(obj)/gtk.o: QEMU_CFLAGS += $(GTK_CFLAGS) $(VTE_CFLAGS)
+gtk.o-cflags := $(GTK_CFLAGS) $(VTE_CFLAGS)
-- 
1.7.10.4


