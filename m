Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNAn4-0005vC-T1
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 01:06:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gNAn3-0005rA-HC
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 01:06:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gNAmz-0006RI-Dq
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 01:06:09 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gNAmz-0006QG-7q; Thu, 15 Nov 2018 01:06:05 -0500
Received: by mail-pl1-x641.google.com with SMTP id a14so4364925plm.12;
	Wed, 14 Nov 2018 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CWojDYJUvJ8XEFjeY7pzP1OO623lhdNCJkshCPlHeKI=;
	b=QxdM/JDa6n4n8FP4JVMrgaipTqIMq+6VouxR39ruqlMd+cIpM+ssK1Sc5b5wq2iE/S
	rUW0RhbpD6tT2nAOvKlzy+hTbFHR91cxXwO7ARTlprqMb0bOqmU+Dhbsbdq44xVwEGgp
	Hspk6apx/CMb5hMhp9t3d3cI8pDqdyWdzkB9z6N9ZASwsV77a7jmfycGKTVGK/bx13z5
	3cNZMkXABry0cLr2IyaIjIlnPXCf8sbTp4/PMoOHRy2XTcNo9Rsoi/kzWRGnE5X7sUZt
	pUCSyI5WzmtLQ0lNA6hRftazwJFxTpw/YjN1fVUNVjC/RIrfv5XMY6gMsvs1owUii1zL
	wFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CWojDYJUvJ8XEFjeY7pzP1OO623lhdNCJkshCPlHeKI=;
	b=CNA7+hwUQnbp5S87PnRts3xHdOJ8+0ZGHdRCnfSlsb8rL2OS7auSFhbw2jnCE1PVyQ
	K1MZQby4H+jvM5SLqwzxxIOfAVvr4acgUGLxjRY1Xu0OwIq5mb0ZhEyqdDyZy1eimIcm
	PdcbSWabguiGJlonAmySR5rleEK3WBGfC+14b5RYVIquTsYJrCRQhU7kK50anst9vG73
	m6iH41orcy++mty2sHZBbyI1xHVJRiWj+HcYAss1v9+IYLpkf+Q0xQJmndcQ9eFcPjNb
	MjL7jNYwUDEbdTikgCMjNOfqE8DAUD2TMdj2wFxUtRHrLQk27+m/mhYPXJmV9mXmjTLk
	TZsQ==
X-Gm-Message-State: AGRZ1gJv0rk8efGZx6s3DBrskzhBRHjbiPt9SEEX1wTwP9LjVt1hjmAZ
	f89lWUnkXw81M24Fy7RC1yg=
X-Google-Smtp-Source: AJdET5eS+36cs7dRKkpO63fndO2EqOpV2GmpBsLV0IADLtWfxx1fw4gB3PHheoZ+kfy+y+wPqgiXvw==
X-Received: by 2002:a17:902:b03:: with SMTP id
	3-v6mr4974477plq.233.1542261964269; 
	Wed, 14 Nov 2018 22:06:04 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.65.40.100])
	by smtp.gmail.com with ESMTPSA id
	i189-v6sm30620651pfg.156.2018.11.14.22.06.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 22:06:03 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Wed, 14 Nov 2018 22:05:54 -0800
Message-Id: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with g_malloc0
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
X-List-Received-Date: Thu, 15 Nov 2018 06:06:10 -0000

And also the g_malloc doesn't need check return value,
remove it.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index d2e512856b..a460c605af 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
         return 0;
     }
 
-    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
-    if (!vcpu) {
-        fprintf(stderr, "Failed to alloc vcpu state\n");
-        return -ENOMEM;
-    }
-
-    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
+    vcpu = g_malloc0(sizeof(struct hax_vcpu_state));
 
     ret = hax_host_create_vcpu(hax_global.vm->fd, id);
     if (ret) {
@@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
         return hax->vm;
     }
 
-    vm = g_malloc(sizeof(struct hax_vm));
-    if (!vm) {
-        return NULL;
-    }
-    memset(vm, 0, sizeof(struct hax_vm));
+    vm = g_malloc0(sizeof(struct hax_vm));
+
     ret = hax_host_create_vm(hax, &vm_id);
     if (ret) {
         fprintf(stderr, "Failed to create vm %x\n", ret);
-- 
2.11.0


