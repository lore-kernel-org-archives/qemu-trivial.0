Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3070-0002Dj-OJ
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 11:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j306y-0002A3-6Y
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j306x-0005d8-9q
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27309
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j306x-0005d0-6T
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581783366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2W2KV5vhhaOPypV6UoE9INvWUy7cADf9BtseHUCCnZ8=;
 b=fw07wps40WUgnHMdeRLGNbPUZf+qcpJB64lpQB5xyIjfsIHroYXb46nljYZ3heScN2vZ/x
 022SeKo3iEB80sR9+ZAHVsRigBNBmCC59/NaffNdn3ORbPb3sXbr1pKywWmcfHgmJ8rfDS
 tsJ2R0NJGVZTyx5kUunjG/jx4qNk9YE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-41haCuugOeSm6jfZMYwF0g-1; Sat, 15 Feb 2020 11:16:04 -0500
Received: by mail-wr1-f71.google.com with SMTP id r1so5907149wrc.15
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 08:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t93RD3b9dRJMk744Iwvg4Pa/O1lItTONfyZhiaohMVU=;
 b=g5SMyztyZUn7eLkc6YPi3Vso65iAUN2i15YH4xkGA9UxaAgq5EFLAzUDbT4nIPsPhp
 meViEHuHrn1w1f5jidPcowjoSsndICqVJVGkcFMEZq3wro0J4oqd7NYPFfRWEbAhywn+
 xyugByfCwYROc5+VqNB1RFMdd79ABwKXtNzanNM5uDOkmPcDeNhsZZ3sYMxLEk7KRbvT
 p/RbMOOqFhhNXsO8bBAnl6wZBVohJ8JYOBcFT26sTheNHaDrTrNnEHfobeM4Cy4A5+NU
 ZWqHcQukoGnnhvGpzWF9sQtyJzI5RB01Ii+GPFG0OGRusA0w2/YvBjN4/JxtSp5U74dj
 eLjQ==
X-Gm-Message-State: APjAAAWfLAnCByZ5twAT66MyHkFWH8NmXaRy0pNDaA8B4EgyTKCNXGGj
 dF5pFuQu5XYxCQhOQ/+j9ZOj1aBfAZvIJ/EU7/4OISTPt6BuQ3klj4ue4FKM7T4MNuNh/PfYiN5
 twFeMWPna4FqVZ/+Kow==
X-Received: by 2002:a05:6000:192:: with SMTP id
 p18mr10610938wrx.218.1581783363449; 
 Sat, 15 Feb 2020 08:16:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj+7l1rgw3xDAlzv9WUiiMsr0WEM7lX9ZCD/FFnzJs4cYtMVSolk6GYqoQJdpfzWpU1SzzAw==
X-Received: by 2002:a05:6000:192:: with SMTP id
 p18mr10610917wrx.218.1581783363170; 
 Sat, 15 Feb 2020 08:16:03 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id w26sm11855872wmi.8.2020.02.15.08.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 08:16:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 2/3] hw/display/qxl: Remove unneeded variable assignment
Date: Sat, 15 Feb 2020 17:15:56 +0100
Message-Id: <20200215161557.4077-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215161557.4077-1-philmd@redhat.com>
References: <20200215161557.4077-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: 41haCuugOeSm6jfZMYwF0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Sat, 15 Feb 2020 16:16:09 -0000

Fix warning reported by Clang static code analyzer:

  hw/display/qxl.c:1634:14: warning: Value stored to 'orig_io_port' during =
its initialization is never read
      uint32_t orig_io_port =3D io_port;
               ^~~~~~~~~~~~   ~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 64884da708..21a43a1d5e 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1631,7 +1631,7 @@ static void ioport_write(void *opaque, hwaddr addr,
     PCIQXLDevice *d =3D opaque;
     uint32_t io_port =3D addr;
     qxl_async_io async =3D QXL_SYNC;
-    uint32_t orig_io_port =3D io_port;
+    uint32_t orig_io_port;
=20
     if (d->guest_bug && io_port !=3D QXL_IO_RESET) {
         return;
--=20
2.21.1


