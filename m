Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otWLf-0008V2-PV
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 10:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otWLd-0008Ua-Nk
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 10:53:41 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otWLP-0000Ec-Oc
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 10:53:41 -0500
Received: by mail-pf1-x431.google.com with SMTP id y203so5233082pfb.4
 for <qemu-trivial@nongnu.org>; Fri, 11 Nov 2022 07:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=68IGbKpIUJiT4vOMy40NhRKUjViYosQVoKmJGCzi6i8=;
 b=QC+SIVkHfxC6ixBhTp1TFgnOtWmSHeLi5fUmUKyeUxtJNAfUwFRe8iaiEh64cdZa45
 Ra2GI6rHNxQoZRuxUvePjDHu7Ueim2JdQRuQSQdo36Rv/U9IHcGGVPh7d9+2ZJD77BSr
 ZG/gNklD0pH1it4BI1WgywQa9zYQOyzQy4zbnJN3yv8gRjwrTfl3rpxGWi5xMbG8bRNH
 aYBl0w2fdHgXW5matM715aAWLgz6dCrVNtRbG08R8HTtvwPHhZN+aZSMVXqfqH+kkMJa
 ydp2Xu+vqC3CldtpkvgGqJJWxEJMPkym0rtOqjXoxwQYM4IxXBWeFcwR7WD/M7PcF3Vg
 EitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68IGbKpIUJiT4vOMy40NhRKUjViYosQVoKmJGCzi6i8=;
 b=iaLBONKqb6gT+NIT0KxRvkyH3nzsfOu9UZVln+ZInb3FtSh2ccj7cCNU2jk+BrHE9v
 HqzNrKo49F6YPN2vsCWLABZ7TSzZ5bhnvQhFLHwt98mB1ZXjZENoasXCGOGS+NUYd4WQ
 hOFGpIDuD9Rp0lR9FvvqDMIYLthgHO+PGQshPVuwETcxAD49/BE96Br+erpKR/SqZlsr
 ldajnzz/meA7DYuv6L1Tea+0LJbOImlbFIjQayp23jmONv5iqxW29bqlM1lzsfUYhJzE
 LIKQTU5Zf+gEVAbFgB7FgaPpGBAW46DfrefAh2CiWnLVK36Oyn8pTXYEIKrp8Hsglpu1
 YxGA==
X-Gm-Message-State: ANoB5pki8PkBnjW3GKsyrr79hqWPBnKc9q06e1GqLwxIdGaMKJENU2dU
 8lUVHXGCdoOHDWIsELPin6YopQ==
X-Google-Smtp-Source: AA0mqf5866QW8I0jSs9YDBO26dfkrMgozTNSvsmzTjP9bMM2VDmVV/cKnn6eotCL+aNCryWEJkLZ2w==
X-Received: by 2002:a63:e00d:0:b0:464:45b5:745c with SMTP id
 e13-20020a63e00d000000b0046445b5745cmr2266824pgh.118.1668182005961; 
 Fri, 11 Nov 2022 07:53:25 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.143.216])
 by smtp.googlemail.com with ESMTPSA id
 a4-20020aa795a4000000b0056d7cc80ea4sm1753151pfk.110.2022.11.11.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 07:53:25 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] acpi/tests/avocado/bits: some misc fixes
Date: Fri, 11 Nov 2022 21:23:07 +0530
Message-Id: <20221111155307.1256579-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 11 Nov 2022 15:53:41 -0000

Most of the changes are trivial. The bits test timeout has now been increased
to 110 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs. Some
minor corrections in the doc file.

CC: Thomas Huth <thuth@redhat.com>
CC: Michael S. Tsirkin <mst@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/acpi-bits.rst   | 12 ++++--------
 tests/avocado/acpi-bits.py |  5 +++--
 2 files changed, 7 insertions(+), 10 deletions(-)

changes from v1: address Thomas' suggestions.
changes from v2: more minor corrections in doc, tags added.

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index c9564d871a..56e76338c3 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -16,11 +16,8 @@ end user. The other is that we have more control of what we wanted to test
 and how by directly using acpica interpreter on top of the bios on a running
 system. More details on the inspiration for developing biosbits and its real
 life uses can be found in [#a]_ and [#b]_.
-This directory contains tests written in python using avocado framework that
-exercises the QEMU bios components using biosbits and reports test failures.
 For QEMU, we maintain a fork of bios bits in gitlab along with all the
-dependent submodules:
-https://gitlab.com/qemu-project/biosbits-bits
+dependent submodules here: https://gitlab.com/qemu-project/biosbits-bits
 This fork contains numerous fixes, a newer acpica and changes specific to
 running this avocado QEMU tests using bits. The author of this document
 is the sole maintainer of the QEMU fork of bios bits repo.
@@ -38,10 +35,9 @@ Under ``tests/avocado/`` as the root we have:
    │ ├── bits-config
    │ │ └── bits-cfg.txt
    │ ├── bits-tests
-   │ │ ├── smbios.py2
-   │ │ ├── testacpi.py2
-   │ │ └── testcpuid.py2
-   │ └── README
+   │   ├── smbios.py2
+   │   ├── testacpi.py2
+   │   └── testcpuid.py2
    ├── acpi-bits.py
 
 * ``tests/avocado``:
diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..2edc36fc26 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
+        # sleep for maximum of a minute and 50 seconds in order to accommodate
+        # even slower test setups.
+        max_sleep_time = time.monotonic() + 110
         while self._vm.is_running() and time.monotonic() < max_sleep_time:
             time.sleep(1)
 
-- 
2.34.1


