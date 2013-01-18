Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCJ7-0008Tn-Vi
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:48:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TwCJ1-0008Cl-UL
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TwCIy-0005s2-A3
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:48:27 -0500
Received: from mail-lb0-f169.google.com ([209.85.217.169]:45977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1TwCIs-0005qG-EK; Fri, 18 Jan 2013 08:48:18 -0500
Received: by mail-lb0-f169.google.com with SMTP id m4so1481338lbo.14
	for <multiple recipients>; Fri, 18 Jan 2013 05:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:content-type:content-transfer-encoding;
	bh=sxbMXu5fUt8x3jdQwPswWcTf9ssxEkFn+SF8zqOVzjw=;
	b=cR7lv5yC8rO1apHLnE0ZcE3JJJXL0QxNQVQ279x9ZhqDlEzUqnei2LcdNGzynV026J
	XL3WbqXvR1Mch95EbTkYtLpBmSElXL+wTA2CoBXakEkzgA4FF5SQHsjOtN334kqp+o1T
	mCbpnywty+P3osELtE8Mb+kJ0Vrw1HkyoK5EidK1uZInY6qrwmPdSLrQy7gv3g8yFnhL
	UUtxEQudtRBadhyNHcwx1DBK1UuC7ueEbG3/NOVC/yOEI+Hm8ZZi6zuyuQYxIEyNoLo9
	KbvO0AbPV9lhcgztc8pMp8OjqqMSO4mv2yj8oJJY6o0CJ0fX9ojr2IRjGzbyr42dEJpH
	kLeQ==
X-Received: by 10.152.108.48 with SMTP id hh16mr8471588lab.25.1358516896744;
	Fri, 18 Jan 2013 05:48:16 -0800 (PST)
Received: from ?IPv6:2001:5c0:1400:b::54d? (AvImd.broker.freenet6.net.
	[2001:5c0:1400:b::54d])
	by mx.google.com with ESMTPS id lx18sm2063471lab.14.2013.01.18.05.48.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 05:48:15 -0800 (PST)
Message-ID: <50F95294.1000400@gmail.com>
Date: Fri, 18 Jan 2013 17:48:04 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.169
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: silence
 pkg-config's check for curses
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
X-List-Received-Date: Fri, 18 Jan 2013 13:48:30 -0000

Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4ebb60d..6211db9 100755
--- a/configure
+++ b/configure
@@ -2039,7 +2039,7 @@ fi
 if test "$mingw32" = "yes" ; then
     curses_list="-lpdcurses"
 else
-    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
+    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses 2>/dev/null)"
 fi
 
 if test "$curses" != "no" ; then
-- 1.7.10.4
 	

