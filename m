Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W22YP-0002xc-FJ
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jan 2014 12:41:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyv-0002Vc-L1
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:36:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyn-0004P3-96
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:53 -0500
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e]:49071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>)
	id 1W1uyV-0004Ln-FJ; Sat, 11 Jan 2014 04:35:27 -0500
Received: by mail-la0-f46.google.com with SMTP id b8so2168657lan.5
	for <multiple recipients>; Sat, 11 Jan 2014 01:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BOJ8Baxwtm/fTJDwoWM7a4Vtj6q807JhzPRWgpFqFDU=;
	b=oZ2394ywnP+Wk7+Yi24gJgZSArx6bWCWDYdxHA2npK0oSegAEfOq1xbGnqzTVvmE3V
	h3tRG/Ooo7yE3U0+KxwF2ZzEEWZJNJlbsI6+D/LMT9zF/AP7fhCi/Cv9HmvSO67/jVj9
	sB7GdDTXzw5yAvA+Oze6n3yGCLSPv3b5EkBZxAr4TP3Da05f7j93LnMQ9DnUgEGBFPv/
	OxzoxyB4QHUsab3bQYWHc0qebzKXPdXqCxNDyGzQhOMe6JJK2GzRsc4y3VC2jzUskdSb
	8bUJydjBunnupb9dppwlvj6T5PJLoIGAVfzJroNMt/zfDpnzdoRvuiKkNwlZquIXhSv4
	XYfg==
X-Received: by 10.152.45.8 with SMTP id i8mr5676141lam.12.1389432926289;
	Sat, 11 Jan 2014 01:35:26 -0800 (PST)
Received: from localhost.localdomain ([188.244.44.2])
	by mx.google.com with ESMTPSA id qx1sm5082926lbb.15.2014.01.11.01.35.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 01:35:25 -0800 (PST)
From: pavel.zbitskiy@gmail.com
To: qemu-devel@nongnu.org
Date: Sat, 11 Jan 2014 13:34:11 +0400
Message-Id: <1389432851-11420-4-git-send-email-pavel.zbitskiy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22e
X-Mailman-Approved-At: Sat, 11 Jan 2014 12:41:00 -0500
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/3] linux-user: fixed recvfrom() addrlen
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
X-List-Received-Date: Sat, 11 Jan 2014 09:36:02 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

addrlen parameter of recvfrom() of type socklen_t* was read into
variable of type socklen_t, that caused zeroing out of upper 4 bytes
when running s390x on top of x86_64. This patch changes addrlen type
to abi_ulong.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 linux-user/syscall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c2cd2b4..43f54ca 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2325,7 +2325,7 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
             size_t len;
             abi_ulong flags;
             abi_ulong addr;
-            socklen_t addrlen;
+            abi_ulong addrlen;
 
             if (get_user_ual(sockfd, vptr)
                 || get_user_ual(msg, vptr + n)
-- 
1.7.10.4


