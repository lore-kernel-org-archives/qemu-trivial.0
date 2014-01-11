Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W22YP-0002x6-6H
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jan 2014 12:41:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyt-0002VE-OU
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyl-0004Oi-BW
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:51 -0500
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a]:52579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>)
	id 1W1uyT-0004LR-LQ; Sat, 11 Jan 2014 04:35:25 -0500
Received: by mail-la0-f42.google.com with SMTP id ec20so3958786lab.1
	for <multiple recipients>; Sat, 11 Jan 2014 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sUdQelW64JvOQAGhA+3wVP82yrvvgUQg9aEsT9MeTH4=;
	b=LSK1L8uVk6OEP5BVZvFVTavT442EQAgzBcPqSIL13QW+iZSuT74upfBDncZnj0iAb+
	DCTjV1LQgAhiQtz2eL2AZ0LvC9SZ0ttTGu4oca51w017O/nKU5d8Dios6BLoulOKVjpd
	fdYYq9tn5qUbfHP5fJI6DH7mDY2nPDlP/gw65qnqNj5PHU20cre4VW9kylRh+7aiAPuP
	NMdBTVPl+FkP407s2S4TOVgufMMBZYHbPtHnXVrtP2KCUMXDOd++3PeRoVtvK5H6xLDt
	YAQ/KE74LI2fJ5Fc8AdJ6w4tmc/3EOi4VgQKXxug9OIUmqtmRufMXMbE0N6/8H8aoYhR
	CMUQ==
X-Received: by 10.152.203.129 with SMTP id kq1mr729551lac.77.1389432924468;
	Sat, 11 Jan 2014 01:35:24 -0800 (PST)
Received: from localhost.localdomain ([188.244.44.2])
	by mx.google.com with ESMTPSA id qx1sm5082926lbb.15.2014.01.11.01.35.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 01:35:24 -0800 (PST)
From: pavel.zbitskiy@gmail.com
To: qemu-devel@nongnu.org
Date: Sat, 11 Jan 2014 13:34:10 +0400
Message-Id: <1389432851-11420-3-git-send-email-pavel.zbitskiy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22a
X-Mailman-Approved-At: Sat, 11 Jan 2014 12:40:58 -0500
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/3] linux-user: fixed getsockopt() optlen
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
X-List-Received-Date: Sat, 11 Jan 2014 09:36:00 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

optlen parameter of getsockopt() of type socklen_t* was read into
variable of type socklen_t, that caused zeroing out of upper 4 bytes
when running s390x on top of x86_64. This patch changes optlen type
to abi_ulong.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 linux-user/syscall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4a14a43..c2cd2b4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2389,7 +2389,7 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
             abi_ulong level;
             abi_ulong optname;
             abi_ulong optval;
-            socklen_t optlen;
+            abi_ulong optlen;
 
             if (get_user_ual(sockfd, vptr)
                 || get_user_ual(level, vptr + n)
-- 
1.7.10.4


