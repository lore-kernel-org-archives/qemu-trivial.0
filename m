Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2HpW-0007UM-Ci
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 07:08:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2HpQ-0007Qe-7X
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 07:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2HpL-0006Ye-BP
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 07:08:40 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:37049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1a2HpG-0006X2-7E; Fri, 27 Nov 2015 07:08:30 -0500
Received: by wmww144 with SMTP id w144so55854691wmw.0;
	Fri, 27 Nov 2015 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MSsVexaGTs5TM3PQgZifpKusQrhBW3pyN+vd6YKJZU4=;
	b=vo8Cx7fjH+rLApfcyMPmleLcJIYEuj4N6NQEg8P6TiI+VUSZB2H6PY4KZTXYwtF4s1
	1J+JPTRXattrcGMBxqzbgklY9WCxjaQ0IFHQcUiBGULo2PdBpkQXJGMqozF2tVnWEMa7
	5Mrrfy8Fq86dTf+a+pUHL9oxZQbKFQjRDvs50jHXAW0PR316Y7/paGQxBBEyoLqhFyGS
	hSUDYaISeSwwYcr3DSL0GNJ0pyk0jLjyYwP+2hiYrWP4MRAr1I55v2SHWlETJFSNdFX8
	GA941aHvR65v4HzCjIRvAlcNqLtiIQryqsgpI8WQVvzJiCUMIgLd3P0gzt8tLeqCLDnj
	PsVg==
X-Received: by 10.28.0.149 with SMTP id 143mr10356953wma.103.1448626109525;
	Fri, 27 Nov 2015 04:08:29 -0800 (PST)
Received: from donizetti.lan. (94-39-152-11.adsl-ull.clienti.tiscali.it.
	[94.39.152.11]) by smtp.gmail.com with ESMTPSA id
	an7sm32486375wjc.44.2015.11.27.04.08.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 04:08:28 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Nov 2015 13:08:24 +0100
Message-Id: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::234
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-2.5] bt: fix two struct sizes
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
X-List-Received-Date: Fri, 27 Nov 2015 12:08:44 -0000

See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
reasons these do not use sizeof, and Coverity caught a mistake in
EVT_ENCRYPT_CHANGE_SIZE.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/bt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/bt.h b/include/hw/bt.h
index cb2a7e6..bbea104 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -1266,7 +1266,7 @@ typedef struct {
     uint8_t	status;
     uint16_t	handle;
 } QEMU_PACKED reset_failed_contact_counter_rp;
-#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
+#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
 
 #define OCF_READ_LINK_QUALITY		0x0003
 typedef struct {
@@ -1381,7 +1381,7 @@ typedef struct {
     uint16_t	handle;
     uint8_t	encrypt;
 } QEMU_PACKED evt_encrypt_change;
-#define EVT_ENCRYPT_CHANGE_SIZE 5
+#define EVT_ENCRYPT_CHANGE_SIZE 4
 
 #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
 typedef struct {
-- 
2.5.0


