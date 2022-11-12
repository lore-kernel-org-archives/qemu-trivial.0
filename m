Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otiXt-00069o-At
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 23:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otiXr-00069V-5e
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 23:55:07 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otiXp-0004R3-5l
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 23:55:06 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o7so6055024pjj.1
 for <qemu-trivial@nongnu.org>; Fri, 11 Nov 2022 20:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UADvWtczIU3wsLfk/BaoeMMQt4Cmv3yBrREhGKJqxxc=;
 b=JTIy10R8jHfMVU0EH5IDyAzioOh3qAnfqz4yuEVDd00UBt0lY86thPZUip+GJJOvU+
 5kB+fR+Q95+xzdOn4q3FP8767Z4uwjCurRsjqgOVqM+RQamIHO/sQrmhSmRlgOvCHasp
 T/61rnrqDEhenjnTduow4nlMVevs7lERAyEAMaScL780TFTABDcE5MYEHTNyCtT2xVtj
 TBnEIMu3ugEbKDfteFkeCDtnDJYbjFCeCRDbxPdYKaBcJRci0f/AaX51qejm89zM70V+
 h0qqzYY4ZWEEy/WbaLjkVrPtfyHhF76zaKE4/y743oKn6IyH+12Bl2YVEnRDxYCzRhl3
 tj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UADvWtczIU3wsLfk/BaoeMMQt4Cmv3yBrREhGKJqxxc=;
 b=uCpJAEvQyzgUsomES/ZrhlPgDOFRRMzbh5cdSNThTdICkjq8s3FXsZ8iCccDuv4x7o
 1hrD+nqjNUNg+AMvKLivBufxCHLiyCBUJGSBf9G7L7hJst/blFDacsFdnyH3eLFJiIu5
 taQiPGEpM0nIo2QzqL/3p9PpLylhJnouULrTAcuXqys5KjDUpgqt+J+rOxjJxoPuv8mF
 7q9hSnrHAsosyLEGV6VdrsL8rvkSvdUM5M462dqkOHHzqJ6VqGwTuirxlqoSz4GE2/sO
 OEFBGnf0AOltTrnYLkRFq1DH4BYpVfn1mPLPORP1+dWpu5JCwtIm2Ds3tVWC4LRa1WOn
 GX/w==
X-Gm-Message-State: ANoB5pnLfyNs0kSvrryoMjKchfGfbMT9FBOeL3z4JabxIc8RNBnDOJtT
 0dcAn1ocAfdbcbpbzCxFzp3vxw==
X-Google-Smtp-Source: AA0mqf73BJp3mjKii8i1WjkgQUvUWtdC55Y4ltleXzZAMk8sv/lFeOLREzfvlvXpki7hmlnq26fMLw==
X-Received: by 2002:a17:902:d145:b0:181:b25e:e7bc with SMTP id
 t5-20020a170902d14500b00181b25ee7bcmr5595135plt.46.1668228903443; 
 Fri, 11 Nov 2022 20:55:03 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.112.147])
 by smtp.googlemail.com with ESMTPSA id
 h4-20020a17090a648400b0021358bd24b9sm5618303pjj.21.2022.11.11.20.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 20:55:03 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4] acpi/tests/avocado/bits: some misc fixes
Date: Sat, 12 Nov 2022 10:24:49 +0530
Message-Id: <20221112045449.1286533-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sat, 12 Nov 2022 04:55:07 -0000

Most of the changes are trivial. The bits test timeout has now been increased
to 200 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs. Some
minor corrections in the doc file.

CC: Thomas Huth <thuth@redhat.com>
CC: Michael S. Tsirkin <mst@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/acpi-bits.rst   | 12 ++++--------
 tests/avocado/acpi-bits.py |  8 ++++++--
 2 files changed, 10 insertions(+), 10 deletions(-)

changes from v1: address Thomas' suggestions.
changes from v2: more minor corrections in doc, tags added.
changes from v3: raised timeout to 200 secs overriding the default
avocado timeout of 120 secs.

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
index 8745a58a76..a67d30d583 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -134,6 +134,9 @@ class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
     :avocado: tags=acpi
 
     """
+    # in slower systems the test can take as long as 3 minutes to complete.
+    timeout = 210
+
     def __init__(self, *args, **kwargs):
         super().__init__(*args, **kwargs)
         self._vm = None
@@ -385,8 +388,9 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
+        # sleep for maximum of 200 seconds in order to accommodate
+        # even slower test setups.
+        max_sleep_time = time.monotonic() + 200
         while self._vm.is_running() and time.monotonic() < max_sleep_time:
             time.sleep(1)
 
-- 
2.34.1


