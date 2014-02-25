Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WICAG-0000u1-5k
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 02:10:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WICA8-0000jg-Gk
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 02:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WICA2-0004aD-MI
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 02:10:44 -0500
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231]:40685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WIC9q-0004Vs-Ai; Tue, 25 Feb 2014 02:10:26 -0500
Received: by mail-ee0-f49.google.com with SMTP id b57so528769eek.36
	for <multiple recipients>; Mon, 24 Feb 2014 23:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zRSynEy2wGAZWC0OIoi9BUyrEAjOY64obUhrLxuyFcQ=;
	b=pvHnCXN3rmz4RBFlzq9d4HOKxHMsM3SRAnW5XYNX7PzXqBDVxJTp0M5OD5cW4t5NAW
	BlCaH/uhFwzaREaVEAMBzag6RZ5JB8gUM4z5K+3GAhMhZGBnnVax3kZjV+1KUUSYvt24
	KrtT1o+M44Fbqz4kEaRUCKbPjaBani3fWTcL0z0vaTM/9lWuVlikwXditTrZWXrZz1Pj
	VlIeSKOKEAa53CJK72BfhHi9QCIqCfAsEgrU+z5b4KofPx1ai9pmdS3kheqxc0uT2NKJ
	Vz99pIHFaa1MbvLffFeSq5qYubuvYUX9WX4K92YJoVXJvZ9L8QzTyFpEI7PYVCA8Eu4u
	xaNg==
X-Received: by 10.15.75.66 with SMTP id k42mr29613045eey.2.1393312225329;
	Mon, 24 Feb 2014 23:10:25 -0800 (PST)
Received: from localhost.localdomain ([41.103.124.71])
	by mx.google.com with ESMTPSA id a2sm57995708eem.18.2014.02.24.23.10.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 23:10:24 -0800 (PST)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Feb 2014 08:10:05 +0100
Message-Id: <1393312205-7858-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::231
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, peter.crosthwaite@xilinx.com,
	armbru@redhat.com, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qerror: Improve QERR_DEVICE_NOT_ACTIVE
	message
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
X-List-Received-Date: Tue, 25 Feb 2014 07:10:50 -0000

The error message as currently used is confusing as there are no "balloon" or
"spice" devices.

(qemu) balloon 1024
balloon: Device 'balloon' has not been activated

With this patch:

(qemu) balloon 1024
balloon: No balloon device has been activated

Signed-off-by: Hani Benhabiles <hani@linux.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/qmp/qerror.h | 2 +-
 qmp.c                     | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 73c67b7..25193c9 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -105,7 +105,7 @@ void qerror_report_err(Error *err);
     ERROR_CLASS_GENERIC_ERROR, "Device '%s' does not support hotplugging"
 
 #define QERR_DEVICE_NOT_ACTIVE \
-    ERROR_CLASS_DEVICE_NOT_ACTIVE, "Device '%s' has not been activated"
+    ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"
 
 #define QERR_DEVICE_NOT_ENCRYPTED \
     ERROR_CLASS_GENERIC_ERROR, "Device '%s' is not encrypted"
diff --git a/qmp.c b/qmp.c
index d0d98e7..ffddd26 100644
--- a/qmp.c
+++ b/qmp.c
@@ -289,7 +289,6 @@ void qmp_set_password(const char *protocol, const char *password,
 
     if (strcmp(protocol, "spice") == 0) {
         if (!using_spice) {
-            /* correct one? spice isn't a device ,,, */
             error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
             return;
         }
@@ -337,7 +336,6 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
 
     if (strcmp(protocol, "spice") == 0) {
         if (!using_spice) {
-            /* correct one? spice isn't a device ,,, */
             error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
             return;
         }
-- 
1.8.3.2


