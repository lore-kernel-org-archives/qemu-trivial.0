Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otTBy-00009D-QX
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 07:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otTBv-00008X-8G
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 07:31:27 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otTBt-0004nr-5o
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 07:31:26 -0500
Received: by mail-pf1-x42e.google.com with SMTP id k22so4794308pfd.3
 for <qemu-trivial@nongnu.org>; Fri, 11 Nov 2022 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFR6YxEE4rEtvs8RF1SO5pq8xTjjIT/h7YDoNcp+bW0=;
 b=LehIN7KZKl7ndDb50VRFfSUCPlOOhy1J2TXGpzc2L1rTUhIPbaUqoblaCYCLrXqzFW
 1FbbxCxh/L41gljA0iphUJzF2vKtjdupWOrEk3MqZSEG/8Zc4arsH9sTu0kNcwFw51tR
 B6d0NI80XriJMRQf1jlGJrNOGg52rAoeZUw2J68/C6A1myRCfKYUP2pDo72Bw5gSRxnc
 gbnMcUDudzxz8bepqTovHNWJ9ynS7wNMDDwY9bpAM9/cJ3d4Fr0HYFIKK9WDjRDYRK3o
 9HNIHV9F1w2Jg/lbvc3KL6bhs52b8KMib3gv+bwdIZI6FW3Qb2E5WRSYWbdMFReEo+Rt
 VlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFR6YxEE4rEtvs8RF1SO5pq8xTjjIT/h7YDoNcp+bW0=;
 b=UURwADQBs5aeI2Z6ccs9eIiATbZ74q7fGbKFJuDVEJReRLiLf7UP8WJT2a6FFu00Q6
 QceWbAlXS87NJD4cKMJJ+4as+KKgswe0oE3gkSylCqexLXlEgU07unXjOJxjCGWYwo0F
 dzwUz5ZV1fUfYc0unjVCFI20jQFlCW5g01+bf0oeAu10GfePmzbPyZesjShss9w8YfuG
 GJzaCatfpMMrpnaOdu7C07XPE7F7C5Nmbfj7VJK4PXFNiCYy7YoOYiMh0e1c08/ezv/m
 gPpGxdpmpg2n3NKBcSn/JhGp3dzFu2UF2ENgpFyhpTFUPHvg4FBogrdolpYFo0RGBjta
 2nsw==
X-Gm-Message-State: ANoB5pnbETDS/okFE+pXGEdliQMY3F4LrPwG+L1opHxT8V0o/iina1+A
 SIcznhzHS3X3BI6FiK5GvOwfNg==
X-Google-Smtp-Source: AA0mqf5nikmw782+/MDCAkLJqXRuTJ3wcpwTUoGBL/HhUDCyGd9DGnkof0IE3byv9YM5e9b3gMFvSg==
X-Received: by 2002:a05:6a00:10c8:b0:56d:2317:4565 with SMTP id
 d8-20020a056a0010c800b0056d23174565mr2417226pfu.54.1668169883321; 
 Fri, 11 Nov 2022 04:31:23 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.143.216])
 by smtp.googlemail.com with ESMTPSA id
 v129-20020a622f87000000b0056bf24f0837sm1465453pfv.166.2022.11.11.04.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 04:31:22 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
Date: Fri, 11 Nov 2022 18:01:08 +0530
Message-Id: <20221111123108.1231451-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Fri, 11 Nov 2022 12:31:27 -0000

Most of the changes are trivial. The bits test timeout has now been increased
to 110 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs.

CC: Thomas Huth <thuth@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 changed from v1: address Thomas' suggestions.

 docs/devel/acpi-bits.rst   | 7 +++----
 tests/avocado/acpi-bits.py | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index c9564d871a..2c776ab166 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
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


