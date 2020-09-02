Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNob-0005UW-0x
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoa-0005Sc-0F
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoY-0001iW-8I
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkSNcsho6DvA/UdVRqB8QxEaCIKTx2/65WBDZF1cLy4=;
 b=H/2lfFapDI/h9dx98jScKgSpeAX7lR9yIh3PPIRhrbeaAtyKT+JfhMDFyvXnF4HdC0n6Qw
 WAQI81im18BriGLrgfgnfJIexP7XmigF8kq0SDjC9MJ1lAhiFHWK0rdjMafL+qnmlHS7rG
 CU+wBodZPm6kfMvQIi1cnMrmB/SheB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-gR6sF67ONk-MLmaGEQlSDw-1; Wed, 02 Sep 2020 04:08:15 -0400
X-MC-Unique: gR6sF67ONk-MLmaGEQlSDw-1
Received: by mail-wm1-f69.google.com with SMTP id b14so1300326wmj.3
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MkSNcsho6DvA/UdVRqB8QxEaCIKTx2/65WBDZF1cLy4=;
 b=A9tgYso6hFrB4/XHvalCWb0u/XIqeFnXYQ54nO/P5bRaz+O0gN1BNjopgOPbVaX9V4
 /zu801v3Jjb1uHjdZLhbAIQ1O05Cv+Cf7jKh8eAPl6elZbSASNVg7l1t3blMDqN11TON
 e2tRmVETAo3mKKgGB9pHKZGq0qQXQ5MQqC29han47tbb3Mi2dNW4o9Ietvvqa2PKje6T
 lqSOTWecGzq714N46ftFt1ProOGkjIMTmvWbJ+RNP5QGamIvRMHkH36cWyonYtyDiX5K
 Ab4t6J3jjMx1lEJEhGOvSjUA+ksFPSey3d8GG3N8vEmPRclw+QRHObw3dpFkccx3Vw3Q
 /E0w==
X-Gm-Message-State: AOAM533x2MT3AHcNw63xFUN6fu+7Mj+lPllWGvJnNBQOVVgxELc266nw
 h66uk0AOdFHbOqbulBx+lSIW+kNumq+oJ59O8+h6+Y1g1wI8SXiiQArPb8wN5cyDr91EZqRlpoz
 H9NS/WVAK5R/Q/fs5hg==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr6180027wrn.357.1599034094564; 
 Wed, 02 Sep 2020 01:08:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpW0HtuwgcfIsS0tmj4gTF5kz37mBKmxNbyWVAJiejxYlEqVGG4KgJToxdFjgwM6KLilLpuQ==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr6180002wrn.357.1599034094363; 
 Wed, 02 Sep 2020 01:08:14 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q12sm5217629wrp.17.2020.09.02.01.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/5] hw/pci-bridge: Do not declare local variable only used
 for assertion
Date: Wed,  2 Sep 2020 10:07:58 +0200
Message-Id: <20200902080801.160652-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902080801.160652-1-philmd@redhat.com>
References: <20200902080801.160652-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:26:30
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
X-List-Received-Date: Wed, 02 Sep 2020 08:08:20 -0000

This variable is used once in an assertion. Remove single
declaration and access directly in the assert().

See in "qemu/osdep.h":

 *                                  [...] disable assertion is not
 * supported upstream so the risk is all yours.  Meanwhile, please
 * submit patches to remove any side-effects inside an assertion, or
 * fixing error handling that should use Error instead of assert.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/pci-bridge/pci_bridge_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 4a080b7c7bf..10c521085d7 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -224,9 +224,7 @@ void pci_bridge_dev_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void pci_bridge_dev_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
-    PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
-
-    g_assert(shpc_present(pci_hotplug_dev));
+    g_assert(shpc_present(PCI_DEVICE(hotplug_dev)));
     shpc_device_unplug_cb(hotplug_dev, dev, errp);
 }
 
-- 
2.26.2


