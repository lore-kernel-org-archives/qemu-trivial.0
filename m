Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p7yng-0006LZ-C0
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2022 08:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynL-0005y9-0g
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 08:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynI-0004Ma-H0
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 08:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZlrgmM6CqobNLR1u/ctWVcjTri0rIQMOg6qCNFy3iM=;
 b=VZmTtOI5JJl3RcKjzT5IFNqkb6ksWYME3/QckoN90Jr2CBY7jALNjibG6fMgoYU7snQyGd
 YfKYiOJawKI/7zHy7E5jpZ/cmDY1p90pkvf24mcWZbYM+lqD9qxpUBBa58jCMC2iQEidzh
 NzDli3iRCRV/fLHU2LAV5dxxqDEEUUM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-5b2zJ2UKPTCqWo7lT5Yc3g-1; Wed, 21 Dec 2022 08:05:58 -0500
X-MC-Unique: 5b2zJ2UKPTCqWo7lT5Yc3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 i187-20020a1c3bc4000000b003d634aca337so1766110wma.1
 for <qemu-trivial@nongnu.org>; Wed, 21 Dec 2022 05:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nZlrgmM6CqobNLR1u/ctWVcjTri0rIQMOg6qCNFy3iM=;
 b=qz4pvbBjDVBufArLbcyujZ+kRBzvTHIJvBNyGc7T6fIxmvemVCPjun6YIdmixLdApo
 k/obDGIEBzMtDg510oW+Xfvmzkse/i7g1lU3iR8aQDd0BhBJhLCAgSs8tfRYaAh3sxtb
 2UrXJNbEZm/sviaedPcvKXbPOzL31ACd9gKddWFRfJmYOmKoMQi/VNclEPgoHNYdpLZr
 3VBAPr35pwo31kVi4c5cgDz7f3xRvkBQ6BB2T/XSViQbfdmKtuJel3EgMi6Tl9yyFQKN
 x2CQB88yPC4uHxQVh29036sxJLHG7iiX4PTr4oM/fCXf2B6wGNCgN0opqXoFNrAB+qUz
 4nrA==
X-Gm-Message-State: AFqh2krvgJ3+8IGDika11Q2j3ePGtusRK1dYV14zUab6KhmuJMkwILVS
 l3+O3FNTCk4Ii5SMrOqiuAVvcPHmDm560u6TGWOXvuwdGIv/6aJZU+CyefGAt5iinmF0324zeS0
 RQG1CtqtudOKugq1Tcg==
X-Received: by 2002:adf:aa9d:0:b0:242:436e:c6ac with SMTP id
 h29-20020adfaa9d000000b00242436ec6acmr1165390wrc.21.1671627957312; 
 Wed, 21 Dec 2022 05:05:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVS8xMUKJkhynJWhPKPMYBJiHFouDFVhhLAMtAVpzFmI73UsiTn+diEtUUF2Q/yIZO+kv98w==
X-Received: by 2002:adf:aa9d:0:b0:242:436e:c6ac with SMTP id
 h29-20020adfaa9d000000b00242436ec6acmr1165378wrc.21.1671627957107; 
 Wed, 21 Dec 2022 05:05:57 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bn8-20020a056000060800b002365b759b65sm15456675wrb.86.2022.12.21.05.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:56 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-trivial@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 26/41] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
Message-ID: <20221221130339.1234592-27-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 Dec 2022 13:06:10 -0000

From: Ani Sinha <ani@anisinha.ca>

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
Message-Id: <20221125044138.962137-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
 3 files changed, 12 insertions(+)

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
MST


