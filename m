Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK8TD-00086g-Jv
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 10:01:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8T2-0007Wv-Af
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 10:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8Sw-0006YP-KI
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 10:01:28 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:44818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK8Sh-0006HH-VM; Fri, 05 Oct 2012 10:01:08 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so815270bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 07:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fgQRdBFdCPJaSpTAalLjM4DrBQFIQa+gzW2mdIHEVZk=;
	b=nPorQ8TYCkRpa9Ukn61yl7cuuHHWH1CpsVfDMCynCHkbfFJ5VhbxobKxvWJ3rfAr7U
	xMMdKfI2LIGJ9/PNvpkT5tUymNy3lUa9LhPm0RSsqmuJqI98+G/1pEkJE3t4zNzVsNEY
	XT6/5WDutjxrmNkk+efi9MWnTfNVKBlAIwrrhqlvACZh2FoCud9rLGhNP+UBaHnftFDT
	LjoxHAq2PhHM0dgC5/bKJc3eKgVgx09sW1dWPf3t5wL4M8zW/+6IH0NNP/Wzo/x5iISp
	Nj9nMsNQE2vjpCL/LssT9GOOsN7dqSdt7/z3hJH+GILofPcvk+MF/GlQYMnU+IH7gPJB
	LNIQ==
Received: by 10.204.11.212 with SMTP id u20mr2808023bku.47.1349445667082;
	Fri, 05 Oct 2012 07:01:07 -0700 (PDT)
Received: from localhost (188-194-152-192-dynip.superkabel.de.
	[188.194.152.192])
	by mx.google.com with ESMTPS id o17sm7769739bkw.9.2012.10.05.07.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 07:01:06 -0700 (PDT)
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  5 Oct 2012 16:00:31 +0200
Message-Id: <1349445632-23674-12-git-send-email-stefanha@gmail.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1349445632-23674-1-git-send-email-stefanha@gmail.com>
References: <1349445632-23674-1-git-send-email-stefanha@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PATCH 11/12] qdev: kill bogus comment
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
X-List-Received-Date: Fri, 05 Oct 2012 14:01:36 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

When the DeviceInfo code was removed, the comment describing
qdev_subclass_init() was left in the code by mistake. Remove it.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@gmail.com>
---
 hw/qdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index b5a52ac..a7270a5 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -34,7 +34,6 @@ int qdev_hotplug = 0;
 static bool qdev_hot_added = false;
 static bool qdev_hot_removed = false;
 
-/* Register a new device type.  */
 const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
 {
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
-- 
1.7.11.4


