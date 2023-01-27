Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLKND-0000h8-63
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2023 03:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLKNB-0000gl-BT
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 03:46:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLKN9-0000fs-EE
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 03:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674809170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QowdSqtOHVhy09/uvKCJooHqAkCnUDBA/EgzQksY1UI=;
 b=Cjm9RuRRZzXocoYAidlvhlYQSkLX3Jgdf0iFJDN5fN+aVsLJcliUOulV4vesu/Z9i5XthV
 R7KS/5XJpztpDvkFSGLw7mcwTcNKl3y/UaTJMqLXNioNEhsNN81pxkt31a0+XXym7IhUQU
 fsdiwzHXxZZWVYUmAGhw8lPqaYAupp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-_lF5rw43OKKKpnBbr7d_tQ-1; Fri, 27 Jan 2023 03:46:07 -0500
X-MC-Unique: _lF5rw43OKKKpnBbr7d_tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C455E802C18;
 Fri, 27 Jan 2023 08:46:06 +0000 (UTC)
Received: from fedora.. (ovpn-194-166.brq.redhat.com [10.40.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3D32026D4B;
 Fri, 27 Jan 2023 08:46:04 +0000 (UTC)
From: Sebastian Mitterle <smitterl@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, cohuck@redhat.com, clegoate@redhat.com,
 qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
Date: Fri, 27 Jan 2023 09:46:04 +0100
Message-Id: <20230127084604.53175-1-smitterl@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2023 08:46:13 -0000

Add some documentation about the zpci device and how
to use it with pci devices on s390x.

Used source: Cornelia Huck's blog post
https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html

Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
---
v2: move section below 'Device support'
---
 docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
 docs/system/target-s390x.rst     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 docs/system/s390x/pcidevices.rst

diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
new file mode 100644
index 0000000000..fec905d6e6
--- /dev/null
+++ b/docs/system/s390x/pcidevices.rst
@@ -0,0 +1,34 @@
+PCI devices on s390x
+====================
+
+PCI devices on s390x work differently than on other architectures.
+
+To start with, using a PCI device requires the additional ``zpci`` device. For example,
+in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
+
+ qemu-system-s390x ... \
+                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
+                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
+
+Here, the zpci device is joined with the PCI device via the ``target`` property.
+
+Note that we don't set bus, slot or function here for the guest as is common in other
+PCI implementations. Topology information is not available on s390x. Instead, ``uid``
+and ``fid`` determine how the device is presented to the guest operating system.
+
+In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
+``fid`` identifies the physical slot, i.e.::
+
+ qemu-system-s390x ... \
+                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
+                   ...
+
+will be presented in the guest as::
+
+ # lspci -v
+ 0007:00:00.0 ...
+ Physical Slot: 00000008
+ ...
+
+Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
+it.
diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
index c636f64113..f6f11433c7 100644
--- a/docs/system/target-s390x.rst
+++ b/docs/system/target-s390x.rst
@@ -26,6 +26,7 @@ or vfio-ap is also available.
    s390x/css
    s390x/3270
    s390x/vfio-ccw
+   s390x/pcidevices
 
 Architectural features
 ======================
-- 
2.37.3


