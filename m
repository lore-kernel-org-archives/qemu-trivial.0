Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNEXw-00017m-CE
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 05:06:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gNEXp-00011H-HB
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 05:06:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gNEXm-0002go-Av
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 05:06:41 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gNEXk-0002f3-WD; Thu, 15 Nov 2018 05:06:37 -0500
Received: by mail-pf1-x443.google.com with SMTP id x2-v6so9449466pfm.7;
	Thu, 15 Nov 2018 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DTLWnuQ/ytCTRtxJIJZzfmLL4PM3jlJgLsB1h9pzVXQ=;
	b=XcoVd1aObQSSNN8+x9LZyZWhEK8rfhR8MrT2QSx9TWNH7n2XrfEjO4GJ0DMOJ+PWXX
	D5bIpKMSK0323U3DEkpNg+61C2vimkLmwkVGmDsaTdGjL2QiKlFny1CCOJWMD/qK/Ool
	cDkCEp1Bpxc8jDfiY1kUuphkD20JFZAmun5s+MRgzH2VGl/rNbswUrQGVwlibLLV3zgL
	CVZKgEfuy/d7H6wLBdJ0qMXKftuj+bd2rDnDSHOySIpmhoLlOav+p/wrZHEeqHK3ci7U
	PlXmSRr97Axf9wXmZ+YhC+JNTHwcrAOfx4zl2uRQ0OFy0kYqnZML8Wvpi6+KpKdM9bNI
	MGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DTLWnuQ/ytCTRtxJIJZzfmLL4PM3jlJgLsB1h9pzVXQ=;
	b=fT5qgXVinKTGMZSI6pK+TFxttaTPMvxdCopbg6UrxLzi3Qc3X/6HEj5WjsG1dHtRs9
	7+GmAOvkrqWPK6z8OUrTvRiTqu39gJLONe/jga9LjleAaPvZnLHCtVh/CYqyuUs0JreR
	k5OeVsO2MMOmY3YNSDTapRjx57wikiyRRWWSnKmecjrkN0n7uu2x9jUrjcURlLocOMfz
	XoaYZqVjYdSyp3Zluo6zy31KkoonnIwTcxXKSaPDp9JQ9bF74Y41eGoEJrGUMi0ZmB+k
	UsA6cNkqPMcM36j/vCI0my9kiu2xa5trbKAsqFSWhR1nq/CZbkgxNjsXCdbokgUN7mAH
	pNlA==
X-Gm-Message-State: AGRZ1gKqbSscLQ2ALSPcaYEDU30jJOc/hGjsj1oTZJA/dVtUm7jwwlyo
	V3uMd/MT5nXBjSdsjeyVd0A=
X-Google-Smtp-Source: AJdET5czVY2Eequ+ROlTZb21Pi8YUPrDNLks1xZJIaZZj6m+wqdOxHEzch7bdnhtqyrT1XiCHYm6qQ==
X-Received: by 2002:a63:fc49:: with SMTP id r9mr5069809pgk.209.1542276392543; 
	Thu, 15 Nov 2018 02:06:32 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id
	128-v6sm28912376pfd.64.2018.11.15.02.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 02:06:31 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: pbonzini@redhat.com,
	laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Thu, 15 Nov 2018 02:06:25 -0800
Message-Id: <1542276385-7638-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-trivial] [PATCH] vl.c: remove outdated comment
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
X-List-Received-Date: Thu, 15 Nov 2018 10:06:47 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 vl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index fa25d1ae2d..ae63018a1d 100644
--- a/vl.c
+++ b/vl.c
@@ -1522,9 +1522,6 @@ static int machine_help_func(QemuOpts *opts, MachineState *machine)
     return 1;
 }
 
-/***********************************************************/
-/* main execution loop */
-
 struct vm_change_state_entry {
     VMChangeStateHandler *cb;
     void *opaque;
-- 
2.11.0


