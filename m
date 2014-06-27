Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X0XDa-0002vk-S7
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jun 2014 10:33:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X0XDP-0002gU-Cl
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 10:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X0XDG-0006AA-DC
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 10:33:23 -0400
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c]:61446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1X0XCx-0005k9-MH; Fri, 27 Jun 2014 10:32:55 -0400
Received: by mail-wg0-f44.google.com with SMTP id x13so5028255wgg.3
	for <multiple recipients>; Fri, 27 Jun 2014 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3QgGiSRUCqZix2snPHuxR6pGkpEWOdclXGbVmw13oOU=;
	b=Y/bVH0gd6pvhnGT7d061ZgwicdXVBngqQGxXenaW3XWMk8KUKj1aC9gUIBV4fmFAQD
	Q0fxz+kxYrfuWk76jIhq9cuVueBWApZ4nwzcxJWxVathqi7s+ucbZiinsqiqK/CsZJqc
	smDXihJoa8lX5V74Jg+uiRP1T7PK0eBEMdnjfSR2TLeIfRxJhaqXxn4Evp1gLHbvJ1QS
	gLm6TFf5FQFhMz777IwSNPIzszyjXg3pZYJMvAeXSyMXh8lH1dIeO7bM5rebg+JVCE1J
	AgMAbQbg/yWhBe4ZKe+ouJp/MbkYGnb8pkYNUkOxXrH7oJj8RkzX4wmMriHTwKjVDho8
	u4AA==
X-Received: by 10.194.86.225 with SMTP id s1mr26158379wjz.21.1403879574318;
	Fri, 27 Jun 2014 07:32:54 -0700 (PDT)
Received: from playground.station (net-37-117-147-170.cust.vodafonedsl.it.
	[37.117.147.170]) by mx.google.com with ESMTPSA id
	fn1sm37121730wib.18.2014.06.27.07.32.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jun 2014 07:32:53 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jun 2014 16:32:49 +0200
Message-Id: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22c
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Subject: [Qemu-trivial] [PATCH for 2.1] vfio: use correct runstate
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
X-List-Received-Date: Fri, 27 Jun 2014 14:33:32 -0000

io-error is for block device errors; it should always be preceded
by a BLOCK_IO_ERROR event.  I think vfio wants to use
RUN_STATE_INTERNAL_ERROR instead.

Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/vfio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/vfio.c b/hw/misc/vfio.c
index 7437c2e..9d71d97 100644
--- a/hw/misc/vfio.c
+++ b/hw/misc/vfio.c
@@ -3978,7 +3978,7 @@ static void vfio_err_notifier_handler(void *opaque)
                  __func__, vdev->host.domain, vdev->host.bus,
                  vdev->host.slot, vdev->host.function);
 
-    vm_stop(RUN_STATE_IO_ERROR);
+    vm_stop(RUN_STATE_INTERNAL_ERROR);
 }
 
 /*
-- 
1.8.3.1


