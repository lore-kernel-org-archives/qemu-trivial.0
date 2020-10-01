Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNzmr-0007Ut-EI
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 10:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmp-0007Pa-2b
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmi-0002Eg-65
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601563334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYzXqWXgtonVt/u84ke3FsaTsZ2wUQSqwruvuCAoYPY=;
 b=gRPMSfT4TPp9/Oe8pb3nZGSRHbaBhnhqCIlRm2BpXTbrpzRfS33Hq/mWi9//+mwusr0Nll
 Pt9H7QH1oLcRgrLIKFDJM3wIFBexLKiLcqCpzpEARZ0EXUYp1DWAT1FSDUsWGDH/I5BTbC
 VcIjyA+EgnVVUvY6+953zjaj4whFV7M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-9cKBP7SXPGqdKTPp5XiEBg-1; Thu, 01 Oct 2020 10:42:12 -0400
X-MC-Unique: 9cKBP7SXPGqdKTPp5XiEBg-1
Received: by mail-wr1-f69.google.com with SMTP id l9so2119774wrq.20
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 07:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYzXqWXgtonVt/u84ke3FsaTsZ2wUQSqwruvuCAoYPY=;
 b=Yav31JIWGSfD7mPEC4fuYlibUB47n6MyROssbik8fl2tfp6+d/UzCnVesBCg3TaTwA
 YPlY8VbIPcTg44SJUo8+MaI39ETD10SqiU4y94ObeAcem2QrK+htgl1dn5Wkr62nJkLe
 RLWeOH/0LaussV1FlNf7z04uwdRSwQ2uAGIIKFWNpvoUOl7xb+7VBQqNhGAAsiZQ2cJL
 6uU7Yvk9ynAGW6UcvT4VULSZifCuKnDGan3cR6kHpgITRVaI3Xf0wW4QtW3V3vyiqy7l
 lbrL+T63tq6Wkq4bQOjo5pgdhbRS6tQyoLdqVsQDnE1gAhjAZc56QhjTEuiH09rCTLt+
 UeJg==
X-Gm-Message-State: AOAM533mB8ctVLYFqa3K9TiQsc/Xa4oS6/Vh42qPyYlskfV2Ph05VPi3
 coe3nTIovhl7VCU1HiqMQjrBRMP0iXVUiPxCtp4iSbn4SjITr0BRP7lErzlU9lPXxv1ZZHX4LWa
 Bki21j1Kdx5Eh/MKYcQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr396978wmi.28.1601563330799;
 Thu, 01 Oct 2020 07:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfZsOqeK8ZHFNvsrASWtTpI7huwLdL1ZQpRYSjqV4DvIReW346xR/JUEwh2tzoJnIHjL20OQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr396947wmi.28.1601563330571;
 Thu, 01 Oct 2020 07:42:10 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id 88sm9710069wrl.76.2020.10.01.07.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 07:42:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 3/3] target/i386: Restrict X86CPUFeatureWord to X86 targets
Date: Thu,  1 Oct 2020 16:41:52 +0200
Message-Id: <20201001144152.1555659-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001144152.1555659-1-philmd@redhat.com>
References: <20201001144152.1555659-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 01 Oct 2020 14:42:23 -0000

Only qemu-system-FOO and qemu-storage-daemon provide QMP
monitors, therefore such declarations and definitions are
irrelevant for user-mode emulation.

Restricting the x86-specific commands to machine-target.json
pulls less QAPI-generated code into user-mode.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine-target.json | 45 ++++++++++++++++++++++++++++++++++++++++
 qapi/machine.json        | 42 -------------------------------------
 target/i386/cpu.c        |  2 +-
 3 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 698850cc78..b4d769a53b 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,6 +4,51 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+##
+# @X86CPURegister32:
+#
+# A X86 32-bit register
+#
+# Since: 1.5
+##
+{ 'enum': 'X86CPURegister32',
+  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ],
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @X86CPUFeatureWordInfo:
+#
+# Information about a X86 CPU feature word
+#
+# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
+#
+# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
+#                   feature word
+#
+# @cpuid-register: Output register containing the feature bits
+#
+# @features: value of output register, containing the feature bits
+#
+# Since: 1.5
+##
+{ 'struct': 'X86CPUFeatureWordInfo',
+  'data': { 'cpuid-input-eax': 'int',
+            '*cpuid-input-ecx': 'int',
+            'cpuid-register': 'X86CPURegister32',
+            'features': 'int' },
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @DummyForceArrays:
+#
+# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
+#
+# Since: 2.5
+##
+{ 'struct': 'DummyForceArrays',
+  'data': { 'unused': ['X86CPUFeatureWordInfo'] },
+  'if': 'defined(TARGET_I386)' }
+
 ##
 # @CpuModelInfo:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 756dacb06f..995e972858 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -574,48 +574,6 @@
    'dst': 'uint16',
    'val': 'uint8' }}
 
-##
-# @X86CPURegister32:
-#
-# A X86 32-bit register
-#
-# Since: 1.5
-##
-{ 'enum': 'X86CPURegister32',
-  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
-
-##
-# @X86CPUFeatureWordInfo:
-#
-# Information about a X86 CPU feature word
-#
-# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
-#
-# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
-#                   feature word
-#
-# @cpuid-register: Output register containing the feature bits
-#
-# @features: value of output register, containing the feature bits
-#
-# Since: 1.5
-##
-{ 'struct': 'X86CPUFeatureWordInfo',
-  'data': { 'cpuid-input-eax': 'int',
-            '*cpuid-input-ecx': 'int',
-            'cpuid-register': 'X86CPURegister32',
-            'features': 'int' } }
-
-##
-# @DummyForceArrays:
-#
-# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
-#
-# Since: 2.5
-##
-{ 'struct': 'DummyForceArrays',
-  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
-
 ##
 # @NumaCpuOptions:
 #
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9f72342506..848a65ded2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -38,7 +38,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
-#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-visit-machine-target.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-- 
2.26.2


