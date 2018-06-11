Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBQr-0004eA-GT
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:15:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQo-0004bB-DJ
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQn-0002Qn-IM
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:38 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:37379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQj-0002Mq-IY; Sun, 10 Jun 2018 21:15:33 -0400
Received: by mail-qt0-x22f.google.com with SMTP id a18-v6so1596493qtj.4;
	Sun, 10 Jun 2018 18:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OY5JFQeXDklH0l3HCUGFwlY2gZBTML+vrHZuRljLJ/A=;
	b=BBuAEZM1Oh76e0FvPWDB4Ul9CNBWw+YbtNWsp7WoPWGWrf5IXL+ivHqoHGnNLIYldF
	TE0MzAGwrdvdAD/43AA18ZlbCtyz0KGAGQE2q3ASA29WU66RHanO3tZlnn9S/zX7WYPJ
	vfLGRd4HVIN+KIdkM2rJE266JQwhrtjGgO2KchMaddPKeKMJukhCB8TR8M+P6VenRLYk
	xiowAR5ptukVRj5ANZPMtShRoOauTMaoVpzMnJYLHzcds728JBCEiwuD7N8v6NnfvzyC
	2Nl2F6JwXe7vRedn+1HQPUFz98Ei71r7Uu28hk09iOdtvlSjWQTx0teMvZr1rIDXdOyT
	aLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OY5JFQeXDklH0l3HCUGFwlY2gZBTML+vrHZuRljLJ/A=;
	b=s4+emE0wlFDS/pWFanLKshvGfL0HHBzTcMoGaBs4iM1wUOmUgrRMeFrUg60t3YPFuR
	BDAnubwNGs06Am6cRJr/s5YAogeyIbyUukhigsBOKr0ekgdKX9S5T/WK8B+j16NFa8uX
	d2vhy9OHMw8Jqs0dv6E2v/9lT6e9Pt7b3O2GjYn5Qj26ibWhcAQFddlK35zpS7egFMI1
	t/9nN/RB3ZidxxAA+YKl3toszt/aYCTJbVy3IL2vxBv9MMAkLHo17AE73WymhoLIkJPx
	J912BhoynwM5WdfEycv68j3r+m5Zo5ny9FZbtY01HC+oPKrUlJOv9uqXJbi1knBbZkOF
	cu3A==
X-Gm-Message-State: APt69E3mJFHZEOqebUb8mB6+RMdh9yCqJ+s+IiT4qST1evD4OMSzfZKt
	lDqfSp2Zd0WqEjqnLlWUxuU=
X-Google-Smtp-Source: ADUXVKKB/QDqcB2+e365e2J6NnPbOE80Ht7joxhaBOQ3LnydPfeDfnZ7VhvrYiUn2Cm/rieBMUGmgw==
X-Received: by 2002:ac8:26c3:: with SMTP id
	3-v6mr14367417qtp.151.1528679733150; 
	Sun, 10 Jun 2018 18:15:33 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Sun, 10 Jun 2018 22:14:24 -0300
Message-Id: <20180611011501.10235-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH v4 03/40] x86/cpu: Use definitions from
 "qemu/units.h"
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:39 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 94260412e2..56c63615fe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/cutils.h"
 
 #include "cpu.h"
@@ -64,9 +65,6 @@ struct CPUID2CacheDescriptorInfo {
     int associativity;
 };
 
-#define KiB 1024
-#define MiB (1024 * 1024)
-
 /*
  * Known CPUID 2 cache descriptors.
  * From Intel SDM Volume 2A, CPUID instruction
-- 
2.17.1


