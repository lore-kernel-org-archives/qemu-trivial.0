Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUkOi-00061g-Lv
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 18:09:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WUkOb-0005pl-6h
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 18:09:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WUkOV-0007Xx-4g
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 18:09:33 -0400
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e]:34181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WUkOI-0007Wh-Nk; Mon, 31 Mar 2014 18:09:14 -0400
Received: by mail-we0-f174.google.com with SMTP id t60so5330986wes.5
	for <multiple recipients>; Mon, 31 Mar 2014 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BB7R2lXTm3BSqpyiuVxMmbZpkuO3qwPk1tqN3T8k1h0=;
	b=KJ/QRaZDRzvwW0KsyfN4ufBmIMReVNSMWkvnem5bjt2ENW4mhVzJ8VhGJK0CM2LJXi
	2Bt48WV8650IlQ0VU4oYOwuRxrqXzuCCPIwd/VPN6BH8jamC5YyGRBHBcPuGHHYEgjhe
	2GRS1K9VoMCr9WbItTwe73RWbuayrbR1fT3CyII3G7Ph6C+6m8VZtXWRORBWOnsJ8ZeH
	JzWyM62no7cySkqzBbedQpwYPzUkRNi2iyoZkJwFOXURorc/JKfvehPdH2tbtsx7lNUc
	ZMPdcNqc9yRDD9I6kNL9gJrq6koWrQUCqwUkuyi11yigQTJytYJaMxtSVJurhYyDTcxd
	ZaFQ==
X-Received: by 10.194.201.73 with SMTP id jy9mr8977990wjc.51.1396303753870;
	Mon, 31 Mar 2014 15:09:13 -0700 (PDT)
Received: from localhost.localdomain ([41.103.75.35])
	by mx.google.com with ESMTPSA id q41sm36001745eez.7.2014.03.31.15.09.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 15:09:13 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 31 Mar 2014 23:09:06 +0100
Message-Id: <1396303746-1858-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22e
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, aliguori@amazon.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2] input: mouse_set should check input
	device type.
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
X-List-Received-Date: Mon, 31 Mar 2014 22:09:39 -0000

Otherwise, the index of an input device like a usb-kbd is silently accepted.

(qemu) info mice
  Mouse #2: QEMU PS/2 Mouse
* Mouse #3: QEMU HID Mouse
(qemu) mouse_set 1
(qemu) info mice
  Mouse #2: QEMU PS/2 Mouse
* Mouse #3: QEMU HID Mouse

Also replace monitor_printf() call in do_mouse_set() with error_report() and
adjust error message.

Signed-off-by: Hani Benhabiles <hani@linux.com>
---

 ui/input.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/ui/input.c b/ui/input.c
index 2761911..6e6a924 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -342,15 +342,21 @@ void do_mouse_set(Monitor *mon, const QDict *qdict)
     int found = 0;
 
     QTAILQ_FOREACH(s, &handlers, node) {
-        if (s->id == index) {
-            found = 1;
-            qemu_input_handler_activate(s);
-            break;
+        if (s->id != index) {
+            continue;
         }
+        if (!(s->handler->mask & (INPUT_EVENT_MASK_REL |
+                                  INPUT_EVENT_MASK_ABS))) {
+            error_report("Input device '%s' is not a mouse", s->handler->name);
+            return;
+        }
+        found = 1;
+        qemu_input_handler_activate(s);
+        break;
     }
 
     if (!found) {
-        monitor_printf(mon, "Mouse at given index not found\n");
+        error_report("Mouse at index '%d' not found", index);
     }
 
     qemu_input_check_mode_change();
-- 
1.8.3.2


