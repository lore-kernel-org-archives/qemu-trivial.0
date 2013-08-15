Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VA25c-000270-9b
	for mharc-qemu-trivial@gnu.org; Thu, 15 Aug 2013 14:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1VA25U-0001vw-TM
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 14:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1VA25Q-0005vY-84
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 14:15:56 -0400
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c]:45387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1VA25G-0005tr-MR; Thu, 15 Aug 2013 14:15:42 -0400
Received: by mail-ee0-f44.google.com with SMTP id b47so529729eek.3
	for <multiple recipients>; Thu, 15 Aug 2013 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oYEgojsEsnSCfM+AJExNyQFN8ow6Qsljutf49uvdxdM=;
	b=kO+lAHzQ6Bl7wA/8y50TG3wyanf8hPVNbEvszWDVpSGTHVITiHkdJ6zB/GG61Wtsom
	1iDbyOOHN+byBGH1OJUZDvu5LjF7FxRgLJI27i77e3Rfuapq8czG8itF3fHNajaMF2ov
	WnAXcRJMNsi6OPZ1xvXglPzcBeWJSt/ZosR/0XO7eDG5msxiM6RmC07sG/9kI9WEP16o
	p6rrvSdC6Gjk8HCevra6tGOefkH8X4DhwFyNyETbfhEZDXwIFWksCHmWpYEK2XrN+8iJ
	zvfGbHy9YTkL8Tkefgt+c7Y1mV/WGJmGxHOfz6LDFrHZLJTtCrXG2OpOnADK28kaRui8
	8t+w==
X-Received: by 10.14.115.69 with SMTP id d45mr4159591eeh.70.1376590540981;
	Thu, 15 Aug 2013 11:15:40 -0700 (PDT)
Received: from Config226VM0.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id a6sm419135eei.10.2013.08.15.11.15.39
	for <multiple recipients>
	(version=TLSv1 cipher=DES-CBC3-SHA bits=168/168);
	Thu, 15 Aug 2013 11:15:40 -0700 (PDT)
From: Taimoor <taimoor.mrza@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2013 23:13:28 +0500
Message-Id: <1376590408-7037-1-git-send-email-tmirza@codesourcery.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22c
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>
Subject: [Qemu-trivial] [PATCH v2] slirp: Port redirection option behave
	differently on Linux and Windows
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
X-List-Received-Date: Thu, 15 Aug 2013 18:16:02 -0000

From: Taimoor Mirza <tmirza@codesourcery.com>

port redirection code uses SO_REUSEADDR socket option before binding to
host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
Relaunching QEMU with same host and guest port redirection values on Linux
throws error but on Windows it does not throw any error.
Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html

Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
---
Changed #ifdef to #ifndef as SO_REUSEADDR should not be set in case of Windows.

 slirp/socket.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/slirp/socket.c b/slirp/socket.c
index 8e8819c..e4685bb 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -1,4 +1,4 @@
-/*
+x/*
  * Copyright (c) 1995 Danny Gasparovski.
  *
  * Please read the file COPYRIGHT for the
@@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 	addr.sin_port = hport;
 
 	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
+#ifndef _WIN32
 	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
+#endif
 	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
 	    (listen(s,1) < 0)) {
 		int tmperrno = errno; /* Don't clobber the real reason we failed */
-- 
1.7.5.4


