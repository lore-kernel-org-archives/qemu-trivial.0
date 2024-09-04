Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sllGb-00029E-JQ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Sep 2024 04:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sllGZ-00025r-6i
 for qemu-trivial@nongnu.org; Wed, 04 Sep 2024 04:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sllGX-00084a-Bf
 for qemu-trivial@nongnu.org; Wed, 04 Sep 2024 04:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725438084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=S5nZ0X+eAS36sBXtdeZjgNSJh8wYU6415sme3a/niUk=;
 b=N2WzXpJD+AdlGnU+0EngMvYdr1d8dE5+tbuZwYFEQuexb4yf1QpAgtTHESLdv2lZ/f9Tjb
 qUMN8o5AvRQhAOg2SyxINBtr8BNYYKJ2XIRyX2ji+Nq0Bqtvoq8EQPN5Lc/Uiq2DfKqrbE
 WEv/ix7/Bhde7rIg3YA3Ut/gwc6BJFQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-qc64QcfzNfydrhvSSdWiYQ-1; Wed,
 04 Sep 2024 04:21:21 -0400
X-MC-Unique: qc64QcfzNfydrhvSSdWiYQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5209D1955BC1; Wed,  4 Sep 2024 08:21:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.194.48])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2DC71955D42; Wed,  4 Sep 2024 08:21:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] tests/qtest/meson.build: Add more CONFIG switches checks for
 the x86 tests
Date: Wed,  4 Sep 2024 10:21:15 +0200
Message-ID: <20240904082116.209260-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 04 Sep 2024 08:21:27 -0000

When configuring QEMU with "--without-default-devices", currently a lot
of the x86 qtests are failing since they silently assume that a certain
device or the i440fx pc machine is available. Add more checks for CONFIG
switches here to not run those tests in case the corresponding device is
not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 486974cad7..587e1dc47e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -49,9 +49,15 @@ qtests_filter = \
 qtests_i386 = \
   (slirp.found() ? ['pxe-test'] : []) + \
   qtests_filter + \
-  (have_tools ? ['ahci-test'] : []) +                                                       \
+  (config_all_devices.has_key('CONFIG_ACPI_VMGENID') ? ['vmgenid-test'] : []) +             \
+  (config_all_devices.has_key('CONFIG_AHCI_ICH9') and have_tools ? ['ahci-test'] : []) +    \
+  (config_all_devices.has_key('CONFIG_AHCI_ICH9') ? ['tco-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_FDC_ISA') ? ['fdc-test'] : []) +                      \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['fw_cfg-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I440FX') ? ['i440fx-test'] : []) +                    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['ide-test'] : []) +                       \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['numa-test'] : []) +                      \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['test-x86-cpuid-compat'] : []) +          \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +            \
@@ -96,21 +102,15 @@ qtests_i386 = \
   qtests_pci +                                                                              \
   qtests_cxl +                                                                              \
   [
-   'ide-test',
    'hd-geo-test',
    'boot-order-test',
-   'fw_cfg-test',
    'device-plug-test',
    'drive_del-test',
-   'tco-test',
    'cpu-plug-test',
-   'vmgenid-test',
    'migration-test',
-   'test-x86-cpuid-compat',
-   'numa-test'
   ]
 
-if dbus_display
+if dbus_display and config_all_devices.has_key('CONFIG_VGA')
   qtests_i386 += ['dbus-display-test']
 endif
 
-- 
2.46.0


