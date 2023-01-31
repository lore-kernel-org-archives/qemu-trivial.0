Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMpD4-00069A-0R
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 06:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD0-00060Y-SL; Tue, 31 Jan 2023 06:53:54 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpCz-0002Kz-CX; Tue, 31 Jan 2023 06:53:54 -0500
Received: by mail-ed1-x534.google.com with SMTP id n6so11500332edo.9;
 Tue, 31 Jan 2023 03:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61dfWITivyOsWdkZHZZ+3qa///PN8JSZFtxNj4kIeZg=;
 b=KSZGjo0ogoBSW81ja62iNyQnTKVx/1uFWIHRfJwBHlRbidU0NFTtzbKt7Gu6RevuA5
 lnSQTI+CiPmweXXiQMfa8DUHU2mX1bJ2aphF4/TfUBz8CtH0txov3EzwzMXcNTnfGWcG
 AzyJgVGAOle2Ny7bxJ6BksGHjAgV2lBBUHJVL+J+b46RcKaDFXH28+xE/5YgdfSz4Ir1
 uOtv9bNgyhBK5f8dZauWA52oxBZZD7VgBxjSFnXTFJmTtCiFkpaJX36k+zfhWSVjEDuU
 OTOxkRWkd5kclUUgUjbOIScMzCsXD1W0lBIXg4ZrbhGo6tXrdnrCTAzKUQLTCGzSRpHR
 vPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61dfWITivyOsWdkZHZZ+3qa///PN8JSZFtxNj4kIeZg=;
 b=p6b8YcBtmEEzPfOYTAkRKQazUskZL0Q0Ww3R+1sgBtHyVea6NNeGUk7QqrDX4BCO/e
 r4G7G5MfnCYB0ueb1/3XbU4S6o7mVpSl2BfBWmosjcS8Mpp11s//kIrCddYUENQ8vgcq
 m8P07ScS2msl5EMg1f7Z+zCBwcZPkfZuZn7Soqt4sWovT3Bl6ZVRVEw06N4E2Ynw1oDr
 OYvWtS22y3W4dEdDkcjR/SaTFNySn4OE52ycaEthvaFJfe7lX1PPdFHMvvUmvU45B9wU
 VKDJN9oajqF3oWSQJtkcKYEpQghXCYrpYrua+FkmGcQMWDclX/Gi4Sda743i0SsfzBXq
 w+2g==
X-Gm-Message-State: AO0yUKWOpDpBI7MOcPkDapNwnjT3Mlg6ztJri+SJhcyihv4/u0vcWQhq
 UBhsKW5+75RD2AZ9H1IBGzzji9FkYTs=
X-Google-Smtp-Source: AK7set9syy5v0Rd1yeW+Lwmz/PLeidz0LNhVsYV08ziIDnVfh6ZmZ3oPdnBB0U52sAPzuAq3QpT8nw==
X-Received: by 2002:a05:6402:43cc:b0:49e:a0f7:9a75 with SMTP id
 p12-20020a05640243cc00b0049ea0f79a75mr3366934edc.12.1675166031354; 
 Tue, 31 Jan 2023 03:53:51 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:51 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 02/20] hw/pci-host/q35: Inline sysbus_add_io()
Date: Tue, 31 Jan 2023 12:53:08 +0100
Message-Id: <20230131115326.12454-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 11:53:55 -0000

sysbus_add_io() just wraps memory_region_add_subregion() while also
obscuring where the memory is attached. So use
memory_region_add_subregion() directly and attach it to the existing
memory region s->mch.address_space_io which is set as an alias to
get_system_io() by the q35 machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 26390863d6..fa05844319 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
     /* register q35 0xcf8 port as coalesced pio */
-- 
2.39.1


