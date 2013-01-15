Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvGJd-00087j-N8
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 18:53:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TvGJZ-0007wq-S6
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 18:53:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TvGJX-00087P-JC
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 18:53:09 -0500
Received: from mail-wi0-f182.google.com ([209.85.212.182]:41956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1TvGJS-00085j-Pk; Tue, 15 Jan 2013 18:53:03 -0500
Received: by mail-wi0-f182.google.com with SMTP id hn14so704915wib.3
	for <multiple recipients>; Tue, 15 Jan 2013 15:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:content-type:content-transfer-encoding;
	bh=PHkPA55HD5AfQd+4EPMHV96nYML5rvGxtppUshHBIfY=;
	b=Ahlum3ANLZrMXGTHKFkKzEFnSSV9i47suxgcvTWbf5YIm8FTCuNhFkujtwQ+A3mbch
	LVE/t4Q1bHPDFp1Cb/yxbu+uhdl2EIWS3fjb82rm5bX7CiqYEk5VID/heTVzC9MASKPz
	txwb6S4Y/GDKr+4wFOQBiuqu0FVfNsyKpIrYmnnJAh3oX7kph85DCxTD0gz7ub4bEgDl
	c3yw8c4acR5B1rK0AeI4OTAqxjx8xwqBRg04RLL6I6AQKHdmWUWA04X+CKoJQeR/otbr
	d51sdFV/IcvSz5LX4VDJJpTTTzpPJiDoAo/9Y9sQWX3Tx+g8lPqPsoNaPg4sYOuEmI7/
	S8+Q==
X-Received: by 10.180.78.66 with SMTP id z2mr6553081wiw.23.1358293981823;
	Tue, 15 Jan 2013 15:53:01 -0800 (PST)
Received: from [192.168.1.231] (host-130-157-66-217.spbmts.ru.
	[217.66.157.130])
	by mx.google.com with ESMTPS id hu8sm5618504wib.6.2013.01.15.15.52.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 15:53:00 -0800 (PST)
Message-ID: <50F5EBDA.2040208@gmail.com>
Date: Wed, 16 Jan 2013 03:52:58 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.182
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] configure: silencing
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
X-List-Received-Date: Tue, 15 Jan 2013 23:53:12 -0000

From d10856f3b1d893b5d3c6ab213eb921d0a24e7766 Mon Sep 17 00:00:00 2001
From: Vadim Evard <v.e.evard@gmail.com>
Date: Wed, 16 Jan 2013 03:45:44 +0400
Subject: [PATCH] configure: silencing pkg-config's check for curses

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
-- 
1.7.10.4


