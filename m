Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHp-0004Yq-S4
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReit-0002Ur-Fh
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReil-0003u2-30
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:43 -0400
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229]:60101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiQ-0003nG-HW; Sun, 23 Mar 2014 05:29:14 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so4133109pdb.28
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YcKXtF0wqdudBBUyLSYC8RqGc1vhLbEVIoNwDXL8gbM=;
	b=h7OnCiK2J/zFyA7ymfug+czfy9x1pUBZGfbeSPN5NrcThTWZbMgimJWvU+ddDa9bKX
	9dIsqpMr0Xv5TWPzDwtbqKdqN6BLy6g2hRG25a1DxKg+MB+9O1ljVgoFIjG32sdFoBD8
	fbN9o4T543QslHK3bFQcpGlq75OIIf5qQRpS0f4Y/3oEpzSs0hbfh3duz4+3c0zxqPCw
	Q0pF4Ygm4RZeGV8s/SbhhzqIAg8hdGB9DJwOG8kPKLdsWwL7dl11Mh0qkV6F3aFCoGgI
	c9z6GEkVEFE9725fPXAmHPSYi+KHWFyadheHch+EjW61MO7C3GtYgOHQTYgAooA+3mNj
	GviA==
X-Received: by 10.66.119.172 with SMTP id kv12mr64622761pab.34.1395566953671; 
	Sun, 23 Mar 2014 02:29:13 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id h6sm21075681pbl.75.2014.03.23.02.29.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:12 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 0177EA00633; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:43 +0530
Message-Id: <1395566923-5074-6-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::229
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 6/6] net: netmap_poll must update both
	read/write poll state
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
X-List-Received-Date: Sun, 23 Mar 2014 09:29:52 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 net/netmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netmap.c b/net/netmap.c
index 8213304..0c1772b 100644
--- a/net/netmap.c
+++ b/net/netmap.c
@@ -177,8 +177,8 @@ static void netmap_poll(NetClientState *nc, bool enable)
     NetmapState *s = DO_UPCAST(NetmapState, nc, nc);
 
     if (s->read_poll != enable || s->write_poll != enable) {
-        s->read_poll = enable;
-        s->read_poll = enable;
+        s->write_poll = enable;
+        s->read_poll  = enable;
         netmap_update_fd_handler(s);
     }
 }
-- 
1.8.1.2


