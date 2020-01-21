Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itwEE-00047J-4C
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 11:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itwE6-000448-9M
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:18:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itwE1-0006kV-Ht
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:18:01 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54499
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itwE1-0006k5-EI
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579623476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a3Ux0PVxC8InXew79I80ST6+H9hTQVTilwJku2Xro48=;
 b=cd2OuRaY9BOn3+TRPPk5s3EZ5uR2of69vYgKhxF2zVI8nHB7nbWcOmSsnpBiaR7qxUYZu6
 6XuFetf9X68jqmF/xHulDyL95RvZCvOgB0vHKtp6B9jPO9lxEs5w8KLyS1+4r+dDMuu0Bz
 pLR4ruayLYArALQ5TfASmWCGQxYLAhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-oGkG9ygMPtaS4BNVSu56XQ-1; Tue, 21 Jan 2020 11:17:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FFCA10883A0;
 Tue, 21 Jan 2020 16:17:52 +0000 (UTC)
Received: from thuth.com (unknown [10.36.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADEC60FC4;
 Tue, 21 Jan 2020 16:17:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: qemu-trivial@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [Qemu-devel] [PATCH] trivial: Remove xenfb_enabled from sysemu.h
Date: Tue, 21 Jan 2020 17:17:47 +0100
Message-Id: <20200121161747.10569-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: oGkG9ygMPtaS4BNVSu56XQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Tue, 21 Jan 2020 16:18:06 -0000

The define is only used in one other place. Move the code there
instead of keeping this xen-specific define in sysemu.h.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/xenpv/xen_machine_pv.c | 2 +-
 include/sysemu/sysemu.h   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 3a8af1a1e0..8df575a457 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -60,7 +60,7 @@ static void xen_init_pv(MachineState *machine)
     xen_be_register("qnic", &xen_netdev_ops);
=20
     /* configure framebuffer */
-    if (xenfb_enabled) {
+    if (vga_interface_type =3D=3D VGA_XENFB) {
         xen_config_dev_vfb(0, "vnc");
         xen_config_dev_vkbd(0);
     }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 80c57fdc4e..2ccf216158 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -32,7 +32,6 @@ typedef enum {
 } VGAInterfaceType;
=20
 extern int vga_interface_type;
-#define xenfb_enabled (vga_interface_type =3D=3D VGA_XENFB)
=20
 extern int graphic_width;
 extern int graphic_height;
--=20
2.18.1


