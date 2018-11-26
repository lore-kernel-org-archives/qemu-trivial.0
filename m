Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDf7-00054N-2q
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 04:58:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRDf3-00051q-TP
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:58:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRDf2-00011F-IW
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:58:37 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gRDeu-0000sI-W2; Mon, 26 Nov 2018 04:58:29 -0500
Received: by mail-pg1-x543.google.com with SMTP id v28so5921308pgk.10;
	Mon, 26 Nov 2018 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VQ8OTNSoXDmxEklPvV1tDsI1tIrwe3eW3BQGrQfTLr8=;
	b=L3BmBLQmskK/esp8yc9/iqu1datifQcQ3tPcCx7rNSDomilmfb9D5pLDnt9ZOcrcjE
	eP9FHJsxr/JqbW0mfBESSFyv5Axz7j82rAhehpugK5Y3M/6sWyQ1ZVtxpD5BHHG/pMok
	l9NpvDqZP1cT4dz2POm9VZXPtDfJbb9quL7DuFUSBkbv6iZJ7A6CQ86q15Fulpc/n1t2
	pH7yuydqU2tnctrdZgyYa+7eKNYkb3dNQ2pBU+XRswHe3ur6pC81B+E8LYM8zUWJD8BA
	GNH4JCttIRvmLRg3wRBmsULH5IYvPS7FPDonrTKLNhOrkTmQmGvNmYkQTW4XzmPy3eYZ
	LsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VQ8OTNSoXDmxEklPvV1tDsI1tIrwe3eW3BQGrQfTLr8=;
	b=HPBkdY6GhWdP1lsY2NQb6uZqcnak+KnO4de7fBRux7Q9O+DvcpEvEhDz9D9fzJmZQl
	T+UNIETbO61/WzvnBhpoBDq6Mys3Kfo+lsR8laNv1pC3VgZEWzDHtdkBsAD7CXrV00vy
	EIhLUefaZ4EtuWJN6lAvf+46fHmOIXT8lNcWxvffYrAFMoogA8Fm1ppFfOskqeKkMiYT
	SsXXVBCRs6jZoxZTLF/hiC7Rizlk1ISqnxrdMDbpuQQeEX/1hh95HL0zsw8Xncrj/jt1
	roaaroGhOQ+z7mZb6WTho+/mOV+JLNUfzCvKb/cEqMYhypoUFxgJhoJ6uzmpKETDc2gd
	7xRQ==
X-Gm-Message-State: AA+aEWYJVOSSbMMEl2GSJrAGb6UY9JpM2sOjUni3QFtFXeUBmO6slXBf
	pgYu4Om8TLDv1Q4SVjJ/GpY=
X-Google-Smtp-Source: AFSGD/UqLpC9VkNu9ftGFNSiIozyQ3GjHMQrisgvGyiiOSPjYslVaMmItRONGlMgVMDBvMWQs5ecAg==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr23933401pgf.33.1543226308225; 
	Mon, 26 Nov 2018 01:58:28 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id
	u137sm93805080pfc.140.2018.11.26.01.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 01:58:27 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Mon, 26 Nov 2018 01:58:23 -0800
Message-Id: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-trivial] [PATCH] target: hax: fix a typo
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
X-List-Received-Date: Mon, 26 Nov 2018 09:58:39 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 502ce6f0af..464744a406 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     }
 
     /*
-     * 1. The hax_tunnel is also destroied when vcpu destroy
+     * 1. The hax_tunnel is also destroyed when vcpu destroy
      * 2. close fd will cause hax module vcpu be cleaned
      */
     hax_close_fd(vcpu->fd);
-- 
2.11.0


