Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAy2-0005eu-Fi
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxy-0005aX-6A
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxx-0007ot-IK
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:06 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxv-0007n1-K6; Wed, 30 Aug 2017 17:56:03 -0400
Received: by mail-qt0-x241.google.com with SMTP id v20so854551qtg.1;
	Wed, 30 Aug 2017 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xhSpPirtYleI+8Ern6rvlbLecOR7sVVW0JIKFHAFmXI=;
	b=I/8NYWVwvEDKuB6dFenhrzO3521nP3tjIz7SShfNRHCl+HsMt2iNwbNlOWCQQYNYqp
	0Gf/dNPgwW28CaoC0PGDml2nF0nvHKU4yDS+uCiDbyG/bZfutCPDxq+1tm/53k7yM6Dv
	/CHngMtG+Ffidt53qvaeVWQxwdxuVKL2FGXEYIuFJOh2EFqm6sUXHUFavJ6WVCIQHyUN
	cqOKltM7gnlyHVuF539nPByyyswMGCD/ofOvEuJ57a6gwoGwV+dmbPG13KcgbbDIU7rw
	vf9RCaIKRpOc1aRmATSxVpmMl+AB2Ad8f7XTYLpp+qViE6/7dPq5gRAlbak7UFQMxODs
	+byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xhSpPirtYleI+8Ern6rvlbLecOR7sVVW0JIKFHAFmXI=;
	b=cxV/JLU7d2xtd3CQyAB2uzqkxJ6EDIzCHCDbhYSDDQGdd7XdEJPsNQ/Txqfj8SzZbf
	zf8zf5wUozQrkJNA4nBjS9tFECFkao+uMhzXknuFZFcqZ1JfWfQ9oWAPC+86MBwqbwls
	i4bazMgVdu+uGQDT+Ramb+rIFIK6XVXn01JgjIFCgbyojNkIyWfIxLiqdkQ8BbMFXUAk
	NR94ClVbyhsZgkdXO00jt7LayCtKjQ1OUlHvAnoQxbzTPlR+/elwkDFlu//mKDjmJsbu
	9xIB2/UP2FG4gE+J32vgQAwwnegrToXWOBlC6evqWNOyBnjui47K9gGhM0HgBbHIRRIC
	eYyg==
X-Gm-Message-State: AHYfb5h8Sb0TMdCLEte/4bgfS+y3nv+d5GfZDgseTmgcIlY947uyRZcX
	883uxrA9oMyELD81b+15mg==
X-Received: by 10.237.33.1 with SMTP id 1mr4358349qtc.225.1504130163100;
	Wed, 30 Aug 2017 14:56:03 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:15 -0300
Message-Id: <20170830215523.25278-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 09/17] MAINTAINERS: add missing PCI entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:09 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd5e2c2b6b..bbe1191883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,8 @@ F: include/hw/pci/*
 F: hw/misc/pci-testdev.c
 F: hw/pci/*
 F: hw/pci-bridge/*
+F: docs/pci*
+F: docs/specs/*pci*
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.14.1


