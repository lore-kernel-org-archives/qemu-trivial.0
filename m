Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRB-00014B-KE
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR9-00011N-4f
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR8-0006rZ-B7
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:47 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR4-0006ma-FR; Fri, 06 Oct 2017 19:53:42 -0400
Received: by mail-qk0-x242.google.com with SMTP id z12so9700751qkb.0;
	Fri, 06 Oct 2017 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ykI4tnSUBkLz8hzKxB9N2iyqvP6oAmt1ciyJeGB7v/c=;
	b=HHja9FQXhlZibjKWra5LZLQX77bxC4ibNNhZcp7+2PYtTyz+bBH0m48juFGUEssayT
	AaT0IcXlysGlxe3vVUUwwYLwWgjYFpyR2Hi1RuFKjUw9XVPIAu61i8GIsztQOwq/WhoQ
	5h5jsP/kDLVT0n2DX6b5ztpDoKQeyR+x24thQ4CSOF9hTzprfrAzLrzLofwajoIX51Wf
	wKOo5aPHh+nX60N5F3bpaL+ie5xfjSetIlcN/jsUTxZeEK60ko1sATYzU9XXR+muZVMl
	q6U75Sg8wk3WT78bWtmi6nKCfYiU1gnn7XSyGnlGskLLVCWS3Z/4E3m9KSenX3l6sUTm
	g8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ykI4tnSUBkLz8hzKxB9N2iyqvP6oAmt1ciyJeGB7v/c=;
	b=k8mZ8vLV5IKpPOGxj+MXx9RyEQUDsM2L+mubzkznrppH9GkIzat4u4gTBUYx/Yhu+F
	yNatuDfW3T7K74Spl3e/WDyDhSevdC6+SMaKA6DIHi62Nof6I+fCA6l6LxKdZMcmAEff
	B59DdP6kwgx7RbdtVXaPeCMjxe3i8MLJifTx5I86iMSsNDcvkZ1N8bVU1CZl9xean2YT
	sQcr6w3arKX9esj/mWsKjr7Iq1pjZT7Vf5XVvdpsFcUYNRbbNgLT9JjxnSsiE0akul2y
	ioDgBGIINRvKhGCmLwJVb4qD4GVD6PtWfTwO1K+en+BaPVjT7nhF/hnRVbXJBeJzsUiW
	bbbw==
X-Gm-Message-State: AMCzsaU79hXqtfTbPMzdH9mU8hefKIitTUUQJeuk3oAczIC5A7OiUIRC
	jIGTQdZZPJv8mYK0Rbcri0U=
X-Google-Smtp-Source: AOwi7QCvdc2uq3J7s9Hd6sA1uqX4omoq3y9CsqJMIAw18FRnMociFrs+lDfNsU2t0gqKJ3GeKCsu9Q==
X-Received: by 10.55.91.69 with SMTP id p66mr694664qkb.167.1507334021939;
	Fri, 06 Oct 2017 16:53:41 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:49 -0300
Message-Id: <20171006235023.11952-55-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 54/88] KVM: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:48 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: more changes]
---
 accel/kvm/kvm-all.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 90c88b517d..12568d703c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -278,7 +278,7 @@ int kvm_destroy_vcpu(CPUState *cpu)
         goto err;
     }
 
-    vcpu = g_malloc0(sizeof(*vcpu));
+    vcpu = g_new0(struct KVMParkedVcpu, 1);
     vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
     vcpu->kvm_fd = cpu->kvm_fd;
     QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
@@ -865,7 +865,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 {
     int i;
 
-    kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
+    kml->slots = g_new0(KVMSlot, s->nr_slots);
     kml->as_id = as_id;
 
     for (i = 0; i < s->nr_slots; i++) {
@@ -1129,7 +1129,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
             return virq;
         }
 
-        route = g_malloc0(sizeof(KVMMSIRoute));
+        route = g_new0(KVMMSIRoute, 1);
         route->kroute.gsi = virq;
         route->kroute.type = KVM_IRQ_ROUTING_MSI;
         route->kroute.flags = 0;
@@ -2243,7 +2243,7 @@ int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
             return 0;
         }
 
-        bp = g_malloc(sizeof(struct kvm_sw_breakpoint));
+        bp = g_new(struct kvm_sw_breakpoint, 1);
         bp->pc = addr;
         bp->use_count = 1;
         err = kvm_arch_insert_sw_breakpoint(cpu, bp);
-- 
2.14.2


