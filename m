Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobly-0000bq-Qr
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX52-0003Zf-Fh
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX51-000587-CB
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:20 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:44335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4z-00055D-0m; Mon, 06 Jan 2020 13:26:17 -0500
Received: by mail-qk1-x741.google.com with SMTP id w127so40269614qkb.11;
 Mon, 06 Jan 2020 10:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5WuUZRHCzkwWxWtzKtgDX4yjtDTeyRFxW7kIUanwn6c=;
 b=ZdeMQ8UHGy9hLj8PGaHr7+C9CS/OBtbby1PzCL5s2mgv39PtzN33JHp18JaIperBym
 x2TCpieDr4KiqMD93kIaMu1kqKk7bkRvpylCn9mEJNuVKi7Ifno1sPwJX7qMQMvvapKr
 RZtiKkB3HatUEa60q8wMRIoaPhPcCzrNrLxZ1sDMEJuRx50wP/YmXUQhyUV4Sj1xo40P
 bKiFd0QYkWn3t8Dv4Hq/9y7SD9FtSyEz6sLmLeWgO0dzop/pZ6UIFVEzTNt5yJBLcBto
 VjX+ttm5VJvevbNX7j6JH5lLnrmdXwql9lvSC+FAjSqrwLkEBjQL3knp7ia4kaYfXteF
 edEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WuUZRHCzkwWxWtzKtgDX4yjtDTeyRFxW7kIUanwn6c=;
 b=OzR02z0T9SGFMXJvwkManZKqzvDHuKWtkKPJtUCFHp/UoKyBwUaDiEAxxryELENYD5
 KVHzHbUhKR6NwJ26i5oaa3/SCCx5nldklVnlrPQvgWxVxdlhpp+ArOAf0qMVOrsrXP1o
 dsyz+PsV09JgLd8Z7OUAYgO31vt1EzsFUYS5XJ4jPg7sYZzLmK6o0z8/1pYpOceOr6Lk
 mPqi5OYZ0cu+duaoeRJoQcDljP48giCs0dbbZbP9Y1YMRDNFMLqY2duD89/Adpp5vW34
 FBLPdQVY+fOLnvTXjYv0L+6s7wFUXMoDdDQ7qSgiNZfuolVv2QjhYkHP3JxacgFRDOFS
 Dagw==
X-Gm-Message-State: APjAAAXJ9lOSt5PaFmo9g2eDExYrAJQKPRmBFvLunLptHUDInFjiqdwt
 gmAMvGYSs5S1m0GOdcGizOrvuu5J
X-Google-Smtp-Source: APXvYqxCy2hs/oidkSAxrapt51pghQzPFsLbYQUe1RGrC8YZUTyrg7kcIvafxKXgzgeM0igPdlRzdg==
X-Received: by 2002:a37:c244:: with SMTP id j4mr82727323qkm.433.1578335176481; 
 Mon, 06 Jan 2020 10:26:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:26:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v1 47/59] pvrdma_main.c: remove unneeded labels
Date: Mon,  6 Jan 2020 15:24:13 -0300
Message-Id: <20200106182425.20312-48-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
X-List-Received-Date: Mon, 06 Jan 2020 18:26:22 -0000

Label 'out' from init_dev_ring() and load_dsr() can be
replaced by 'return' with the adequate value.

CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 6f0fc405c7..fcaf829e30 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -94,8 +94,7 @@ static int init_dev_ring(PvrdmaRing *ring, struct pvrdma_ring **ring_state,
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
-        rc = -ENOMEM;
-        goto out;
+        return -ENOMEM;
     }
     tbl = rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
     if (!tbl) {
@@ -134,7 +133,6 @@ out_free_tbl:
 out_free_dir:
     rdma_pci_dma_unmap(pci_dev, dir, TARGET_PAGE_SIZE);
 
-out:
     return rc;
 }
 
@@ -177,8 +175,7 @@ static int load_dsr(PVRDMADev *dev)
                               sizeof(struct pvrdma_device_shared_region));
     if (!dev->dsr_info.dsr) {
         rdma_error_report("Failed to map to DSR");
-        rc = -ENOMEM;
-        goto out;
+        return -ENOMEM;
     }
 
     /* Shortcuts */
@@ -221,7 +218,7 @@ static int load_dsr(PVRDMADev *dev)
         goto out_free_rsp;
     }
 
-    goto out;
+    return rc;
 
 out_free_rsp:
     rdma_pci_dma_unmap(pci_dev, dsr_info->rsp, sizeof(union pvrdma_cmd_resp));
@@ -234,7 +231,6 @@ out_free_dsr:
                        sizeof(struct pvrdma_device_shared_region));
     dsr_info->dsr = NULL;
 
-out:
     return rc;
 }
 
-- 
2.24.1


