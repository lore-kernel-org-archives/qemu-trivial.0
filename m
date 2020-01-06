Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobmD-0000tL-5h
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX57-0003iQ-Me
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX56-0005CI-L2
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:25 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:44338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX54-0005AX-I5; Mon, 06 Jan 2020 13:26:22 -0500
Received: by mail-qk1-x743.google.com with SMTP id w127so40269883qkb.11;
 Mon, 06 Jan 2020 10:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JP7yRAv3JFqhY7+OM2TlYk8mkn5EeN/uOmT4fxUErEA=;
 b=Vr1DbhI/ySi+nSz1J3b1Vz6TDDueqfUI5kWiNnFHtX+b77uUHqpAd02mmjG30yN1AQ
 ZxRuPfiL8EN6Uwr1kZYQU76VHMFnAlR07gdPcK91D9sXGRjgT3x292tpMES0e7iwbXYs
 wmkuamyCyCBvRSxASDKoJ+4V0wH1dtYxVE14TzYhWZzhGqPyG4JeprB32MXbULns40Ck
 xhHINx2ofieHYO9vLJGW1D0iBdOkJLHi2j/tqJqEKUb/BoIBeS8jBRFVfGcKKZvARmQG
 SCqAgUuEzNlnRT0PX7kv7tAWXVlMr7hc8lNNEpddZ36aK07TLvKXr+Dombf7XSDMz6Du
 bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JP7yRAv3JFqhY7+OM2TlYk8mkn5EeN/uOmT4fxUErEA=;
 b=PT2WCj1aoX89TwUmDZHoTp+nGad+IcU4GE5TpJ6g/RJmO58e1kUtbxHO/LAuROSvnL
 WOhJmpfFl/fdbfemyKio75+HR9r/X7hB/EfI2xbLWXUxWv6CUIMDiUhap77kZkANu7zZ
 nXFA0DXDlkUpl6RGbD+4iIjDtLy2U/yoowlOeBuQr+7ilAHa46Av+GmMGZBMEUOF+LM0
 hEppsoN81583TOqyZuoYYNNJS3uRrYQmIe2NGXnXPZqXlC7g1dLXCdVg8PAlU4h8wdu5
 +6v7wFphUQBfHxB24nL367BAW2MoSiVu36fxVYNgaeFaP3k1hFfMS3mYdmUZRap/XyyT
 dnVQ==
X-Gm-Message-State: APjAAAUOv/G4BY7wvKR6RzwQMpGRIDkqWrQH9q2uUjYrioVdmr+25mO5
 ExAEMhstZat96krQ5txBbM2ZBZ2t
X-Google-Smtp-Source: APXvYqy7eHx3DNdyUi8FeIpvryybTYEiqNapfd+kmM0ClNOuRVHCPX1NE2URNksuTXzckQsorG3jZA==
X-Received: by 2002:a05:620a:b04:: with SMTP id
 t4mr86335470qkg.7.1578335181943; 
 Mon, 06 Jan 2020 10:26:21 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:26:21 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v1 50/59] rdma/rdma_backend.c: remove unneeded label in
 rdma_backend_init()
Date: Mon,  6 Jan 2020 15:24:16 -0300
Message-Id: <20200106182425.20312-51-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
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
X-List-Received-Date: Mon, 06 Jan 2020 18:26:28 -0000

'out' label can be replaced by 'return -EIO' in the single
goto jump.

CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/rdma/rdma_backend.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index c346407cd3..20c4c9fc3a 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -1335,8 +1335,7 @@ int rdma_backend_init(RdmaBackendDev *backend_dev, PCIDevice *pdev,
     if (!backend_dev->context) {
         rdma_error_report("Failed to open IB device %s",
                           ibv_get_device_name(backend_dev->ib_dev));
-        ret = -EIO;
-        goto out;
+        return -EIO;
     }
 
     backend_dev->channel = ibv_create_comp_channel(backend_dev->context);
@@ -1377,7 +1376,6 @@ out_close_device:
 out_free_dev_list:
     ibv_free_device_list(dev_list);
 
-out:
     return ret;
 }
 
-- 
2.24.1


