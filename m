Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfyY-0008Go-De
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyR-00084O-5H
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyQ-0002iY-6I
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfyI-0002bC-6J; Thu, 15 Jan 2015 03:40:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 98FDF40DA0;
	Thu, 15 Jan 2015 11:30:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E964A8C8;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: (nullmailer pid 31363 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:50 +0300
Message-Id: <99efa84d5c02e33bcca7be83dd7cabc4b0f22f14.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Marcel Apfelbaum <marcel@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/12] vl.c: fix some alignment issues
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
X-List-Received-Date: Thu, 15 Jan 2015 08:40:18 -0000

From: Marcel Apfelbaum <marcel@redhat.com>

The misalignment was caused by tabs which were used instead of spaces.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/vl.c b/vl.c
index 6adb36e..fbf4240 100644
--- a/vl.c
+++ b/vl.c
@@ -2873,7 +2873,7 @@ int main(int argc, char **argv, char **envp)
         if (optind >= argc)
             break;
         if (argv[optind][0] != '-') {
-	    hda_opts = drive_add(IF_DEFAULT, 0, argv[optind++], HD_OPTS);
+            hda_opts = drive_add(IF_DEFAULT, 0, argv[optind++], HD_OPTS);
         } else {
             const QEMUOption *popt;
 
@@ -2918,15 +2918,15 @@ int main(int argc, char **argv, char **envp)
                 if (drive_def(optarg) == NULL) {
                     exit(1);
                 }
-	        break;
+                break;
             case QEMU_OPTION_set:
                 if (qemu_set_option(optarg) != 0)
                     exit(1);
-	        break;
+                break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
                     exit(1);
-	        break;
+                break;
             case QEMU_OPTION_mtdblock:
                 drive_add(IF_MTD, -1, optarg, MTD_OPTS);
                 break;
@@ -2978,7 +2978,7 @@ int main(int argc, char **argv, char **envp)
                         fprintf(stderr, "qemu: invalid physical CHS format\n");
                         exit(1);
                     }
-		    if (hda_opts != NULL) {
+                    if (hda_opts != NULL) {
                         char num[16];
                         snprintf(num, sizeof(num), "%d", cyls);
                         qemu_opt_set(hda_opts, "cyls", num);
@@ -3152,9 +3152,9 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_S:
                 autostart = 0;
                 break;
-	    case QEMU_OPTION_k:
-		keyboard_layout = optarg;
-		break;
+            case QEMU_OPTION_k:
+                keyboard_layout = optarg;
+                break;
             case QEMU_OPTION_localtime:
                 rtc_utc = 0;
                 break;
@@ -3362,9 +3362,9 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_debugcon:
                 add_device_config(DEV_DEBUGCON, optarg);
                 break;
-	    case QEMU_OPTION_loadvm:
-		loadvm = optarg;
-		break;
+            case QEMU_OPTION_loadvm:
+                loadvm = optarg;
+                break;
             case QEMU_OPTION_full_screen:
                 full_screen = 1;
                 break;
@@ -3476,7 +3476,7 @@ int main(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-	    case QEMU_OPTION_vnc:
+            case QEMU_OPTION_vnc:
 #ifdef CONFIG_VNC
                 display_remote++;
                 vnc_display = optarg;
@@ -3514,11 +3514,11 @@ int main(int argc, char **argv, char **envp)
                 }
                 qemu_uuid_set = true;
                 break;
-	    case QEMU_OPTION_option_rom:
-		if (nb_option_roms >= MAX_OPTION_ROMS) {
-		    fprintf(stderr, "Too many option ROMs\n");
-		    exit(1);
-		}
+            case QEMU_OPTION_option_rom:
+                if (nb_option_roms >= MAX_OPTION_ROMS) {
+                    fprintf(stderr, "Too many option ROMs\n");
+                    exit(1);
+                }
                 opts = qemu_opts_parse(qemu_find_opts("option-rom"), optarg, 1);
                 if (!opts) {
                     exit(1);
@@ -3530,8 +3530,8 @@ int main(int argc, char **argv, char **envp)
                     fprintf(stderr, "Option ROM file is not specified\n");
                     exit(1);
                 }
-		nb_option_roms++;
-		break;
+                nb_option_roms++;
+                break;
             case QEMU_OPTION_semihosting:
                 semihosting_enabled = 1;
                 semihosting_target = SEMIHOSTING_TARGET_AUTO;
-- 
2.1.4


