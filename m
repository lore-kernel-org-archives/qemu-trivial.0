Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAGhz-0002Bu-AN
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jan 2015 06:29:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAExa-0007y2-Qo
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 04:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAExV-00029Q-Ky
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 04:37:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1YAExV-00029H-DF; Sun, 11 Jan 2015 04:37:21 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0B9bJt5022857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sun, 11 Jan 2015 04:37:20 -0500
Received: from work.redhat.com (vpn1-5-16.ams2.redhat.com [10.36.5.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0B9bItw028780; Sun, 11 Jan 2015 04:37:18 -0500
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-trivial@nongnu.org
Date: Sun, 11 Jan 2015 11:37:17 +0200
Message-Id: <1420969037-16603-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Sun, 11 Jan 2015 06:29:26 -0500
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: fix some alignment issues
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
X-List-Received-Date: Sun, 11 Jan 2015 09:37:27 -0000

The main's switch had a few cases misaligned.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 vl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/vl.c b/vl.c
index 7786b2f..adfdbfd 100644
--- a/vl.c
+++ b/vl.c
@@ -3147,9 +3147,9 @@ int main(int argc, char **argv, char **envp)
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
@@ -3357,9 +3357,9 @@ int main(int argc, char **argv, char **envp)
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
-- 
2.1.0


