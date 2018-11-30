Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gSfV1-0004pI-Kb
	for mharc-qemu-trivial@gnu.org; Fri, 30 Nov 2018 04:54:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gSfUz-0004ml-1J
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 04:54:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gSfUx-0005AG-1E
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 04:54:12 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gSfUr-00056m-Ik; Fri, 30 Nov 2018 04:54:05 -0500
Received: by mail-pl1-x641.google.com with SMTP id t13so2539199ply.13;
	Fri, 30 Nov 2018 01:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GQIWcweVx3gLLdOHvKSpGH9I6m3makYE2yanlXuHnIg=;
	b=NC0U/u0aHrtiEBhvK7+GuxleBlZaQPJc42Udy4IeaVfvLRD1JADPnT9ur4/ZWPIvvF
	2Ce+pwBmYfnMzGRpokB9iMk/+X//AMEG7P+thDmya/46iTPTiXtNsq5iEyNvfUw6I0kE
	03oiOoY9DhrgsR1YTTcgdyX6w1eGIdh0/o0xLlyzP/MOjOuFFfN5P8E7Hvn6B8BA6jSU
	KA+r4ER6J7ZFM0IBH7lIfS9S6YEOaIy94XLxUxNDC5f7Om+t43RgtCFufwKmB7zE68Hx
	atokvD2kDpauLrmpdWamISXpdmtAo1mZtkmPzSall9SjueT8sXmjGMbWdKyAzJb/HGtT
	R/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GQIWcweVx3gLLdOHvKSpGH9I6m3makYE2yanlXuHnIg=;
	b=N+p/dlqGDpakN1R37MSwwgE4w/NI3ybZTpMaSjwODc4UtMn6uxmnCOGInSCEpWZLPO
	hh0oTYj2QnKWHKA4JkJQtzPID/pniQX0udNrw5BDg8QGHq5SUNzSo9TM7xTFKifVB12p
	trvWRfKEqBuP9t0xzwWm6BZvj5e2RGXvcFQBh1X7DiYsqmwVTZadOy/9u7cVbjW0tteP
	bVn1jUI2gwkGtmQWIydIabO45qKWVom95EhrqSeRkjw0blC0Fh4A0CAIGG2a4iDLNrN6
	TDbhD7Fyh9JFU5UfqKZlAX06GuJtDRjpXiObK5WkKawvQhjHuloDMhJHD1xJhbeF5M1T
	vmig==
X-Gm-Message-State: AA+aEWbg0E+zVs6D+crIzKqeoiAExIylF5EIhJ3p8UsRrfChLdhw9+ao
	tyAlyCCAPcMlwXtE1+i44ro=
X-Google-Smtp-Source: AFSGD/Wti4/I1U4SEBUoKTj2R6e9SxgaNcPxS1KySIj6yx7BT/rrP83eC2UHA8l2NnqV7Eei+0E5ag==
X-Received: by 2002:a17:902:24d:: with SMTP id
	71mr4872918plc.225.1543571644465; 
	Fri, 30 Nov 2018 01:54:04 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id
	h128sm5442299pgc.15.2018.11.30.01.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 01:54:03 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: laurent@vivier.eu,
	philmd@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Fri, 30 Nov 2018 01:53:58 -0800
Message-Id: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-trivial] [PATCH] util: vfio-helpers: use ARRAY_SIZE in
 qemu_vfio_init_pci()
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
X-List-Received-Date: Fri, 30 Nov 2018 09:54:14 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 util/vfio-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index cccc9cd42e..342d4a2285 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -348,7 +348,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
         goto fail;
     }
 
-    for (i = 0; i < 6; i++) {
+    for (i = 0; i < ARRAY_SIZE(s->bar_region_info); i++) {
         ret = qemu_vfio_pci_init_bar(s, i, errp);
         if (ret) {
             goto fail;
-- 
2.11.0


