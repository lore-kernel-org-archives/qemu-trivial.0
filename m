Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLX-0000Bz-9h
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLU-00007y-S6
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLT-0006lC-T9
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52876
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLT-0006kM-PS
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/IY56asJn4k/fIDmK4Z2UzFuTytUtXxN/1Jeo1uL4U=;
 b=fiu04KBwOcfg+FhGAjIBdELZCtfZ8TgU0QSBxSNe96pOlJ6+VTFEYASELj0xKo26Q6KROu
 VihXb8EyRRKMfJh9XUGG3+vYFm0f3oThhaNLoscGtFt0o9jNICylzqBEhkYjpijDmzkHC0
 u8UpMKRkmxcXMc0e88KdhTZScVSj9k4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-0N6v60g8N0ifrRLG9uwbtw-1; Wed, 04 Mar 2020 17:18:25 -0500
X-MC-Unique: 0N6v60g8N0ifrRLG9uwbtw-1
Received: by mail-wr1-f69.google.com with SMTP id u18so1432324wrn.11
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XSVnfTQjqSoslQR7PQ9GzBNYFbBYE7GKO7GWOT3EV9E=;
 b=hRcdm/izWRgXTbVjBTMFTuEsMnMTJ4gYZPNh883e4cVvGp19Gxsb/YubJiawoU0qkV
 6JvHfgsALcqE0HJ7UZ0HN/hj+0DRIUgSS4UAtbKsLx3Zwe+3fgcEu5j9zdMl/IVNoJ4T
 pFZkxkhkYO7NuaMJtCvbanlkAxg0lo6G3cuUFsqEQxP87o7NZXpWUHx8yTARLT2zLrIB
 Oz0VQFnEhFKjd2j2vEu6ScJJ2c3gFW+HV5y20fdtfOwHiNBdsyTzJv50h+yehDgPiw4D
 JstP5GGSGvJG40JvhsotammwLSYLaHkNuoIzSKHpYWW+4hDZw+mz8Nopw1eDyHB5o+tS
 KzwQ==
X-Gm-Message-State: ANhLgQ1hdl1v/J2g3iP/XMdcP3Dy5V7VnsAkj26Dn25ieYRXak4z2owQ
 ZoYxLax1PuZPl5mNYljLOcHTijbQdS99YL0fcMmrPAjAVPvUSFV8yPMQi0iABLlSO82pF4MaESa
 d0lwQzx2i6yf0/If7Mg==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr5699810wrx.147.1583360304704; 
 Wed, 04 Mar 2020 14:18:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuNJdcnEDAJHYcPDME2sY95E31wEuSjXw582qCwO+eePpHJ5JRuqU0V6TK2m3gpex69x2yTUw==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr5699792wrx.147.1583360304484; 
 Wed, 04 Mar 2020 14:18:24 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r3sm3815573wmg.19.2020.03.04.14.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata by
 10KiB
Date: Wed,  4 Mar 2020 23:18:04 +0100
Message-Id: <20200304221807.25212-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304221807.25212-1-philmd@redhat.com>
References: <20200304221807.25212-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:30 -0000

The USB descriptor sizes are specified as 16-bit for idVendor /
idProduct, and 8-bit for bInterfaceClass / bInterfaceSubClass /
bInterfaceProtocol. Doing so we reduce the usbredir_raw_serial_ids[]
and usbredir_ftdi_serial_ids[] arrays from 16KiB to 6KiB (size
reported on x86_64 host, building with --extra-cflags=3D-Os).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/quirks.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/quirks.h b/hw/usb/quirks.h
index 89480befd7..794d89a356 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.h
@@ -21,11 +21,11 @@
 #include "quirks-pl2303-ids.h"
=20
 struct usb_device_id {
-    int vendor_id;
-    int product_id;
-    int interface_class;
-    int interface_subclass;
-    int interface_protocol;
+    int16_t vendor_id;
+    int16_t product_id;
+    int8_t interface_class;
+    int8_t interface_subclass;
+    int8_t interface_protocol;
 };
=20
 #define USB_DEVICE(vendor, product) \
--=20
2.21.1


