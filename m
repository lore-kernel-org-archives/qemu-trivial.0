Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKvOB-0000gW-5H
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2013 14:47:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UKvO7-0000ZO-LM
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 14:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UKvO4-0004mp-Mi
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 14:47:55 -0400
Received: from mail-qe0-f50.google.com ([209.85.128.50]:34875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1UKvNy-0004ji-Ab; Wed, 27 Mar 2013 14:47:46 -0400
Received: by mail-qe0-f50.google.com with SMTP id k5so4794573qej.9
	for <multiple recipients>; Wed, 27 Mar 2013 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=m0o00cuhbcHKN6I8fozqNnrCdmd1hTaO38WlaBthDQg=;
	b=nU+iDSSaUv7N2snPZtsn/JsficePjshG6WETOh/+YGTRh49v7bRg80NJYrs0SzHpOz
	nXVniySq4Mt6uLiOJMuouNTO0WCyyiokxHRKIXFginQPhp01fj+G/hXvMs7vem87LNOZ
	FuKXBnkMmN9n5dt3tDUBkSDR8Eia7+RqmkucGobYb4/3Gx0TFTmS7XrxIr9yyIgMf8jq
	BKaiEQlbNw4UsxxZEUZOMvS6/hJqLLVlVWPEaHILX7EvKwLlSw+MA966gYtCAYiKjvZd
	4pmOMiB9QyN80PkSt5Wdk4IvS+Yiwh0xxZSfQYnMukuryCVFAEbvcvwOVyzyI+4fJAIC
	lgmw==
X-Received: by 10.224.16.66 with SMTP id n2mr11596156qaa.29.1364410065787;
	Wed, 27 Mar 2013 11:47:45 -0700 (PDT)
Received: from pebble.com (50-194-63-110-static.hfc.comcastbusiness.net.
	[50.194.63.110])
	by mx.google.com with ESMTPS id g6sm18685698qav.6.2013.03.27.11.47.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 11:47:44 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 27 Mar 2013 11:47:10 -0700
Message-Id: <1364410030-24008-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.128.50
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vmxnet: Don't use bswap_64 for constants
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
X-List-Received-Date: Wed, 27 Mar 2013 18:47:58 -0000

This macro is used in the context of defining enum values.
We can't use a function call in that case.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 hw/vmxnet3.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/vmxnet3.h b/hw/vmxnet3.h
index 7db0c8f..cd9ac85 100644
--- a/hw/vmxnet3.h
+++ b/hw/vmxnet3.h
@@ -37,7 +37,15 @@
 #define __packed QEMU_PACKED
 
 #if defined(HOST_WORDS_BIGENDIAN)
-#define const_cpu_to_le64(x) bswap_64(x)
+#define const_cpu_to_le64(x) \
+        (((x & 0x00000000000000ffULL) << 56) | \
+         ((x & 0x000000000000ff00ULL) << 40) | \
+         ((x & 0x0000000000ff0000ULL) << 24) | \
+         ((x & 0x00000000ff000000ULL) <<  8) | \
+         ((x & 0x000000ff00000000ULL) >>  8) | \
+         ((x & 0x0000ff0000000000ULL) >> 24) | \
+         ((x & 0x00ff000000000000ULL) >> 40) | \
+         ((x & 0xff00000000000000ULL) >> 56))
 #define __BIG_ENDIAN_BITFIELD
 #else
 #define const_cpu_to_le64(x) (x)
-- 
1.8.1.4


