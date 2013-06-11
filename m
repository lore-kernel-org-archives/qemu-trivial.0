Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmKMO-0003lN-IK
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 04:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UmKML-0003gm-7Q
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 04:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UmKMI-0003Sd-7w
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 04:55:21 -0400
Received: from mail-bk0-x230.google.com ([2a00:1450:4008:c01::230]:45123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1UmKMC-0003Rd-5t; Tue, 11 Jun 2013 04:55:12 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf17so3744176bkc.7
	for <multiple recipients>; Tue, 11 Jun 2013 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=vCkWPej44HlNquj0k8Ny02xy2SxFDWffCNzS7SHbMDM=;
	b=yhrUo1fjWADOqixHNDwVkqIg8gOqIlN3oc1o/Ic2wuJEw7vjDDTwtkDU0WDOiAfYC8
	ebWBL9VRcLTR2KwRmQpi0O83KZThfd5M1n1idZteF/4BuuFQJ9wWOS13xcxFqWytFejc
	QoyXIXIl0N4yRg2zND6pVNm3RTu9u2q/wNAl1RF/ylz2AwOM62vhpwvQX3UcNcUP2gPt
	dU8K9rGkfeSlnh2huF6/GRbht269hQTWsCh3jsyAITiKyjxQMJL4yfGZar22NvlQ//Ya
	CeyI0B5YSBFl9LC8TV7vrJ+PzleBfrNIzae4GM/mgwDIsVoaM8t9A0rOhA9FdNlHNImh
	NFUQ==
X-Received: by 10.204.228.136 with SMTP id je8mr2074477bkb.93.1370940911179;
	Tue, 11 Jun 2013 01:55:11 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	qw6sm4362784bkb.4.2013.06.11.01.55.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 01:55:10 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 11 Jun 2013 10:55:08 +0200
Message-ID: <6740398.i518s4jboP@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::230
Subject: [Qemu-trivial] [PATCH] Unbreak -no-quit for GTK,
	validate SDL options
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
X-List-Received-Date: Tue, 11 Jun 2013 08:55:24 -0000

Certain options (-no-frame, -alt-grab, -ctrl-grab) only make sense with SDL.
When compiling without SDL, these options (and -no-quit) print an error message
and exit qemu.

In case QEMU is compiled with SDL support, the three aforementioned options
still do not make sense with other display types. This patch addresses that
issue by printing a warning. I have chosen not to exit QEMU afterwards because
having the option is not harmful and before this patch it would be ignored
anyway.

By delaying the sanity check from compile-time with some ifdefs to run-time,
-no-quit is now also properly supported when compiling without SDL.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
---
 vl.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index cfd2d3e..29ab85c 100644
--- a/vl.c
+++ b/vl.c
@@ -3523,7 +3523,6 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_full_screen:
                 full_screen = 1;
                 break;
-#ifdef CONFIG_SDL
             case QEMU_OPTION_no_frame:
                 no_frame = 1;
                 break;
@@ -3536,14 +3535,11 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 no_quit = 1;
                 break;
+#ifdef CONFIG_SDL
             case QEMU_OPTION_sdl:
                 display_type = DT_SDL;
                 break;
 #else
-            case QEMU_OPTION_no_frame:
-            case QEMU_OPTION_alt_grab:
-            case QEMU_OPTION_ctrl_grab:
-            case QEMU_OPTION_no_quit:
             case QEMU_OPTION_sdl:
                 fprintf(stderr, "SDL support is disabled\n");
                 exit(1);
@@ -4084,6 +4080,15 @@ int main(int argc, char **argv, char **envp)
 #endif
     }
 
+    if ((no_frame || alt_grab || ctrl_grab) && display_type != DT_SDL) {
+        fprintf(stderr, "-no-frame, -alt-grab and -ctrl-grab are only valid "
+                        "for SDL, ignoring option\n");
+    }
+    if (no_quit && (display_type != DT_GTK && display_type != DT_SDL)) {
+        fprintf(stderr, "-no-quit is only valid for GTK and SDL, "
+                        "ignoring option\n");
+    }
+
 #if defined(CONFIG_GTK)
     if (display_type == DT_GTK) {
         early_gtk_display_init();
-- 
1.8.3


