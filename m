Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobmA-0000ne-0p
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX54-0003d2-Fk
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX53-00059d-CS
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:26:22 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:39322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX51-00057I-53; Mon, 06 Jan 2020 13:26:19 -0500
Received: by mail-qk1-x743.google.com with SMTP id c16so40279922qko.6;
 Mon, 06 Jan 2020 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bs7x1DdZtpqQKwEZE8GS4y2GJ9iZwDpJNAVLOudv4rU=;
 b=N7CNeotvXctrkrAGky6hUb3El8MgPub51aUw6VZiMIVZL9tyQ7kP52weIeQagDaSVv
 bD6qcCwLE1gJpKw0hKxyV8P/NyYX5PmC49IIGRfzEUpTWcZ32GsXhJHXbiM89WBF+oxJ
 QnGv5K6lPy//8DEBPf0mb4YggELTgr3nAUBojHGjmNfUzYYESzzsMwpE95ohNoIDAxVq
 sC9v3rQgsBBPv2CAp/r2oOZU4nDrtWuGigu7TOgEoYxGox794Zya2DhVwibpXC563vmj
 6rRgdw7vpGFwDaboG+LmNNSP1Jh+cSrG9FoHVlvCAQdFjxqoT/P5DwnVUemFfJsPNccO
 LdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bs7x1DdZtpqQKwEZE8GS4y2GJ9iZwDpJNAVLOudv4rU=;
 b=Mdq14J1FB1T/m3YPTw63A0HwT11L4gUOQW8YDIK5Oom1Yp32necOkOToU9qrbyUYus
 8GIaANr9M5LPwWigvLqwGReVRdWRvfUW4t9sUasXW59/CsmGx7maHNU/MZLQ163o8IIN
 V6H1l4JIEgYRfw/7g4hCTxjuhnpYBkSKWmuySk15hY9gptPfuw7hW7b01gtEe1i7brea
 UNETHmcCcXKhm4vEps13MFVRS8LV5BvROvQZhZw9ZlqA6GmX8ZM8JStAejVlcxDmgltQ
 +5f2Ls9KDSOPGNQ2HL7ulImxyEARn7oEYTsJnqgrtZ+eKXZi4d/ol9wATcFUWvzcvwq/
 TsFw==
X-Gm-Message-State: APjAAAXjwdf/dA7ebJ8Kf/59AgDTzOVxL+wHeSJhDgT3/4GvuCFNfvpX
 eMZATHqXhwEwBR9nhRjKn21Mj4eT
X-Google-Smtp-Source: APXvYqwp57AWDJiUhXtstFk6McUIumDhjnvSPpEl2+ee+XmFqCQ7VRFp/LZ+b+CsrS76H3AIMpI7wg==
X-Received: by 2002:a37:6346:: with SMTP id x67mr83721219qkb.476.1578335178367; 
 Mon, 06 Jan 2020 10:26:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:26:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v1 48/59] pvrdma_dev_ring.c: remove unneeded label in
 pvrdma_ring_init()
Date: Mon,  6 Jan 2020 15:24:14 -0300
Message-Id: <20200106182425.20312-49-danielhb413@gmail.com>
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
X-List-Received-Date: Mon, 06 Jan 2020 18:26:24 -0000

'out' label can be replaced by 'return' with the right return
value. Since the 'rc' var was being used just to set -ENOMEM
in a single error condition, get rid of the var and set
the return value directly in the 'return' call.

CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/rdma/vmw/pvrdma_dev_ring.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
index d7bc7f5ccc..c2ecce3b41 100644
--- a/hw/rdma/vmw/pvrdma_dev_ring.c
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
@@ -28,7 +28,6 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
                      size_t elem_sz, dma_addr_t *tbl, uint32_t npages)
 {
     int i;
-    int rc = 0;
 
     strncpy(ring->name, name, MAX_RING_NAME_SZ);
     ring->name[MAX_RING_NAME_SZ - 1] = 0;
@@ -51,14 +50,13 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
 
         ring->pages[i] = rdma_pci_dma_map(dev, tbl[i], TARGET_PAGE_SIZE);
         if (!ring->pages[i]) {
-            rc = -ENOMEM;
             rdma_error_report("Failed to map to page %d in ring %s", i, name);
             goto out_free;
         }
         memset(ring->pages[i], 0, TARGET_PAGE_SIZE);
     }
 
-    goto out;
+    return 0;
 
 out_free:
     while (i--) {
@@ -66,8 +64,7 @@ out_free:
     }
     g_free(ring->pages);
 
-out:
-    return rc;
+    return -ENOMEM;
 }
 
 void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
-- 
2.24.1


