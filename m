Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvZQN-00043k-B0
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 15:17:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TvZQJ-0003qm-2P
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 15:17:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TvZQG-0006Ho-Jn
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 15:17:22 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:58916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1TvZQ9-0006Ga-OD; Wed, 16 Jan 2013 15:17:13 -0500
Received: by mail-la0-f45.google.com with SMTP id ep20so1888775lab.32
	for <multiple recipients>; Wed, 16 Jan 2013 12:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zrF87/nOrmWe7V56U54WDYzBPNyvkk5ziTS7xhC0wJc=;
	b=u4YjSTtnDHGFRs+VNcnBawALging6rUvuLH1U6rvNPvN4H9zPe3Y17DPqzNue0AWL5
	MBtu8MXdvlglr+pM8SVeZ3YCK6uAOLxXutK2+s6DPOVXTM1EGfRhCzDP8EDs7FwK4AL3
	8pFxlFixkSAz9UgBE4cPFoD77i1IdM5fRO3a35qemBLxHNf3XJlw+LO6y4n/UQhQTOCL
	IZwi7d7wkhtLK3agqyRcO9hvtulZ+VO0Rs9avZlI+Ssmza7eza9byZomTevtLXc4fIiy
	75xrq+Bka8jqpDFgo7sIMz0xHFZ/NRvzsemWhQGrHxmeobJ4yD6aH0GewnJzFLgaHnTA
	Igjg==
X-Received: by 10.152.110.18 with SMTP id hw18mr2421300lab.22.1358367432216;
	Wed, 16 Jan 2013 12:17:12 -0800 (PST)
Received: from ?IPv6:2001:5c0:1400:b::54d? (AvImd.broker.freenet6.net.
	[2001:5c0:1400:b::54d])
	by mx.google.com with ESMTPS id s9sm8607080lbc.12.2013.01.16.12.17.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 12:17:11 -0800 (PST)
Message-ID: <50F70AC3.9070202@gmail.com>
Date: Thu, 17 Jan 2013 00:17:07 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <50F5EBDA.2040208@gmail.com> <87mww9jhz1.fsf@codemonkey.ws>
In-Reply-To: <87mww9jhz1.fsf@codemonkey.ws>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: silence
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
X-List-Received-Date: Wed, 16 Jan 2013 20:17:25 -0000

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
-- 
1.7.10.4


