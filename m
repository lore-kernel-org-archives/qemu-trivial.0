Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNpM-0007Tk-N8
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNpK-0007Nu-Fb
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:09:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47839
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNpH-0001pw-JX
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7jMiaMP3JTj9ArNnNz3t5AwgDboPnJ3Xc9W3czcTi0=;
 b=gSYrSyQqFeKPNRUVg5xs9FTlYxgBJGnxpo+/lU6K8i5m0VwgPIon8qF0XBHbcmFO+d4W60
 tC18G0y9BC9u3r1m3yQ0Ots9POuhay6jUHgDaJjuhLbf8YbivOMY/FYLsSVAbj8j7wCwsC
 8Tr0xS/5htNwMqUPE920djacyz0NdH8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-BRt0971ROoWM-6005ZAlgA-1; Wed, 02 Sep 2020 04:08:21 -0400
X-MC-Unique: BRt0971ROoWM-6005ZAlgA-1
Received: by mail-wm1-f72.google.com with SMTP id c198so1532648wme.5
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7jMiaMP3JTj9ArNnNz3t5AwgDboPnJ3Xc9W3czcTi0=;
 b=js9EqpTZeiF18zL0BhqCcJ/ySvjHYBpLh53Sx8CEJd+/QMolT5/aRCwzUpb6t/fJ7Q
 AsLjjD6zyE2qEQFLBDd2eIGu361FFXJMiuaYEeCugm4BYd6pLm75VcQcVgusGU+9vhPc
 CKWDgqAUPK/XdPrkWbcWye9Q8QyO335nkLZXoOJ4unSHvixXLQIc/jznTv9jLJCoonvH
 U8fe5Hs2EM1rJlGkpLSzaUtIswqCRdx8iGQkPN0jZcanv5CwYJ84ZEr6pNmXrvQyR2Oq
 bukmJEOd0YIyYE1h6OX6nfX7d3jD1j3JIpFR6PxTj/lNQNjV+1N/DpwuyCEACqhF68VO
 JxFQ==
X-Gm-Message-State: AOAM532cD3v1W2DHjYuYv0o5SKYxBN/hqwVaQSwR6mUJb4s0KPXuTozX
 GvmVUgvR5d9aTeCJx+I93k2kbwxdP9KU/vryPVFr+gXFXwGB3Xmh0UetL2MPVLRE2l8Zl+NL9SU
 75h90/p4oFCvcC6jTTg==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr5474566wru.33.1599034099693; 
 Wed, 02 Sep 2020 01:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFGqDIQtOUHFPGW0jIgS+ZVOQ2QN9WUI/lkiDw5q/wumx2PXzT/kP7sMdPSLVt6uHcfzlU6Q==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr5474545wru.33.1599034099473; 
 Wed, 02 Sep 2020 01:08:19 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id 70sm5642929wme.15.2020.09.02.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/5] hw/ppc/spapr: Do not declare local variable only used for
 assertion
Date: Wed,  2 Sep 2020 10:07:59 +0200
Message-Id: <20200902080801.160652-4-philmd@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Sep 2020 08:09:06 -0000

This variable is used once in an assertion. Remove single
declaration and access directly in the assert().

See in "qemu/osdep.h":

 *                                  [...] disable assertion is not
 * supported upstream so the risk is all yours.  Meanwhile, please
 * submit patches to remove any side-effects inside an assertion, or
 * fixing error handling that should use Error instead of assert.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/spapr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dd2fa4826b3..6447a5b3808 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -628,7 +628,6 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
 static int spapr_dt_memory(SpaprMachineState *spapr, void *fdt)
 {
     MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     hwaddr mem_start, node_size;
     int i, nb_nodes = machine->numa_state->num_nodes;
     NodeInfo *nodes = machine->numa_state->nodes;
@@ -670,7 +669,7 @@ static int spapr_dt_memory(SpaprMachineState *spapr, void *fdt)
     if (spapr_ovec_test(spapr->ov5_cas, OV5_DRCONF_MEMORY)) {
         int ret;
 
-        g_assert(smc->dr_lmb_enabled);
+        g_assert(SPAPR_MACHINE_GET_CLASS(spapr)->dr_lmb_enabled);
         ret = spapr_dt_dynamic_reconfiguration_memory(spapr, fdt);
         if (ret) {
             return ret;
-- 
2.26.2


