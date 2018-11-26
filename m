Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDd9-0002Y2-KX
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 04:56:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRDd6-0002VI-Fh
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRDd0-0005lY-Ld
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:36 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gRDd0-0005jp-Fa; Mon, 26 Nov 2018 04:56:30 -0500
Received: by mail-pg1-x543.google.com with SMTP id s198so5935171pgs.2;
	Mon, 26 Nov 2018 01:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J/74qfi7/PEfNOHQW2v4ZTS3XPH7eBQJdeOndlkPiRI=;
	b=jg6gABlioLex2yIK5NPVmFhXfKIq1YW0EJoDwc8pizhL82z92V6hn0jTE4Qy2lAz9a
	0OAe64UfYlOv8+wRGEHO8QcZ519ODwvZrytGvOoZenzeSvBL0cG4XFzFFbIksCPJV/W+
	bAzqnuiTiPQ7CyZeOt+PEI3HDoXaIDdrIwSM7BePzP6LkvhcXDG9amn0zfudFWl0hBKA
	ZvGizDSPMmEa2H+orpsKRh0U9CplyMcd/ey3QDa4Pb/B14b5dSHqbSPv1g4RC/4T1OE3
	z0+3vgAS3efMpedXPvUDVCzYmk5nsxXhQ+B2xDyDUHAciYY3UqJkbkrSzqCcsfyNm01e
	Wptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J/74qfi7/PEfNOHQW2v4ZTS3XPH7eBQJdeOndlkPiRI=;
	b=h3SUIe2Gl35AeeSMzCujQbSF7JEziTDYroLsO3yd4YrLbG9U/Fy6tyAHWWXJw50CTH
	zXczuD7rmsMAvvLDcXCNSeYgrIP1xrmk+AnDEcdDQyNJ93a+XtSRnZImjAYM9n2NlIdk
	h7wfbiyRn/rAMCu2x3sMyn6nUc8016AQcT0fIOfiqn2NmENCvWJ091wge+rYSsLJCNhZ
	98C5FVe3SgmECZ8dlL4DbMs7/9EHF1dn3nhleiWF9TddiO9zcZUs8Pz1lMfPoacu8XOx
	2y8ZMgx0bPLR1pMVYCmozXfr16dNeRDbMaMgSJwcOmJc9AN6yuZ7kJCVRiC8DK0JR5oI
	gloA==
X-Gm-Message-State: AA+aEWZTm5AvjK1KDAaPqqozcD3VIEU1m6NGTAhR5GvQ6w1BqrZhgX2H
	KxbNV4fuqcE7eNKgGGEv76g=
X-Google-Smtp-Source: AFSGD/UzEb2gNxK8zZXNlANrUVUil+2RSG9ybSsLPI0dVTaoBtIXwAJwpQujyivVXMuorL9oRznlNA==
X-Received: by 2002:a63:d655:: with SMTP id d21mr24128640pgj.280.1543226189141;
	Mon, 26 Nov 2018 01:56:29 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id b2sm98684031pfm.3.2018.11.26.01.56.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 01:56:28 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, alex.bennee@linaro.org, philmd@redhat.com,
	armbru@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Mon, 26 Nov 2018 01:56:19 -0800
Message-Id: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with g_new0
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
X-List-Received-Date: Mon, 26 Nov 2018 09:56:37 -0000

And also the g_malloc doesn't need check return value,
remove it.

Cc: qemu-trivial@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index d2e512856b..502ce6f0af 100644
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
+    vcpu = g_new0(struct hax_vcpu_state, 1);
 
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
+    vm = g_new0(struct hax_vm, 1);
+
     ret = hax_host_create_vm(hax, &vm_id);
     if (ret) {
         fprintf(stderr, "Failed to create vm %x\n", ret);
-- 
2.11.0


