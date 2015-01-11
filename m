Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAGhz-0002CO-Ja
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jan 2015 06:29:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAGCZ-0002We-LQ
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAGCW-0002Df-C3
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:56:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1YAGCW-0002DR-4O; Sun, 11 Jan 2015 05:56:56 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0BAusOc012262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sun, 11 Jan 2015 05:56:54 -0500
Received: from work.redhat.com (vpn1-5-16.ams2.redhat.com [10.36.5.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0BAuqdP024710; Sun, 11 Jan 2015 05:56:53 -0500
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-trivial@nongnu.org
Date: Sun, 11 Jan 2015 12:56:51 +0200
Message-Id: <1420973811-21710-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Sun, 11 Jan 2015 06:29:26 -0500
Cc: marcel@redhat.com, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: fix some alignment
	issues
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
X-List-Received-Date: Sun, 11 Jan 2015 10:57:00 -0000

The misalignment was caused by tabs which were used instead of spaces.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
v1 -> v2:
 - Addressed Stefan Weil's comments:
   - Hunted all the tabs within the switch/main 

 vl.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/vl.c b/vl.c
index 5448017..388ca2c 100644
--- a/vl.c
+++ b/vl.c
@@ -2870,7 +2870,7 @@ int main(int argc, char **argv, char **envp)
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
@@ -3479,7 +3479,7 @@ int main(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-	    case QEMU_OPTION_vnc:
+            case QEMU_OPTION_vnc:
 #ifdef CONFIG_VNC
                 display_remote++;
                 vnc_display = optarg;
@@ -3517,11 +3517,11 @@ int main(int argc, char **argv, char **envp)
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
@@ -3533,8 +3533,8 @@ int main(int argc, char **argv, char **envp)
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
2.1.0


