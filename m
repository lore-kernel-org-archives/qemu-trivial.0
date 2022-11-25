Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyQXF-0005Ek-1g
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2022 23:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyQXD-0005EN-O7
 for qemu-trivial@nongnu.org; Thu, 24 Nov 2022 23:41:55 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyQXB-00023h-Sa
 for qemu-trivial@nongnu.org; Thu, 24 Nov 2022 23:41:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id k5so2735331pjo.5
 for <qemu-trivial@nongnu.org>; Thu, 24 Nov 2022 20:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZBhmf+s4zglpJYEi5bQfF+A/etBSjYx4hJAXLIBrrRk=;
 b=uRiSJdj96Vig+GEFlaAFCZVAA66Uehl05E0gtCt5ttzJrdAXdbvau8nbHaHuq0fNAp
 +eICToMBgDC4YwQxnZg3WmoaOi7S+soYRauW97cpSjyIxaqj/86vtvFZbBzsbng+Ji1S
 O3fEeYVB+sNKglxrQztesPZhAsEkUbcSttk0LQWnnQrgxIzt2uOELG4lD4pNo0arYDNj
 g6hidFDlNEAy/qPt/lhyDtT7vKzJ075AeK2kKMkVZy6IecBIaxfnT8gAm6icq89qsH42
 rktBTiap+HbLQv7InNbhGGWFlF7aBnSt5RKlAJomQnB0VIyLKxLivZVMY2Ok3cByAnjC
 81pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZBhmf+s4zglpJYEi5bQfF+A/etBSjYx4hJAXLIBrrRk=;
 b=dWrneLLcYovLWLmG4KDxbXp2ZJV8sGODB7xsSkykBEwSTF9sNmvGC5ItLOu/VbQf+v
 9aUNYORHiD4gqoIeS1PLj7p3prT3iFA3dvRLrfyR7PK98nLiyGigH5SXneoilQaOhtie
 gqzsaAegm6CqeXixr7c88MgAdB6vdpYRnBaV9SwEUTRD68VT+90LkF3oExLCIpVYTeJG
 FgZHmRXZ10V/VQrQeygRHWC3U+aDeRv9cS0v6VsJR0sdw5Yx31AMJ2sW0kuEUYXGqStm
 sH/C3Fdnr2vuT3ClqOcMlxxGgUlkhmGVK98LOCVkfSPIKrj6TwVR0U5+w507gMTKomvz
 TdpQ==
X-Gm-Message-State: ANoB5pndkwX3jySK1M/KnlPWxrG6biuQ/4aU3yrbkKhWSajku1qOlwlo
 wjvI6UGm5TZl1uSDdtj9LCrGLw==
X-Google-Smtp-Source: AA0mqf7C4+EGfeDx9NXwpGzCyPFQIRRRyPmaUWHsfykXamvJWQi55j/ehZ6CijrJTyP4sclc+VCBKA==
X-Received: by 2002:a17:90a:9c07:b0:218:9f75:deae with SMTP id
 h7-20020a17090a9c0700b002189f75deaemr27474431pjp.58.1669351311848; 
 Thu, 24 Nov 2022 20:41:51 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([49.207.217.20])
 by smtp.googlemail.com with ESMTPSA id
 li1-20020a17090b48c100b00213ee5a12c9sm1964968pjb.55.2022.11.24.20.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 20:41:51 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers for
 bios bits tests
Date: Fri, 25 Nov 2022 10:11:38 +0530
Message-Id: <20221125044138.962137-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Nov 2022 04:41:56 -0000

Added the SPDX license identifiers for biosbits tests.
Also added a comment on each of the test scripts to indicate that they run
from within the biosbits environment and hence are not subjected to the regular
maintenance activities for QEMU and is excluded from the dependency management
challenges in the host testing environment.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
 3 files changed, 12 insertions(+)

changelog:
changes from v1: fixed typo as suggested by Phil.

diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avocado/acpi-bits/bits-tests/smbios.py2
index 9667d0542c..fc623de072 100644
--- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
+++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """SMBIOS/DMI module."""
 
 import bits
diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index dbc150076e..f818a9cce6 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """Tests for ACPI"""
 
 import acpi
diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
index ac55d912e1..7adefbe355 100644
--- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
@@ -1,6 +1,8 @@
 # Copyright (c) 2012, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """Tests and helpers for CPUID."""
 
 import bits
-- 
2.34.1


