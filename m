Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mO5xL-0001hV-Dp
	for mharc-qemu-trivial@gnu.org; Wed, 08 Sep 2021 18:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO5xI-0001gL-IF
 for qemu-trivial@nongnu.org; Wed, 08 Sep 2021 18:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO5xD-0006B5-VR
 for qemu-trivial@nongnu.org; Wed, 08 Sep 2021 18:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631139721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sox0ErEJCzF5se9cHfEhb93bZQg1lpJOq2y21MBeWHA=;
 b=CsdPRfbfDX/6U+Aik0OSORJWB6TsT949ixkEegwDXqrLk4NNlEnx2fHvhleDoR2yBSEAXU
 44vFqMBQAS6CU5/0eGAJboYYyLsOTHs0Y9zWrbY6YJ7A49gwhddcyuSPKjtE5x9vX+r5yP
 Le/OABOymyBsMxHcIofQRAsKpRBRzDk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-zbEirFfgM1-Oj3q_nOT5Uw-1; Wed, 08 Sep 2021 18:22:00 -0400
X-MC-Unique: zbEirFfgM1-Oj3q_nOT5Uw-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1439447wmc.3
 for <qemu-trivial@nongnu.org>; Wed, 08 Sep 2021 15:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sox0ErEJCzF5se9cHfEhb93bZQg1lpJOq2y21MBeWHA=;
 b=jG/FGw6LNXd+1+nPO6VNkzrNyPZcdE45aRTtxu5nt6j7fmhY22DjFrRtJGX8mi4S3s
 vPBXs1d085XvkGq2Gd6XH3MGivWMuRZ1VSo4UIuko3gaQ7ZRDa1f84gkDtmJiiB4cyyA
 k2H1S8kWhIZxufMj9Sxgo3OqgpCy0/JxZGayK/457VHcA5/ACvDxVCCPe+B1amUlwTrf
 9dlkwaL6XTRvPn2cohOtjkrcrKd2+crADsYlwS6e8NMY9S1ehvASIMXyCTuL4yHt4ijD
 C1a31z/hzU5CIf6KAljT4AGRgQNGJH6d6yPI6qJVbtEQRK1nXtUcbg6X1obCrMd2O9yb
 or/A==
X-Gm-Message-State: AOAM5321MWu5DchC6nAnGixY9u1VwhQt7XC+Z/Wb+DaIj/+l4/cjN5rY
 G/RBIG4iXMtf6pEqebOnmFPSSxz1kM4XxrzlBwPpT/gsG5MebflYa+qpzhlFZimg8TQ0W1b5xQK
 TCviUf7a+bXJMVU4Vfw==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr524050wrf.312.1631139719457; 
 Wed, 08 Sep 2021 15:21:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw87ledNau73FknFQ6WyYJvP/da0ZEunenrueghy0KHVvY6a1jgfQJT8IohmtFgXzXveCCzg==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr524036wrf.312.1631139719280; 
 Wed, 08 Sep 2021 15:21:59 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z19sm3881594wma.0.2021.09.08.15.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 15:21:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/i386/acpi-build: Fix a typo
Date: Thu,  9 Sep 2021 00:21:57 +0200
Message-Id: <20210908222157.2377282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 08 Sep 2021 22:22:10 -0000

Fix 'hotplugabble' -> 'hotpluggabble' typo.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a5..478263e12c9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotplugabble_address_space_size =
+    ram_addr_t hotpluggabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
 
@@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotplugabble_address_space_size) {
+    if (hotpluggabble_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, nb_numa_nodes - 1,
+                          hotpluggabble_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.31.1


