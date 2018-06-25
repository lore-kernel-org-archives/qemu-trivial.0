Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQro-0002jJ-0N
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrh-0002cG-8V
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrg-0008Kl-9M
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:05 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:43591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrd-0008IA-Tk; Mon, 25 Jun 2018 08:45:01 -0400
Received: by mail-qk0-x235.google.com with SMTP id j124-v6so549769qka.10;
	Mon, 25 Jun 2018 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7XIA3npzlSEppAfPoDyv0y5tj3tPy6oCOhXRWiwn4gE=;
	b=IwqJOb+tWPHZyPWhAxL0X2sPq+yXzsoXeLjTc6DzZnJUCJyI2Oaybb2PMnWsLRTiSU
	MfJUJMjcfibxWKZP03l4gAKGHQEb37Uf1bj4vXfZEVAjIQxCS9FR0g8AOqCQ5VhWxZmU
	U0RfR11F9Mto6HehoquHaqo9l3TgucYXhC789G2aezQ1uFUl4IfDw7ZxAnSAaHWp7LO8
	KODuIoyK85uuBCF4SMZ2jkR7TkSZJqXOOONHlBq6iM1QrHW5s4j0uj9syVjqS3qVV85B
	0RhUoWfmkT0+4jPaAFRavrdfsMH9iFWz/kX1ra+ewSde/VY1PBWc0W8MIkzp0E7e7blZ
	rP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7XIA3npzlSEppAfPoDyv0y5tj3tPy6oCOhXRWiwn4gE=;
	b=Hd2EOMD9aTohsJWfXXh+ZkzKyD+pGlUTSjw9jTL91T3lEDWrPVKw3V7QIhlV99QCzY
	F0ILTTtRg8z8wIbSmt4VzeA6+4/HavJJa17RqdOY8iAXrXxhkTNPD5p8lPa7S0xsaX2G
	GKULAkbiXgXJptjgV8TINrCej+wR8QW7ywO55e0Od/ySY6AJIBafHN0ec1tnMFAAWehd
	ZE1I0lM0Yp2OO62PqlPOLutiILUtmYx4eY0ndjNy3xXqEHdEmQSFHobKMGCB5AoBfDqS
	jv1YrQISRt24PA4D7xXW7V/iRduRMwU5z2AVyF1N9fORfegUA5rRsQr6h0Bs5LEv99lL
	vT0Q==
X-Gm-Message-State: APt69E0v+UYFjx9PY/VoDvNg6xnJOKjZnkBNiA0tLarKQZq4pj7BXuRP
	bwTWKGxdGZEZ28k/sXl/RC4=
X-Google-Smtp-Source: ADUXVKKTiQMLJY5jv2E+Iygw9Kj5i4iSEoGJ8NbYdkBIjleebpZF668BneOgvR5JYuySaRscQtubWQ==
X-Received: by 2002:ae9:e113:: with SMTP id
	g19-v6mr10685961qkm.9.1529930701432; 
	Mon, 25 Jun 2018 05:45:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 25 Jun 2018 09:42:31 -0300
Message-Id: <20180625124238.25339-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v5 39/46] hw/rdma: Use the IEC binary prefix
 definitions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 12:45:11 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
---
 hw/rdma/vmw/pvrdma.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index 0b46dc5a9b..81e0e0e99c 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -16,6 +16,7 @@
 #ifndef PVRDMA_PVRDMA_H
 #define PVRDMA_PVRDMA_H
 
+#include "qemu/units.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msix.h"
 
@@ -30,7 +31,7 @@
 #define RDMA_MSIX_BAR_IDX    0
 #define RDMA_REG_BAR_IDX     1
 #define RDMA_UAR_BAR_IDX     2
-#define RDMA_BAR0_MSIX_SIZE  (16 * 1024)
+#define RDMA_BAR0_MSIX_SIZE  (16 * KiB)
 #define RDMA_BAR1_REGS_SIZE  64
 #define RDMA_BAR2_UAR_SIZE   (0x1000 * MAX_UCS) /* each uc gets page */
 
-- 
2.18.0


