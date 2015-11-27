Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2HpY-0007Y4-9f
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 07:08:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2HpP-0007Q3-Vl
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 07:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2HpL-0006YZ-86
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 07:08:39 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:36227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1a2HpG-0006Xh-Un; Fri, 27 Nov 2015 07:08:31 -0500
Received: by wmww144 with SMTP id w144so53188382wmw.1;
	Fri, 27 Nov 2015 04:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jMlf5sN566P3oIEpE4Lkvgr5+K48umrCONeazmMJzQY=;
	b=zjTbrgAgtEYu2s8CMcIHKvYGKX8l9hsRwBvgvZWAh0A5hs8bQ0K7bGS3kLmxQL8XYL
	gvsAirBNCSo1qBDIwv+FgTdHPv/gu11jyepTg7DGPZ7M6/bbgZivwOcuC20o/uJrdTgP
	+3sKMKEKDKAwO2AssFN4D63VfPzvBa/ppsBZX2EAZl3xtv4ub8FFrtdGKfCXzIT7rnJr
	ggNHQYiynLQxgNn+GmGmmOOZiBM2RC8CrCO84x7RFXW19latf0QYekqndMcJg7pueTz4
	k74Y975pm5YCNunkk89xc8UhXiWDdOWdx4yjbioKTxsCZ3fEVbuE+NRc5C4Ta1mgrh26
	CTaA==
X-Received: by 10.194.209.235 with SMTP id mp11mr64430877wjc.53.1448626110226; 
	Fri, 27 Nov 2015 04:08:30 -0800 (PST)
Received: from donizetti.lan. (94-39-152-11.adsl-ull.clienti.tiscali.it.
	[94.39.152.11]) by smtp.gmail.com with ESMTPSA id
	an7sm32486375wjc.44.2015.11.27.04.08.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 04:08:29 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Nov 2015 13:08:25 +0100
Message-Id: <1448626105-29540-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22d
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-2.5] bt: avoid unintended sign extension
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
X-List-Received-Date: Fri, 27 Nov 2015 12:08:45 -0000

In the case of a 4-byte length, shifting a value by 24 may cause
an unintended sign extension when converting from int to size_t.
Use a uint32_t variable instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/bt/sdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index b9bcdcc..04eaeca 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -42,7 +42,7 @@ struct bt_l2cap_sdp_state_s {
 
 static ssize_t sdp_datalen(const uint8_t **element, ssize_t *left)
 {
-    size_t len = *(*element) ++ & SDP_DSIZE_MASK;
+    uint32_t len = *(*element) ++ & SDP_DSIZE_MASK;
 
     if (!*left)
         return -1;
-- 
2.5.0


