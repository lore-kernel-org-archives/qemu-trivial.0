Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYOu2-00043W-T7
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 03:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOu0-00040V-OK; Tue, 12 May 2020 03:00:32 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOtz-0005Zs-Ie; Tue, 12 May 2020 03:00:32 -0400
Received: by mail-wr1-x441.google.com with SMTP id j5so13940013wrq.2;
 Tue, 12 May 2020 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzSFoHvo+LUbrscxwLzY12kA7xl8hv+snls8859rSqE=;
 b=MKr7oaKIpdvu+7LhBS2ehzLga85rG20OmN/PQECwyNW6HJtJzgNbzn6/VSmt4HvpaE
 PCKkjxQ0SA9tDrjwV2vTRFt33MrBgYxXvJmW3xKfeh/jSPmVCKrB3mCNpYWS26HX3o5O
 hlh2XRl77sADIzjOQD3FhYzhGwWsvB5BiIRbRqJcq1rHxnkK6RXA18djF/X0TIRbJyDn
 w32lo0jVIS5hyOvbEactOn62WitR6SoI48eG9jU8v5NFciT+6Ug1P8t2rQ2nPvMv008M
 V6i7jvjYu8DN9SMM2V5Ykxmbtqbcxq4MNOc0Hft0mb7XvhhkZNICRLM4vW532M5F8WP6
 cBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uzSFoHvo+LUbrscxwLzY12kA7xl8hv+snls8859rSqE=;
 b=JDe/wcBWg1Hkl/PiTaONZpG2vjvAkOJDT/skolVgAhByoO2+8rBx5MH+E9+/YydV5n
 xClAYa1ujcdGgsc4zBi8p1sMDi4YwXmcmFCiEMq/GTyI1LTyMt4juIU/MWL+gevcX8Db
 JMbe6PKbPx8F7NOiw6qnq6yZFs93qJlms2EIxwqtytkcpz1Q4wyY1dFA8lESjhbpHcFG
 8YmS+ne/ttJypYnG5VWmwmKRlp8vYvBLc/aDJldANDlz/YqHxGvFbmVbONCn+NdGXIPC
 AL7+wQjDB1UvGYXobR3UsVFALZge0vTng6CJGv2jxouM2uPenrg77NThTRt83qZEe8TT
 n4fA==
X-Gm-Message-State: AGi0PuZXImIQsOqwEWNFZlctXI3e9E6RCUSQbKjbqelneEU9kj3zkR4X
 ep8ylZTOJhY5NoI63gYiA8y342RFBcSHuQ==
X-Google-Smtp-Source: APiQypIs8M6gmDURfLOfQu5RtZ1Um8Xav+XMDqYjUSpzJEC+9fnPgiw4rV1mWuxxF/9/Y3/iVbp1ow==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr23302823wrx.107.1589266828240; 
 Tue, 12 May 2020 00:00:28 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>,
 John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Corey Minyard <minyard@acm.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, Peter Maydell <peter.maydell@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/3] target: Remove unnecessary CPU() cast
Date: Tue, 12 May 2020 09:00:18 +0200
Message-Id: <20200512070020.22782-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512070020.22782-1-f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Tue, 12 May 2020 07:00:34 -0000

The CPU() macro is defined as:

  #define CPU(obj) ((CPUState *)(obj))

which expands to:

  ((CPUState *)object_dynamic_cast_assert((Object *)(obj), (name),
                                          __FILE__, __LINE__, __func__))

This assertion can only fail when @obj points to something other
than its stated type, i.e. when we're in undefined behavior country.

Remove the unnecessary CPU() casts when we already know the pointer
is of CPUState type.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 86c667b094..8972714775 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *env, target_ulong BATu,
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
         LOG_BATS("Flush all BATs\n");
-        tlb_flush(CPU(cs));
+        tlb_flush(cs);
         LOG_BATS("Flush done\n");
         return;
     }
-- 
2.21.3


