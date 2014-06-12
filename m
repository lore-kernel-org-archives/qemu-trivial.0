Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wv1CW-0007vR-5e
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jun 2014 05:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wv1CL-0007jU-VY
	for qemu-trivial@nongnu.org; Thu, 12 Jun 2014 05:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wv1CC-0003Ss-V6
	for qemu-trivial@nongnu.org; Thu, 12 Jun 2014 05:21:29 -0400
Received: from mail-qc0-x234.google.com ([2607:f8b0:400d:c01::234]:40362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Wv1Bu-0003PG-9Y; Thu, 12 Jun 2014 05:21:02 -0400
Received: by mail-qc0-f180.google.com with SMTP id i17so1454648qcy.39
	for <multiple recipients>; Thu, 12 Jun 2014 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=yb0WjMt7+bimF05oSmAoDC0g0XOwgPFGNnxIX408wDs=;
	b=u9aEzn/gwJp/JL3u5McEP+0FK8v/GrscVsucscEwwg5GnnEbhjfpKI27cQNsJBsCTD
	rL6bOSdN1Ghp3I5/6ayejoNg81ZjhB2oWcWqsYlPxzjnlFxFpNiRCyfN69vSGC+8uvS8
	A51+XqSlaY8LKEa1f4BJwC+GmI+kuXppet5DOP3BrzHCjGF7hCsJhZrDcywlbF3ZsjHL
	p11jvitKWbGweShiMMTQ/JpCcnT4tz4/svfMQmtdkzAwRzN3q71pGUCu00hJYZFf7aot
	qJsYpwgDRoIxk4kGjVAvwBX0RGaaP0YxqtJNjRNEX/lVlCgE5KJCWtKAMceX/1//iV0W
	EcuQ==
X-Received: by 10.140.25.166 with SMTP id 35mr29297321qgt.103.1402564861763;
	Thu, 12 Jun 2014 02:21:01 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(host216-139-dynamic.0-87-r.retail.telecomitalia.it. [87.0.139.216])
	by mx.google.com with ESMTPSA id p21sm458827qgp.14.2014.06.12.02.21.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jun 2014 02:21:01 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Jun 2014 11:20:53 +0200
Message-Id: <1402564853-20792-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::234
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com
Subject: [Qemu-trivial] [PATCH] virtio-serial: remove useless set_config
	function
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
X-List-Received-Date: Thu, 12 Jun 2014 09:21:39 -0000

Its only contents are a dead memcpy.  Since it is optional,
drop the function altogether.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/virtio-serial-bus.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 2b647b6..a2958ff 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -465,13 +465,6 @@ static void get_config(VirtIODevice *vdev, uint8_t *config_data)
     memcpy(config_data, &vser->config, sizeof(struct virtio_console_config));
 }
 
-static void set_config(VirtIODevice *vdev, const uint8_t *config_data)
-{
-    struct virtio_console_config config;
-
-    memcpy(&config, config_data, sizeof(config));
-}
-
 static void guest_reset(VirtIOSerial *vser)
 {
     VirtIOSerialPort *port;
@@ -1024,7 +1017,6 @@ static void virtio_serial_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_serial_device_unrealize;
     vdc->get_features = get_features;
     vdc->get_config = get_config;
-    vdc->set_config = set_config;
     vdc->set_status = set_status;
     vdc->reset = vser_reset;
 }
-- 
1.9.3


