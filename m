Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e89-0001a0-Es
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e88-0001YG-2o
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e86-0001Xs-5u
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:31 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49457
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e84-0001XK-Cs
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ci83psJipRLmMM102aFH9DJiTrhuqoBAGmTaxPcC9V0=;
 b=YplGmz8kQImkHexFY+P3QjXD2FqsvrQ5RMzgi3DJR7hCDdpSBnQb5ThFdaqCreBVNmbl/U
 3xe4V1F28BKZCN+bfbJD7ytcWgAEAuHiUZqZ7irArvUnW3CbDmyxs6K/Lw9bUxaWG6Ux+J
 HroJ4YRIKTCfHHt7YHW2CkUb8Gnbdyo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZM3h4PHfNImkBPx50PNsfQ-1; Fri, 28 Feb 2020 06:48:24 -0500
X-MC-Unique: ZM3h4PHfNImkBPx50PNsfQ-1
Received: by mail-wm1-f71.google.com with SMTP id f9so610939wmb.2
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WbQgs/ipNL+I36ywVUaG4Y7AH+d71TJ/LBgfF4qcL6Y=;
 b=J9vawtMy/Qx8Duh4rX2sRrkgYfdkvq4VlmgvjRt8fkoG/JLptpWzFo/xQpGqX5oVXF
 YOSFqkAbR/ZWzSb5mATthuhSIGCQi7XjT4lMWo8GEukgR9TFrNyZwu1VB9PKoqe4CmIn
 nMvN8aBK69peqqRYNnC/nM1lzp5M30a0DUmJTxjKqg4pOws+0a4743xPA8lTdCqodL5A
 Dx0BYmzrpVumb71tBVbPOzieGWzDXrEhF0jKneAx2OfKR+sVzTWSYxGIJSlQKKA+rWde
 5v0XgzQHL6jT2UHPoWNBnXmNGemRRQCUSHCcatCQsORsSc/guugwhCFnv19TC2Wh8ci0
 m99A==
X-Gm-Message-State: APjAAAWmHvaCp6dQ28oOlEntqslRM8zNXZ4cwLDCadgywz4QiAYhyyde
 BURAT3O5o3SHWDA8eHkt1Zq7UYp/ysCYTpfQptgeGVq3kjW+Gb90gTj+pwrS0JAOsCmdi7lzu19
 qgwTACIhKFBjkUng/SA==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr4227975wma.184.1582890503681; 
 Fri, 28 Feb 2020 03:48:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQABjkSoRhQ7mYf4Fp+XHNAFXX1MGC0FklN6t+jzS2XcS2Mg7+aoV7AAxB6mPPvyteIIs53w==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr4227957wma.184.1582890503469; 
 Fri, 28 Feb 2020 03:48:23 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id a7sm1736226wmj.12.2020.02.28.03.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 12/18] hw/pci-host/q35: Include "qemu/range.h"
Date: Fri, 28 Feb 2020 12:46:43 +0100
Message-Id: <20200228114649.12818-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228114649.12818-1-philmd@redhat.com>
References: <20200228114649.12818-1-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:48:33 -0000

The MCHPCIState structure uses the Range type which is declared in
"qemu/range.h". Include it.

This fixes (when modifying unrelated headers):

  In file included from hw/pci-host/q35.c:32:
  include/hw/pci-host/q35.h:57:11: error: field has incomplete type 'Range'=
 (aka 'struct Range')
      Range pci_hole;
            ^
  include/qemu/typedefs.h:116:16: note: forward declaration of 'struct Rang=
e'
  typedef struct Range Range;
                 ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/pci-host/q35.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 976fbae599..47086c645e 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -33,6 +33,7 @@
 #include "hw/pci-host/pam.h"
 #include "hw/i386/intel_iommu.h"
 #include "qemu/units.h"
+#include "qemu/range.h"
=20
 #define TYPE_Q35_HOST_DEVICE "q35-pcihost"
 #define Q35_HOST_DEVICE(obj) \
--=20
2.21.1


