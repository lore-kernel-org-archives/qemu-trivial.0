Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1acCYQ-0001Zo-9j
	for mharc-qemu-trivial@gnu.org; Sat, 05 Mar 2016 08:47:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1acCYO-0001Zf-1h
	for qemu-trivial@nongnu.org; Sat, 05 Mar 2016 08:47:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1acCYK-0004OK-R0
	for qemu-trivial@nongnu.org; Sat, 05 Mar 2016 08:47:31 -0500
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:34490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1acCYK-0004O8-JT; Sat, 05 Mar 2016 08:47:28 -0500
Received: by mail-pf0-x22f.google.com with SMTP id 129so7970720pfw.1;
	Sat, 05 Mar 2016 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zmzmzEQJ4Fg3g4Zs21NS/bKDW03Bx2Z7XtbP5S8mwoo=;
	b=kD0Ct1SLTuIGaKTuuY/SEUZ1sSHWG7zOlMO7qs1GemYjqpravQIlEb7TzEGsJzjFkI
	9/jNlQxCVAh9DND42Mshi7CtSsURbAKprOrE07JtDN7vT0fzccfVSkbdH+AgUlJeVWMM
	LeG2AzFLb53cUZWOUs8s92eglonN7Wmk136mbvCBVEXYc2q1zLCocGEKsVVxClBXCEHA
	LeethFtP94PMcXTZIfH1hvnmaeaKsSHUWm5f4BUswdO3fIUnn9hUSqPdVrkmjDddRcDM
	GSj3yflnSs3niGPCNWu0buooUl3c4OTSW9OMQlAStmh6g9YOWQZvHug4wZrRAge2Klu8
	d6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zmzmzEQJ4Fg3g4Zs21NS/bKDW03Bx2Z7XtbP5S8mwoo=;
	b=h3uvHI5RMG5x/oHq7Rx+h49Sj+u01BenO9DYtVQeg3YuSPhfcl9JeC1p4Zfo2z3/9Q
	mwhQRI0XkvakXLUDYAaUxRpRxPrFiuKjMDUaDwTGY3Fi36NPJuBU370kR2u/mq6T6nX8
	GF/3ca3/SKbinDEHmfl1jOP5hXOkcLuaRRDfGeaqYo5Du5gCT8ldlTVdcDsO4Gr276y+
	dpUnp1muKBTqa8gnGVhIVpnkUcOmyTKxvBgjp1Csh0BODToMF7TC2UI+9Pn4dv4SRLcc
	mKr1mAHeDCTv27O3yzz5iLVyJlyg2ADxqwCy8+GuAL654CnExnywxSeIAhDXkFbYSd5h
	nuZw==
X-Gm-Message-State: AD7BkJKBYB64MeYo9YiKJiBu05sA/OetnrmJIie6ZM+GTM1893AHOtEOI+klSIf68DI5+A==
X-Received: by 10.98.93.211 with SMTP id n80mr20334217pfj.61.1457185647401;
	Sat, 05 Mar 2016 05:47:27 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	ud10sm12689319pab.27.2016.03.05.05.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Mar 2016 05:47:26 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: corentincj@iksaif.net
Date: Sat,  5 Mar 2016 13:47:08 +0000
Message-Id: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH] bitmap: refine and move
	BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Sat, 05 Mar 2016 13:47:33 -0000

According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.

This patch takes this change and also move them all in header file.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 include/qemu/bitmap.h | 7 ++-----
 util/bitmap.c         | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 0e33fa5..864982d 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -58,11 +58,8 @@
  * find_next_bit(addr, nbits, bit)	Position next set bit in *addr >= bit
  */
 
-#define BITMAP_LAST_WORD_MASK(nbits)                                    \
-    (                                                                   \
-        ((nbits) % BITS_PER_LONG) ?                                     \
-        (1UL<<((nbits) % BITS_PER_LONG))-1 : ~0UL                       \
-        )
+#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
+#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
 
 #define DECLARE_BITMAP(name,bits)                  \
         unsigned long name[BITS_TO_LONGS(bits)]
diff --git a/util/bitmap.c b/util/bitmap.c
index 40aadfb..43ed011 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -157,8 +157,6 @@ int slow_bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
     return result != 0;
 }
 
-#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) % BITS_PER_LONG))
-
 void bitmap_set(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-- 
2.5.0


