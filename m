Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLVVU-0005a5-8R
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 06:31:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YLVVR-0005XT-TP
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 06:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YLVVR-0005KW-2h
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 06:30:57 -0500
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:59872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YLVVJ-0005GZ-Ua; Wed, 11 Feb 2015 06:30:50 -0500
Received: by mail-wi0-f178.google.com with SMTP id em10so2849628wid.5;
	Wed, 11 Feb 2015 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1HOqLIYaxGHP4xvT6VYyOKnlmprwB3JSOJ6DvOkdtQg=;
	b=PjF5aE2XN2ks5N9u15DCeYKq0uwOBJH3QAPQHPReTm/koE5riwQ+svrBDI7zydX1GA
	CG6klMz8gxxEtvsn96QTJ/nVjkwHYfWFTj/iC2H2Ew0xH+w3QOyGFHOnuALMWrqI5Vc2
	5qnC+uI3JohkhmNqU5TFJEb3MD96MoS2eRlakidKFwwpYwecdFgAGvaFPApDKBT9N9BB
	ZxWywQ/rECo/4Rj5f/XOQbCWbFFhNsVf6xuYToJ7pZ+8fISO3KGAk6/EtV9QwHqcvhL5
	Y0MyqzCn3IGeWICLeDwWu8QarYZ+32SooctFfjtbTA3KKWoFaRIQ7CJW0Qvfe6XXCbCu
	78tg==
X-Received: by 10.194.10.68 with SMTP id g4mr62031847wjb.5.1423654249035;
	Wed, 11 Feb 2015 03:30:49 -0800 (PST)
Received: from playground.station (net-93-66-105-136.cust.vodafonedsl.it.
	[93.66.105.136])
	by mx.google.com with ESMTPSA id hr1sm22901263wib.1.2015.02.11.03.30.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 03:30:47 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Feb 2015 12:30:43 +0100
Message-Id: <1423654243-20992-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] cutils: refine strtol error handling in
	parse_debug_env
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
X-List-Received-Date: Wed, 11 Feb 2015 11:30:59 -0000

Avoid truncation of a 64-bit long to a 32-bit int, and check for errno
(especially ERANGE).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	v1->v2: clear errno before strtol
---
 util/cutils.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index dbe7412..9312e45 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -523,16 +523,17 @@ int parse_debug_env(const char *name, int max, int initial)
 {
     char *debug_env = getenv(name);
     char *inv = NULL;
-    int debug;
+    long debug;
 
     if (!debug_env) {
         return initial;
     }
+    errno = 0;
     debug = strtol(debug_env, &inv, 10);
     if (inv == debug_env) {
         return initial;
     }
-    if (debug < 0 || debug > max) {
+    if (debug < 0 || debug > max || errno != 0) {
         fprintf(stderr, "warning: %s not in [0, %d]", name, max);
         return initial;
     }
-- 
1.8.3.1


