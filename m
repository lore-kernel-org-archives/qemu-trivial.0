Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SH3sw-0000Zd-L2
	for mharc-qemu-trivial@gnu.org; Sun, 08 Apr 2012 21:59:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SH3su-0000ZS-8X
	for qemu-trivial@nongnu.org; Sun, 08 Apr 2012 21:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SH3ss-0006AZ-F3
	for qemu-trivial@nongnu.org; Sun, 08 Apr 2012 21:59:11 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:33747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liwp@linux.vnet.ibm.com>) id 1SH3sr-0006AT-Rj
	for qemu-trivial@nongnu.org; Sun, 08 Apr 2012 21:59:10 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <liwp@linux.vnet.ibm.com>;
	Mon, 9 Apr 2012 07:29:02 +0530
Received: from d28relay02.in.ibm.com (9.184.220.59)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Apr 2012 07:29:01 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q391x0CH2760954
	for <qemu-trivial@nongnu.org>; Mon, 9 Apr 2012 07:29:00 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q397TSMT027476
	for <qemu-trivial@nongnu.org>; Mon, 9 Apr 2012 17:29:29 +1000
Received: from localhost ([9.123.236.97])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q397TSL5027473; Mon, 9 Apr 2012 17:29:28 +1000
From: Wanpeng Li <liwp@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Date: Mon,  9 Apr 2012 09:58:56 +0800
Message-Id: <1333936736-14996-1-git-send-email-liwp@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12040901-4790-0000-0000-0000021CF488
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.1
Subject: [Qemu-trivial] [PATCH 2/2] avoid repeating contain header file
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
X-List-Received-Date: Mon, 09 Apr 2012 01:59:13 -0000

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
+ * QEMU VMMouse emulation
+ *
+ * Copyright (C) 2007 Anthony Liguori <anthony@codemonkey.ws>
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


