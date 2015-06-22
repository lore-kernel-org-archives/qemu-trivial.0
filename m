Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z70uv-0008H4-C3
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 08:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70us-0008Ce-6C
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 08:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70uq-0003rK-4L
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 08:33:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z70uj-0003pM-Em; Mon, 22 Jun 2015 08:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4413040C2D;
	Mon, 22 Jun 2015 15:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 18E6CA50;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9242 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:09 +0300
Message-Id: <cbda6abf340e6ceb87984cac1db3ca6f39d9f10a.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/21] remove
	libdecnumber/dpd/decimal128Local.h
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
X-List-Received-Date: Mon, 22 Jun 2015 12:33:35 -0000

Commit 72ac97cdfc added two equivalent versions of decimal128Local.h,
one in libdecnumber/dpd/ and another in include/libdecnumber/dpd/.
Being identical by the code, the two files however differs in the
licensing terms.  The one in libdecnumber/dpd/ (which is being
removed by this patch) is licensed as GPL3.1 (plus gcc runtime
exception), which, as far as I know, is not compatible with GPL-2.
This file is not used (it is included from
include/libdecnumber/dpd/decimal128.h, so version in include/ is
used).

More, the version in include/ can also be removed, since none
of the 3 defines from that file are actually used by the code.
Even more, one of the defines from there, decimal128SetSign,
is redefined (to equivalent value) in libdecnumber/dpd/decimal128.c,
but again, never used.

What a mess...

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 libdecnumber/dpd/decimal128Local.h | 42 --------------------------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 libdecnumber/dpd/decimal128Local.h

diff --git a/libdecnumber/dpd/decimal128Local.h b/libdecnumber/dpd/decimal128Local.h
deleted file mode 100644
index 1963678..0000000
--- a/libdecnumber/dpd/decimal128Local.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/* Local definitions for use with the decNumber C Library.
-   Copyright (C) 2007, 2009 Free Software Foundation, Inc.
-
-   This file is part of GCC.
-
-   GCC is free software; you can redistribute it and/or modify it under
-   the terms of the GNU General Public License as published by the Free
-   Software Foundation; either version 3, or (at your option) any later
-   version.
-
-   GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-   WARRANTY; without even the implied warranty of MERCHANTABILITY or
-   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-   for more details.
-
-Under Section 7 of GPL version 3, you are granted additional
-permissions described in the GCC Runtime Library Exception, version
-3.1, as published by the Free Software Foundation.
-
-You should have received a copy of the GNU General Public License and
-a copy of the GCC Runtime Library Exception along with this program;
-see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-<http://www.gnu.org/licenses/>.  */
-
-#if !defined(DECIMAL128LOCAL)
-
-/* The compiler needs sign manipulation functions for decimal128 which
-   are not part of the decNumber package.  */
-
-/* Set sign; this assumes the sign was previously zero.  */
-#define decimal128SetSign(d,b) \
-  { (d)->bytes[WORDS_BIGENDIAN ? 0 : 15] |= ((unsigned) (b) << 7); }
-
-/* Clear sign.  */
-#define decimal128ClearSign(d) \
-  { (d)->bytes[WORDS_BIGENDIAN ? 0 : 15] &= ~0x80; }
-
-/* Flip sign.  */
-#define decimal128FlipSign(d) \
-  { (d)->bytes[WORDS_BIGENDIAN ? 0 : 15] ^= 0x80; }
-
-#endif
-- 
2.1.4


