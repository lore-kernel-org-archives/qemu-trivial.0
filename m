Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHlxK-0004iJ-Rl
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 21:02:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SHlxI-0004i3-Ap
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 21:02:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SHlxG-0000u9-Hl
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 21:02:39 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:48235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SHlxF-0000tg-UK
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 21:02:38 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <liwp@linux.vnet.ibm.com>;
	Wed, 11 Apr 2012 06:32:28 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 11 Apr 2012 06:32:26 +0530
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q3B12OsX4280470; Wed, 11 Apr 2012 06:32:26 +0530
Received: from d28av03.in.ibm.com (loopback [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q3B6VdQr029974; Wed, 11 Apr 2012 16:31:39 +1000
Received: from localhost ([9.123.245.231])
	by d28av03.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q3B6VcHw029933; Wed, 11 Apr 2012 16:31:38 +1000
From: Wanpeng Li <liwp@linux.vnet.ibm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Anthony Liguori <aliguori@us.ibm.com>
Date: Wed, 11 Apr 2012 09:02:21 +0800
Message-Id: <1334106141-4312-1-git-send-email-liwp@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12041101-4790-0000-0000-000002230E49
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] avoid repeating contain header file
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
X-List-Received-Date: Wed, 11 Apr 2012 01:02:41 -0000

Signed-off-by: Wanpeng Li <liwp@linux.vnet.ibm.com>
---
 hw/ps2.h |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/hw/ps2.h b/hw/ps2.h
index 32a4231..d19c226 100644
--- a/hw/ps2.h
+++ b/hw/ps2.h
@@ -1,3 +1,30 @@
+/*
+ * QEMU PS/2 keyboard/mouse emulation
+ *
+ * Copyright (C) 2003 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_PS2_H
+#define HW_PS2_H
+
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
@@ -7,3 +34,5 @@ uint32_t ps2_read_data(void *);
 void ps2_queue(void *, int b);
 void ps2_keyboard_set_translation(void *opaque, int mode);
 void ps2_mouse_fake_event(void *opaque);
+
+#endif /* !HW_PS2_H */
-- 
1.7.5.4


