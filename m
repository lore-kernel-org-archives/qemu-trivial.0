Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIF6C-00029v-Cb
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 12:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msmarduch@digitalocean.com>) id 1iIF69-000260-7R
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 12:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msmarduch@digitalocean.com>) id 1iIF68-0001k1-3F
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 12:46:01 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <msmarduch@digitalocean.com>)
 id 1iIF67-0001iw-UK
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 12:46:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id t84so2319203oih.10
 for <qemu-trivial@nongnu.org>; Wed, 09 Oct 2019 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=USBhbd2qdz43lBvTF90+/aku+zY1BGuB8YB3YsvDEsk=;
 b=K/cgc8ip8Trh/UzP24Ybq9Ru+/wEGzn3Ce8H2Df4fY0jqGSTyhWVKXsBeg1xcxRSZf
 bzCD3XJoTx8j+2dQ6RX8zZvwa6blK+f0IVtrZWAkKTB2USKgxfdUfM+Gn93pbOlttmqP
 jtv6b9yfDvAn27g31BvHO29aGYvnqEmQFC5b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=USBhbd2qdz43lBvTF90+/aku+zY1BGuB8YB3YsvDEsk=;
 b=QizXyZ+44QzhqUuY2EkTq20MLCqGXWJbFtJG0+qcvWB/iXCI368GEKBIwpbewzqTrQ
 xvQMBTMdsuzKIg8zU/19J9kPSWLt4WhCSKFh0xgidz16VleH41JuZXulni68xyWtWTeb
 83xdnuI4QZEaPvdNNEsUAGGfudPgraSN/4yi7BQHK714lR4FRq3YOsI5eo/fVW/rbzNQ
 KhVSQtZbe19zeuzS6VtX8l42TIh3Yg+IkKsCVEjl+/pJ/JZSBjPxPWPMQBTWh2Sen7U2
 LyFBc8wV2LGCXkPYa4Ypt0yQAlwQN4XnR2BJD8HbFhxPhk5No/doRCbRzLmJpP1pnLPf
 MnFw==
X-Gm-Message-State: APjAAAU/SwtAN9DwGxYnNw74a4Xje6g9xV3lLw9OsIYFMlXhP2pr5ayR
 2JIgArVyK2S9a2fNhBvVvLfnnA==
X-Google-Smtp-Source: APXvYqzSykY2vXaWT1phz43fJDxY1HjvHG5KdsjA7bg8aI5Ho+b967sZD4OAa21R66F5htQHVrwqGg==
X-Received: by 2002:a54:4519:: with SMTP id l25mr3163818oil.143.1570639557881; 
 Wed, 09 Oct 2019 09:45:57 -0700 (PDT)
Received: from msmarduch-ThinkPad-T460s.attlocal.net
 ([2600:1700:4a30:84c0:8d5e:794e:8a2e:ee89])
 by smtp.gmail.com with ESMTPSA id q1sm789818otn.8.2019.10.09.09.45.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 09:45:57 -0700 (PDT)
From: Mario Smarduch <msmarduch@digitalocean.com>
To: philmd@redhat.com, mtosatti@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, rth@twiddle.net,
 ehabkost@redhat.com, Mario Smarduch <msmarduch@digitalocean.com>
Subject: [PATCHv2 2/2] target/i386: log MCE guest and host addresses
Date: Wed,  9 Oct 2019 09:44:59 -0700
Message-Id: <20191009164459.8209-3-msmarduch@digitalocean.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20191009164459.8209-1-msmarduch@digitalocean.com>
References: <20191009164459.8209-1-msmarduch@digitalocean.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 16:46:03 -0000

Patch logs MCE AO, AR messages injected to guest or taken by QEMU itself.
We print the QEMU address for guest MCEs, helps on hypervisors that have
another source of MCE logging like mce log, and when they go missing.

For example we found these QEMU logs:

September 26th 2019, 17:36:02.309        Droplet-153258224: Guest MCE Memory Error at qemu addr 0x7f8ce14f5000 and guest 3d6f5000 addr of type BUS_MCEERR_AR injected   qemu-system-x86_64      amsN    ams3nodeNNNN

September 27th 2019, 06:25:03.234        Droplet-153258224: Guest MCE Memory Error at qemu addr 0x7f8ce14f5000 and guest 3d6f5000 addr of type BUS_MCEERR_AR injected   qemu-system-x86_64      amsN    ams3nodeNNNN

The first log had a corresponding mce log entry, the second didnt (logging
thresholds) we can infer from second entry same PA and mce type.

Signed-off-by: Mario Smarduch <msmarduch@digitalocean.com>
---
 target/i386/kvm.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 11b9c85..7eeefac 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -592,9 +592,9 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr paddr, int code)
                        (MCM_ADDR_PHYS << 6) | 0xc, flags);
 }
 
-static void hardware_memory_error(void)
+static void hardware_memory_error(void *host_addr)
 {
-    fprintf(stderr, "Hardware memory error!\n");
+    error_report("QEMU got Hardware memory error at addr %p", host_addr);
     exit(1);
 }
 
@@ -618,15 +618,34 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
             kvm_hwpoison_page_add(ram_addr);
             kvm_mce_inject(cpu, paddr, code);
+
+            /*
+             * Use different logging severity based on error type.
+             * If there is additional MCE reporting on the hypervisor, QEMU VA
+             * could be another source to identify the PA and MCE details.
+             */
+            if (code == BUS_MCEERR_AR) {
+                error_report("Guest MCE Memory Error at QEMU addr %p and "
+                    "GUEST addr 0x%" HWADDR_PRIx " of type %s injected",
+                    addr, paddr, "BUS_MCEERR_AR");
+            } else {
+                 warn_report("Guest MCE Memory Error at QEMU addr %p and "
+                     "GUEST addr 0x%" HWADDR_PRIx " of type %s injected",
+                     addr, paddr, "BUS_MCEERR_AO");
+            }
+
             return;
         }
 
-        fprintf(stderr, "Hardware memory error for memory used by "
-                "QEMU itself instead of guest system!\n");
+        if (code == BUS_MCEERR_AO) {
+            warn_report("Hardware memory error at addr %p of type %s "
+                "for memory used by QEMU itself instead of guest system!",
+                 addr, "BUS_MCEERR_AO");
+        }
     }
 
     if (code == BUS_MCEERR_AR) {
-        hardware_memory_error();
+        hardware_memory_error(addr);
     }
 
     /* Hope we are lucky for AO MCE */
-- 
2.9.3


