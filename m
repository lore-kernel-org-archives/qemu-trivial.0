Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W22YM-0002sl-Ui
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jan 2014 12:40:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uym-0002Uc-2p
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyd-0004Nd-Lr
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:44 -0500
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230]:34738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>)
	id 1W1uyL-0004Ka-Vn; Sat, 11 Jan 2014 04:35:18 -0500
Received: by mail-la0-f48.google.com with SMTP id n7so3825807lam.7
	for <multiple recipients>; Sat, 11 Jan 2014 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TOlsv9QHvgVKHvivb2VQbmJO66a/LdFbMZUOqivWCBs=;
	b=uccyqJqaZq3AgSnn+HaKnuMLumMwVo9S8+GYrmY/b8gpUKID+ZUCxbZnF7PIgJBZR1
	uID78HnXLxvXorN3MYqTydxZkeu0NDtiUi6N0GhXiqpyt2CL6RV/Gh+OkD1UmCdH6tb2
	11OoTzI185XcvgQcGao4fBqBYmcoME/KoK1IO4b0GcXCznvmvr1FTSPdcBrviqgeHpoI
	/Ifv91z1YaBf3YK9Sz8du7NLib0u2PcAPBQZVi5FtnfHycZ6blqTgr3DE8REzAtxraol
	FoOHArYAOqSbaG5bTRvOYj7y2jEF+D4MM/HYvmzhXeTMnD19pCLbDh2+f0O/aFumZD+B
	9XVg==
X-Received: by 10.152.87.37 with SMTP id u5mr5596281laz.11.1389432916790;
	Sat, 11 Jan 2014 01:35:16 -0800 (PST)
Received: from localhost.localdomain ([188.244.44.2])
	by mx.google.com with ESMTPSA id qx1sm5082926lbb.15.2014.01.11.01.35.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 01:35:16 -0800 (PST)
From: pavel.zbitskiy@gmail.com
To: qemu-devel@nongnu.org
Date: Sat, 11 Jan 2014 13:34:09 +0400
Message-Id: <1389432851-11420-2-git-send-email-pavel.zbitskiy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::230
X-Mailman-Approved-At: Sat, 11 Jan 2014 12:40:56 -0500
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/3] linux-user: fixed s390x clone() argument
	order
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
X-List-Received-Date: Sat, 11 Jan 2014 09:35:52 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

It was broken by 4ce6243dc6216e35b5b691078ffa856463bfa8db,
where TARGET_CLONE_BACKWARDS was specified instead of
TARGET_CLONE_BACKWARDS2.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 linux-user/s390x/syscall.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/syscall.h b/linux-user/s390x/syscall.h
index ea8c304..e5ce30b 100644
--- a/linux-user/s390x/syscall.h
+++ b/linux-user/s390x/syscall.h
@@ -22,4 +22,4 @@ struct target_pt_regs {
 
 #define UNAME_MACHINE "s390x"
 
-#define TARGET_CLONE_BACKWARDS
+#define TARGET_CLONE_BACKWARDS2
-- 
1.7.10.4


