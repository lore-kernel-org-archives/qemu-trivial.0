Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU2Rp-0005mD-PH
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 17:37:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rm-0005d2-SC
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rm-00028A-16
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:06 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:46182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TU2Rj-00027K-L9; Thu, 01 Nov 2012 17:37:03 -0400
Received: by mail-pb0-f45.google.com with SMTP id rp2so1947355pbb.4
	for <multiple recipients>; Thu, 01 Nov 2012 14:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/bKcXzW6g3RuZaZI7Hf/VfbawgGZMZ5t1UyA+1ZLmCY=;
	b=BDbL1+yBTUibRtfP6qkeXNP3VcFh6HO+N9b/oCAZoHZiuYhU7E7rcW1pvpQyiZ+wvg
	YSHyD00v75YyNyiiyKsyINMsAiy2S1XclszFFbAMgFY+5Sky/uFUpoJNCP1VyCMBCtnx
	+LvErVYmEFcKdedAlj49riJSDTH++s+i3WTkIi5de3AiKy+wQYb5JQ77giExVGTHjbq8
	3N2mBdOsZbxwph9wBO4HZdvQbd9lOVeKXLh7VU5DJ355VZ07SDvUEGYu1DoS9oE263ZH
	d1aD5aiTmA8xnPY5bLFi3hO13NeUzRNzRrLIZwah9syuLluy7YOTZqDn7mREqMFl1zLC
	wqSQ==
Received: by 10.66.78.67 with SMTP id z3mr89302543paw.33.1351805822794;
	Thu, 01 Nov 2012 14:37:02 -0700 (PDT)
Received: from pebble.twiddle.home.com ([1.152.139.87])
	by mx.google.com with ESMTPS id c7sm4534436pay.10.2012.11.01.14.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 14:37:02 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2012 08:36:35 +1100
Message-Id: <1351805797-31899-2-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1351805797-31899-1-git-send-email-rth@twiddle.net>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] target-alpha: Remove t0,
	t1 from CPUAlphaState
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
X-List-Received-Date: Thu, 01 Nov 2012 21:37:08 -0000

These fields are no longer (or were never?) used.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-alpha/cpu.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index 34221fb..9939d61 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -280,13 +280,6 @@ struct CPUAlphaState {
     struct QEMUTimer *alarm_timer;
     uint64_t alarm_expire;
 
-#if TARGET_LONG_BITS > HOST_LONG_BITS
-    /* temporary fixed-point registers
-     * used to emulate 64 bits target on 32 bits hosts
-     */
-    target_ulong t0, t1;
-#endif
-
     /* Those resources are used only in QEMU core */
     CPU_COMMON
 
-- 
1.7.11.7


