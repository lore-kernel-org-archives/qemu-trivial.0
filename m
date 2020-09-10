Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGGb1-0005gQ-Tb
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 03:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGaz-0005az-Gt
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:02:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50353
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGax-0001nE-Nn
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599721331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGs5ABKm8y9Jc/D3T2fzKVj+EYzhUQk9uXM+DI2xiY8=;
 b=UfvytXJwaUshkoAXm5DqDY0WlAxkGs6JLz7inrVLQFBMqOghHj0HUW1dg2laFH8ZOp5UjC
 GT5LO2jfKjB2A/3+2ZzhLXYTdo8PlRb7lGhCrOlRBOMTvCt+VsHyu6QbD+Cuchj+Akdtbf
 3HVZbM8KX8yDEbf0bpbbxH/RXPhh+Zk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-tIs5BUJVPQuLgG1B1KRsnA-1; Thu, 10 Sep 2020 03:02:09 -0400
X-MC-Unique: tIs5BUJVPQuLgG1B1KRsnA-1
Received: by mail-wm1-f72.google.com with SMTP id s24so1767987wmh.1
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGs5ABKm8y9Jc/D3T2fzKVj+EYzhUQk9uXM+DI2xiY8=;
 b=RTPOAQBUKjKzQeZ15gxSoLOBH6rlQ/mwSjchQha6GpF4ZpEpfJzFupK/9YI+TZXkpe
 RKCwtZM0GdPDLKC/5d2t0+bdFoNDcVUDjAhi4JFH0QOyxUjN2VW2X9DDcmeMHbUi6uYe
 CyL9MhWjT4PKDO+GnHyttSiMlRO0YI+cEV6nAfXbU+zfm5noNN7fJg5iolGW2v6jKNJg
 qqdaHo2/Ho8tj3oG1WdP1DNd7PJB2L2KnZjVbXuf6/MSjAIJUXqK5yHdH+uw12FeWW1u
 gx8vLgEQ7mDzgrX1xpQP2Rwhq+2lnGB3Jw24oUV68/GgmR5owFqMTa+YtTeNRtg5w0nv
 UKog==
X-Gm-Message-State: AOAM533D1WYoJyr6aEVb16rBMQFFeOFN7oHytWokwYnLdFh/+y1NGKEi
 LIos2/B1ReGzvEr+YPE10OayuJd5L76e34eLVjcZUSRqo2aaxeSTYRAkyYu4LLre0Vp8KkQ4pyP
 XNG6saiRN1mIZJj55bQ==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr6890990wma.111.1599721328156; 
 Thu, 10 Sep 2020 00:02:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE0Z695VXU3e9M0JVMx/m5jixlhhfySuGaTkiZxpc9kM9WGt9z1mdGK0NlEetghntMunzOLg==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr6890972wma.111.1599721327946; 
 Thu, 10 Sep 2020 00:02:07 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id m185sm2221410wmf.5.2020.09.10.00.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:02:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 6/6] target/i386/kvm: Rename host_tsx_blacklisted() as
 host_tsx_broken()
Date: Thu, 10 Sep 2020 09:01:31 +0200
Message-Id: <20200910070131.435543-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Sep 2020 07:02:13 -0000

In order to use inclusive terminology, rename host_tsx_blacklisted()
as host_tsx_broken().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 205b68bc0ce..3d640a8decf 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -302,7 +302,7 @@ static int get_para_features(KVMState *s)
     return features;
 }
 
-static bool host_tsx_blacklisted(void)
+static bool host_tsx_broken(void)
 {
     int family, model, stepping;\
     char vendor[CPUID_VENDOR_SZ + 1];
@@ -408,7 +408,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     } else if (function == 6 && reg == R_EAX) {
         ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
     } else if (function == 7 && index == 0 && reg == R_EBX) {
-        if (host_tsx_blacklisted()) {
+        if (host_tsx_broken()) {
             ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
         }
     } else if (function == 7 && index == 0 && reg == R_EDX) {
-- 
2.26.2


