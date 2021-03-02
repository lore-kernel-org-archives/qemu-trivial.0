Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH3j6-0000IC-1I
	for mharc-qemu-trivial@gnu.org; Tue, 02 Mar 2021 07:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lH3j2-0000GK-LW
 for qemu-trivial@nongnu.org; Tue, 02 Mar 2021 07:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lH3j0-00061G-FS
 for qemu-trivial@nongnu.org; Tue, 02 Mar 2021 07:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614686520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pVH+ttYswMrtxtkldERUIx14rE8u/cJYDiWVIKEZ+ZM=;
 b=gTOdhmXpHayZ4b9MZxsU7kOzIUvcUcF69syma/hZ/JKbb6nR76L+5rBKvshi7H0hLardeT
 ijtwHDctDcX5pe5UofY8CbQmBQ/8+RjagGjCKsc0MPQzx2VUYzN1o8HysocY24JWUCDghs
 slfBRcujZx1Qq8XvcIXUg2tEvdpt6yE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-csdNyvABOSKx4JzBETzo0Q-1; Tue, 02 Mar 2021 07:01:58 -0500
X-MC-Unique: csdNyvABOSKx4JzBETzo0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83966D4EC;
 Tue,  2 Mar 2021 12:01:57 +0000 (UTC)
Received: from thuth.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC0CA1002388;
 Tue,  2 Mar 2021 12:01:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH v2] hw/usb/bus: Remove the "full-path" property
Date: Tue,  2 Mar 2021 13:01:52 +0100
Message-Id: <20210302120152.118042-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Mar 2021 12:02:06 -0000

This property was only required for the pc-1.0 and earlier machine
types. Since these have been removed now, we can delete the property
as well.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Remove the USB_DEV_FLAG_FULL_PATH constant completely

 hw/usb/bus.c     | 7 +------
 include/hw/usb.h | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 064f94e9c3..df7411fea8 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -19,8 +19,6 @@ static void usb_qdev_unrealize(DeviceState *qdev);
 static Property usb_props[] = {
     DEFINE_PROP_STRING("port", USBDevice, port_path),
     DEFINE_PROP_STRING("serial", USBDevice, serial),
-    DEFINE_PROP_BIT("full-path", USBDevice, flags,
-                    USB_DEV_FLAG_FULL_PATH, true),
     DEFINE_PROP_BIT("msos-desc", USBDevice, flags,
                     USB_DEV_FLAG_MSOS_DESC_ENABLE, true),
     DEFINE_PROP_STRING("pcap", USBDevice, pcap_filename),
@@ -596,11 +594,8 @@ static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
     DeviceState *hcd = qdev->parent_bus->parent;
-    char *id = NULL;
+    char *id = qdev_get_dev_path(hcd);
 
-    if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
-        id = qdev_get_dev_path(hcd);
-    }
     if (id) {
         char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
         g_free(id);
diff --git a/include/hw/usb.h b/include/hw/usb.h
index abfbfc5284..9f42394efa 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -216,7 +216,6 @@ struct USBEndpoint {
 };
 
 enum USBDeviceFlags {
-    USB_DEV_FLAG_FULL_PATH,
     USB_DEV_FLAG_IS_HOST,
     USB_DEV_FLAG_MSOS_DESC_ENABLE,
     USB_DEV_FLAG_MSOS_DESC_IN_USE,
-- 
2.27.0


