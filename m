Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRVgq-0007je-9Z
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 00:13:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRVgn-0007iH-S1
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 00:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRVgn-00031b-9v
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 00:13:37 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gRVgj-00030Y-DA; Tue, 27 Nov 2018 00:13:33 -0500
Received: by mail-pl1-x643.google.com with SMTP id 101so8730389pld.6;
	Mon, 26 Nov 2018 21:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aM0XF5r65GOnaL9RjZzMneTD8DRO4FLz+VXX+0XxoR0=;
	b=EaEkuBPGPWnsF5Rc0oxuNxVkwThw1QNY5Covhst9qcEslbIjI85ix7QARgwfQVRdmd
	hl24WePy9cil80nfH9ELam9xzioJ4v38WHUeKmxf+Xr/rCtHGSRV8CWaJoyZqQhXi3EZ
	FzZnfCHBHmsEHIKX4yr+1egrXmiC2GPk9R50mFNwewysJCBj+UC90cNFa3x51dad8F8/
	gGZ+QouItSCsIi8JI11V02oXAqaR2MHLkmCEYODx67RC28pJ/NQkmc4nXfzwWuOIV6z5
	yRJMcQgqDl59x0pJhFKaywMuEbpXIIuREaWuQjOomzQOASQ/rDwEuwCn5wrTGEJzkP6X
	OGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aM0XF5r65GOnaL9RjZzMneTD8DRO4FLz+VXX+0XxoR0=;
	b=X33cvH73LXT+1VYMxCbPSSoJ8p0PmVepHHyttDGJ+aQV0Wm01Kni9ZxYcZXMC7ifE/
	z+9/YeTeJWK0OXNoN5u3egfryF0/V13IBkGSS8nJqEBkbubh6GfH+F8Olbf/NpgMqeY6
	znAcxF9W7RxkoGW9WCnJKBfWuA+8nN3L4tYl/j3phRVZnd/r9Qqj8E/S2qsvWx1jIrUT
	WeHMtLQT3A/eupCtBKCu5dbt3zfmDk1bnbWQvYrIlNPJHMv4k5Z4wgHY7OrPQ9r6Ejpv
	2ohXHNXOSIs94f7hNtNrJgzErpVOCLSWkhhTBEEj/0sHqOZ+WUSbmXsqnwKK8HHejwWN
	ezAQ==
X-Gm-Message-State: AA+aEWbypEN6QOF545myCXH6TAkebfg/kTONzNfVDOsD+0hmpieIliT6
	yXwH42GTP/cU46m+ufvG/yM=
X-Google-Smtp-Source: AFSGD/VlNNm7T7hwVJmNt7kj7ZVXKVTR36kymrasV4Z2KSEWu3F9xzUxUqHcwQfoN9nWmwqwXRhApA==
X-Received: by 2002:a17:902:6848:: with SMTP id
	f8mr30339921pln.300.1543295612353; 
	Mon, 26 Nov 2018 21:13:32 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id z7sm4197689pga.6.2018.11.26.21.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 21:13:31 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, alex.bennee@linaro.org, philmd@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Mon, 26 Nov 2018 21:13:25 -0800
Message-Id: <1543295605-2709-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-trivial] [PATCH] target: hax: fix errors in comment
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
X-List-Received-Date: Tue, 27 Nov 2018 05:13:38 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 502ce6f0af..70213ebcf5 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     }
 
     /*
-     * 1. The hax_tunnel is also destroied when vcpu destroy
+     * 1. The hax_tunnel is also destroyed when vcpu is destroy
      * 2. close fd will cause hax module vcpu be cleaned
      */
     hax_close_fd(vcpu->fd);
-- 
2.11.0


