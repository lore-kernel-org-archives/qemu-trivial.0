Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UEglX-00022V-JW
	for mharc-qemu-trivial@gnu.org; Sun, 10 Mar 2013 09:58:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UEglQ-00021l-Ep
	for qemu-trivial@nongnu.org; Sun, 10 Mar 2013 09:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UEglN-0004U8-OY
	for qemu-trivial@nongnu.org; Sun, 10 Mar 2013 09:58:12 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:64272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>)
	id 1UEglN-0004Tz-HM; Sun, 10 Mar 2013 09:58:09 -0400
Received: by mail-lb0-f180.google.com with SMTP id q12so2429905lbc.25
	for <multiple recipients>; Sun, 10 Mar 2013 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZG228Naa7foYEfuRyuy+5cDKHPeHsG6cXFZMcd5FIcU=;
	b=acF6p8YQmQP3cab5kMJ3yQUXmjubVaayub3shdfVsNyeC/J9pGmNQ5ACB+t/H/AI3Q
	eXcgiJBGAG1gteBesqcBXLLwbTkd6bdtymvXGWWA5Ff7qoneIAduLBhb4dXLbgOh/kCM
	SJa4DYuH/F8QNGX/xTGECQB0WUzEAEf6IxGhBwTFyckDaq7N+FT+panvTQY1Byy2w5UT
	dEXKjcJXX5j0gdC9DU9HdjP1tnt0OQqkgC/DO00NDL2XHjLfIuQd80baXRyqW0qAMVA/
	Yr5zVVciuo7ZG8J/MJ5HE2WdoUWaOclVX/e5IvRl+9rxx136gKv6BTzTBQlo1s8EOA70
	qj/A==
X-Received: by 10.152.111.5 with SMTP id ie5mr7440135lab.31.1362923888289;
	Sun, 10 Mar 2013 06:58:08 -0700 (PDT)
Received: from localhost ([79.164.43.133])
	by mx.google.com with ESMTPS id ng6sm5656846lab.2.2013.03.10.06.58.06
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 10 Mar 2013 06:58:07 -0700 (PDT)
From: Igor Mitsyanko <i.mitsyanko@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sun, 10 Mar 2013 17:58:05 +0400
Message-Id: <1362923885-2656-1-git-send-email-i.mitsyanko@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.180
Cc: i.mitsyanko@gmail.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-char.c: fix waiting for telnet
	connection message
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
X-List-Received-Date: Sun, 10 Mar 2013 13:58:18 -0000

Current colon position in "waiting for telnet connection" message template
produces messages like:
QEMU waiting for connection on: telnet::127.0.0.16666,server

After moving a colon to the right, we will get a correct messages like:
QEMU waiting for connection on: telnet:127.0.0.1:6666,server

Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 qemu-char.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 36295b1..789ee35 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2476,7 +2476,7 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
         s->do_nodelay = do_nodelay;
         getnameinfo((struct sockaddr *) &ss, ss_len, host, sizeof(host),
                     serv, sizeof(serv), NI_NUMERICHOST | NI_NUMERICSERV);
-        snprintf(chr->filename, 256, "%s:%s:%s%s%s%s",
+        snprintf(chr->filename, 256, "%s:%s%s%s:%s%s",
                  is_telnet ? "telnet" : "tcp",
                  left, host, right, serv,
                  is_listen ? ",server" : "");
-- 
1.7.5.4


