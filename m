Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7oV5-0001Hz-Hq
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 14:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7oV0-0001G2-Uu
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 14:34:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7oUx-00008X-Q5
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 14:34:42 -0400
Received: from resqmta-po-06v.sys.comcast.net ([96.114.154.165]:41440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7oUx-00008Q-KN
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 14:34:39 -0400
Received: from resomta-po-15v.sys.comcast.net ([96.114.154.239])
	by comcast with SMTP
	id 7oRlbUvNS9sFT7oTxbYqV9; Tue, 31 May 2016 18:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1464719617;
	bh=11rENbilWNWTOAQqGau6ttp388q13d4lbVXCg/W/oNs=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=ZFQu/cpV3Ym28fEWKb04P/PCBtl1gOBbA21j+5jjLDYmNidoT7NZnwDYLEs9IH3BK
	dGjBFuv/u1TcfN824B8x7GUECfrjml0/u7ykB+AZ8R04VoBRyXXU5HnjrpV6CwU9t/
	XG4J/GjeiaB72oyiT5VcRvQ+iS0EDH7KAum+h1ocPBzBE9Ct1uFq/3Gm253uTc8xkC
	wwU66GQoKSwT/Nhauq2ATFxw+uS8B8C7JsYVoBCNwVZHtSwj8/CoocU7x+a/OcYrgF
	bI98XaALLewhPHnPYgoNDNgVw9dGbZE8G1QB3qfMcczHwGlQ3STTP2FOwIAyfg+743
	WasmdRZqq6oAg==
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-15v.sys.comcast.net with comcast
	id 16ZZ1t00E2fD5rL016ZccN; Tue, 31 May 2016 18:33:37 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 31 May 2016 12:33:31 -0600
Message-Id: <1464719611-17268-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.165
Subject: [Qemu-trivial] [PATCH] host-utils: Prefer 'false' for bool type
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2016 18:34:46 -0000

Mixing '0' and 'bool' looks stupid.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/host-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 1cdae0d..3de7d4e 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -486,7 +486,7 @@ static inline uint64_t revbit64(uint64_t x)
 static inline bool is_power_of_2(uint64_t value)
 {
     if (!value) {
-        return 0;
+        return false;
     }

     return !(value & (value - 1));
-- 
2.5.5


