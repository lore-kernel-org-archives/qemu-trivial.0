Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8Msu-00061r-Tn
	for mharc-qemu-trivial@gnu.org; Sat, 06 Feb 2021 07:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l8Msr-0005xy-O6
 for qemu-trivial@nongnu.org; Sat, 06 Feb 2021 07:40:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l8Msq-0003xM-5S
 for qemu-trivial@nongnu.org; Sat, 06 Feb 2021 07:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612615215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyKUyofWE67481aBG/vXPtlg6uti0I7CC265LmJLkCk=;
 b=By5nDx369BjZP2HLmyQ1Pxdr0waq3fzMPRkiPznBTCAcqUhI2awKbSwrwP8aVmhzXjDymK
 w8tFJgEwn2p3W1oGjcktt0fjwbeQ1MSUThAz22RtoY/KsyoVd1X02u8mQYbnRwuBDd02TY
 Z3sPj8lA/qgcM4AuhXEJHfXZYKhDhVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Vox8_2MrOpqswkZQVzpulQ-1; Sat, 06 Feb 2021 07:40:13 -0500
X-MC-Unique: Vox8_2MrOpqswkZQVzpulQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E3CAFA80;
 Sat,  6 Feb 2021 12:40:12 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88E795D9CC;
 Sat,  6 Feb 2021 12:40:05 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, jfreimann@redhat.com
Subject: [PATCH 2/2] virtio-net: add missing object_unref()
Date: Sat,  6 Feb 2021 13:39:55 +0100
Message-Id: <20210206123955.2196514-3-lvivier@redhat.com>
In-Reply-To: <20210206123955.2196514-1-lvivier@redhat.com>
References: <20210206123955.2196514-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.353,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Feb 2021 12:40:19 -0000

failover_add_primary() calls qdev_device_add() and doesn't unref
the device. Because of that, when the device is unplugged a reference
is remaining and prevents the cleanup of the object.

This prevents to be able to plugin back the failover primary device,
with errors like:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  (qemu) device_del hostdev0

We can check with "info qtree" and "info pci" that the device has been removed, and then:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
  Error: vfio 0000:41:00.0: device is already attached
  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  qemu-kvm: Duplicate ID 'hostdev0' for device

Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
Cc: quintela@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f295e8c5..1c5af08dc556 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         dev = qdev_device_add(opts, &err);
         if (err) {
             qemu_opts_del(opts);
+        } else {
+            object_unref(OBJECT(dev));
         }
     } else {
         error_setg(errp, "Primary device not found");
-- 
2.29.2


