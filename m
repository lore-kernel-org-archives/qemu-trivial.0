Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOyFk-00073d-8f
	for mharc-qemu-trivial@gnu.org; Sat, 11 Sep 2021 04:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyFi-00072W-1r
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 04:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyFf-0006ba-26
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 04:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631348440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vx4nte4uvXOqJ0OSbI8JJD7U5Dv7AVbtB8G0DHVhvzA=;
 b=GgghRYX21lj1e4pJ5EKNLJA31Ih4HaQpEsJwnmhnfqqAmTSZHLp7Ceb5plh2SaNL8PMFZ4
 zl/e7qLwExM0ZnK3YYky1wW23jCkuBEK8Gmntj4bohACVbbCRiTSl066LXWmj7QwCGjNZ8
 WypM0xqsMWKz0kzyLNj5EFhHVQPt1VY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-vwNmqY38OUuawVJ-LZlBog-1; Sat, 11 Sep 2021 04:20:39 -0400
X-MC-Unique: vwNmqY38OUuawVJ-LZlBog-1
Received: by mail-wm1-f72.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so1765602wms.7
 for <qemu-trivial@nongnu.org>; Sat, 11 Sep 2021 01:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vx4nte4uvXOqJ0OSbI8JJD7U5Dv7AVbtB8G0DHVhvzA=;
 b=17cKGWPcvKXOvhwF16yUkIf+pqpgXhAnMmv4uA+kDDl0eUsgCbV2r1E1DCO/NtOwfP
 aHklkcN041w6odZ4C6pRd7Pjp6yn63vMuBX5k1V13q08GzT9cjNf+WUDDPOxchSoXgYr
 L054/XOKQm+sEVzJw8IoSTSkmSED7qACTxpcIxvi5q2gC81RJgXETeOM52NvaN5V965+
 UoDkZyhWIcMB9u5pWtPIk2dzN4tFrZKdIjpV/goEqoCdiy/30MAyXH3tqa3gxHLzIbmE
 C2FMC7JXRK+XyeyjhlQgbxJT3O7zFybXwJb34PoMgYUtWCHS8sQvJISP1CXLoC1nzmtq
 XoDg==
X-Gm-Message-State: AOAM532kX78HBZCm87Pe/7R9zdU7QsYEll2vrSZvDMJEmc+aQFv8GULp
 wH2WhmUKhivBZdCyqsz9uN9+nD4dwEYxHnbmRoVArymK7ugGqziRtaFUwvnqQQHAUXBA0YgBm/8
 E5YgUIaM2IYYrCsbG1Q==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr1934526wru.416.1631348438570; 
 Sat, 11 Sep 2021 01:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTKL2hgGfzpAuT/Gj6gUV1MSbAu/5Bda0VxeRQm0zomrVUhZlTHAfGvZqU2E+hEEeggu8xCQ==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr1934507wru.416.1631348438370; 
 Sat, 11 Sep 2021 01:20:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p5sm1075939wrd.25.2021.09.11.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 01:20:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] hw/i386/acpi-build: Fix a typo
Date: Sat, 11 Sep 2021 10:20:36 +0200
Message-Id: <20210911082036.436139-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 11 Sep 2021 08:20:46 -0000

Fix 'hotplugabble' -> 'hotpluggable' typo.

Reviewed-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v1 still had a typo =) (Volker Rümelin)
---
 hw/i386/acpi-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a5..dfaa47cdc20 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotplugabble_address_space_size =
+    ram_addr_t hotpluggable_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
 
@@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotplugabble_address_space_size) {
+    if (hotpluggable_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, nb_numa_nodes - 1,
+                          hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.31.1


