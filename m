Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ptA-0007T7-HM
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9pt7-0007NC-Je
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9pt6-0001bd-DS
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26233
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9pt6-0001b9-AA
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfL2wrp1xmfb4e/iaQpRjnEbNuM8Iy0Ua18MeCip/nA=;
 b=Qy7OUH5DCmXrOVPm8HnEfxQG4vBZUYiNku8n6D8kJUiZtmKkSiPuDN0ApoT1JEJxQ9Ljvi
 H//JbEeTjt8EFo76SU/J58FwKtFMiKsaszApx0DvMlXLQ3ThPpfJSHttxkGMnok/PnfxDy
 UtgfBq9gnIUQrTZJWD6JmZVQWsIibPc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-6-noYMk0PF6CdHLZCQfjow-1; Thu, 05 Mar 2020 07:46:02 -0500
X-MC-Unique: 6-noYMk0PF6CdHLZCQfjow-1
Received: by mail-wr1-f70.google.com with SMTP id x14so1662881wrv.23
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOfgZg45p005Cf8aNVaFJuLhPI+JdhyWRao0wzg6LoM=;
 b=XQ+OMjrTA1IXAa22sSUkpt2MhkXTE4OQY+aKmO6aioZ7BDLIMaZoAAtAEexVzyhCrv
 7iC7PAuQWe7+o1PUP5Cw3dDTbMw4oiLSs8uGPHF1D3U8+6I4nKYQiUdd5J/By6/SWB19
 vPIRa1r1k/+0zrRuhs8qkgg+tHG6CA5itmed6B0H4rm4azARZwYpxkdYvD0mX7pPRs02
 ibVJ9+Kbje3R6ahBjmbAdE068LEg2Teo9BmuL34HW+e9wjBJUW+HWoqI4mg897i9AvYL
 yGFi4/EjuKM/pswwwnc8aVlcoF53JnARTBNYhsNhXM7X2pTf5T9B2BaZ3SOmKHecnIR1
 zR2w==
X-Gm-Message-State: ANhLgQ2riralNgTKDeYWhxm3A/DcGzM5TDixIz1Iia0bPzfOamBduXXP
 sNLiHVHvCjfYQbGqGoCdutEaqWg7LxrdW92zkVdsnKQE9WwhI9JXCaW5LKHgh5G172SdL1G2TYG
 jKr5g/5eKxNH4Ot5VBA==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr9353856wmj.34.1583412360848; 
 Thu, 05 Mar 2020 04:46:00 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtYQ3Fcji41liGZ4F/ZeQyFAYO+TfPXs7EPSdszQCv1mrO1EYqxHjHgHw9ceMByt1uuFupuDw==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr9353820wmj.34.1583412360562; 
 Thu, 05 Mar 2020 04:46:00 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z12sm17054451wrs.43.2020.03.05.04.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:46:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 6/9] hw/usb/quirks: Use smaller types to reduce .rodata by
 10KiB
Date: Thu,  5 Mar 2020 13:45:22 +0100
Message-Id: <20200305124525.14555-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 05 Mar 2020 12:46:07 -0000

The USB descriptor sizes are specified as 16-bit for idVendor /
idProduct, and 8-bit for bInterfaceClass / bInterfaceSubClass /
bInterfaceProtocol. Doing so we reduce the usbredir_raw_serial_ids[]
and usbredir_ftdi_serial_ids[] arrays from 16KiB to 6KiB (size
reported on x86_64 host, building with --extra-cflags=3D-Os).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add bitfield values and use unsigned types (Gerd)
---
 hw/usb/quirks.h | 22 +++++++++++++---------
 hw/usb/quirks.c |  4 ++--
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/usb/quirks.h b/hw/usb/quirks.h
index 89480befd7..50ef2f9c2e 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.h
@@ -21,19 +21,23 @@
 #include "quirks-pl2303-ids.h"
=20
 struct usb_device_id {
-    int vendor_id;
-    int product_id;
-    int interface_class;
-    int interface_subclass;
-    int interface_protocol;
+    uint16_t vendor_id;
+    uint16_t product_id;
+    uint8_t interface_class;
+    uint8_t interface_subclass;
+    uint8_t interface_protocol;
+    uint8_t interface_protocol_used:1,
+            terminating_entry:1,
+            reserved:6;
 };
=20
 #define USB_DEVICE(vendor, product) \
-    .vendor_id =3D vendor, .product_id =3D product, .interface_class =3D -=
1,
+    .vendor_id =3D vendor, .product_id =3D product, .interface_protocol_us=
ed =3D 0,
=20
 #define USB_DEVICE_AND_INTERFACE_INFO(vend, prod, iclass, isubclass, iprot=
o) \
     .vendor_id =3D vend, .product_id =3D prod, .interface_class =3D iclass=
, \
-    .interface_subclass =3D isubclass, .interface_protocol =3D iproto
+    .interface_subclass =3D isubclass, .interface_protocol =3D iproto, \
+    .interface_protocol_used =3D 1
=20
 static const struct usb_device_id usbredir_raw_serial_ids[] =3D {
     /*
@@ -206,7 +210,7 @@ static const struct usb_device_id usbredir_raw_serial_i=
ds[] =3D {
     { USB_DEVICE(ADLINK_VENDOR_ID, ADLINK_ND6530_PRODUCT_ID) },
     { USB_DEVICE(SMART_VENDOR_ID, SMART_PRODUCT_ID) },
=20
-    { USB_DEVICE(-1, -1) } /* Terminating Entry */
+    { .terminating_entry =3D 1 } /* Terminating Entry */
 };
=20
 static const struct usb_device_id usbredir_ftdi_serial_ids[] =3D {
@@ -906,7 +910,7 @@ static const struct usb_device_id usbredir_ftdi_serial_=
ids[] =3D {
     { USB_DEVICE(FTDI_VID, FTDI_DISTORTEC_JTAG_LOCK_PICK_PID) },
     { USB_DEVICE(FTDI_VID, FTDI_LUMEL_PD12_PID) },
=20
-    { USB_DEVICE(-1, -1) } /* Terminating Entry */
+    { .terminating_entry =3D 1 } /* Terminating Entry */
 };
=20
 #undef USB_DEVICE
diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index 38a9c5634a..23ea7a23ea 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -22,10 +22,10 @@ static bool usb_id_match(const struct usb_device_id *id=
s,
                          uint8_t interface_protocol) {
     int i;
=20
-    for (i =3D 0; ids[i].vendor_id !=3D -1; i++) {
+    for (i =3D 0; ids[i].terminating_entry =3D=3D 0; i++) {
         if (ids[i].vendor_id  =3D=3D vendor_id &&
             ids[i].product_id =3D=3D product_id &&
-            (ids[i].interface_class =3D=3D -1 ||
+            (ids[i].interface_protocol_used =3D=3D 0 ||
              (ids[i].interface_class =3D=3D interface_class &&
               ids[i].interface_subclass =3D=3D interface_subclass &&
               ids[i].interface_protocol =3D=3D interface_protocol))) {
--=20
2.21.1


