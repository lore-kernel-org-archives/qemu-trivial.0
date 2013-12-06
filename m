Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vox1O-0002Ck-9H
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 10:08:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vox1E-00022f-3z
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 10:08:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vox15-0002cj-Nl
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 10:08:40 -0500
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e]:41788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Vox0o-0002Wz-KU; Fri, 06 Dec 2013 10:08:14 -0500
Received: by mail-ee0-f46.google.com with SMTP id d49so357247eek.19
	for <multiple recipients>; Fri, 06 Dec 2013 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=wCUMHDnFqHFBgpras8QAjGuoMjLYADwBs4XZKfMEEhI=;
	b=K1eEv79ftpKg+maLGhyKd7uMKf69emXipQuVaw5hmpuVVLyoc3dXKlcR3WqIs0rp41
	0ft7a0bXWgLlHvzBstHiQ0/UykoxxaapGBEeBbjRUOP25g53fNvkJ4SITs3n0xt7Glo5
	1RUL5jzwjgGVdDpyCjQYvq8JNquaW7RNKXnz3eYdghnaJXsA/1mj7GcnSpPpgHKsGliY
	E5BI8eBT01cursFJdePD5nDC/b/OH65MVNd1RTWY5ANqxOMyh0W6dVmL3RGQo/PC9iLM
	U9vIU1ydOfx7HiqkwU1zS3vaPGJYmaMAUeWsEcB7kmGW07DQ8OJJCs6JQJNabJUJBP9Y
	sbZQ==
X-Received: by 10.14.101.4 with SMTP id a4mr2952851eeg.28.1386342493400;
	Fri, 06 Dec 2013 07:08:13 -0800 (PST)
Received: from localhost.localdomain (net-2-35-202-54.cust.dsl.vodafone.it.
	[2.35.202.54])
	by mx.google.com with ESMTPSA id g7sm69801132eet.12.2013.12.06.07.08.11
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 06 Dec 2013 07:08:12 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Dec 2013 16:08:05 +0100
Message-Id: <1386342485-8656-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22e
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] help: add id suboption to -iscsi
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
X-List-Received-Date: Fri, 06 Dec 2013 15:08:48 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8b94264..7f12f02 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2089,7 +2089,7 @@ ETEXI
 DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
     "-iscsi [user=user][,password=password]\n"
     "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
-    "       [,initiator-name=iqn]\n"
+    "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
     "                iSCSI session parameters\n", QEMU_ARCH_ALL)
 STEXI
 
-- 
1.7.1


