Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfRv7-0004PW-9T
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2020 13:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRuo-0004Ai-7j; Sun, 31 May 2020 13:38:30 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRun-0004Fh-Ez; Sun, 31 May 2020 13:38:29 -0400
Received: by mail-wr1-x442.google.com with SMTP id j10so9152077wrw.8;
 Sun, 31 May 2020 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dv8k9OvX0sGDM6SnC2SEv28YQ5tgOTM9QioS6R+rf/M=;
 b=BVSryTZWMKqgtf1QMR74iA2a1/KO4Uy3SphIAK8LPJsyPkwckWfXDNibM+axg726DZ
 SOxrLOGVIxjQO1zqPrMp0H1sgXw3bFO+/tNCygs7RSfe47FZ6fzyl8luYeaYKphOjkVi
 OCMSIO+jJyhY8KvoRpSZImqE+0XAVhWggJCSkSwrg20N9ndbq6O399AVmjDCPvyP/Tb5
 dlQa2RKuW+AN6SwcOGxhziuKVbffRnR2ra0pRvolwWtCNXZiQU5hjwUjw+a/RC3Dn5mu
 mqyABHZCPs1C01fLaMueU7HT+U+bbJ4chOlXdK8XgTkduVhjcj2+7mnalCo1xT6WZsXh
 tIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dv8k9OvX0sGDM6SnC2SEv28YQ5tgOTM9QioS6R+rf/M=;
 b=q7KspmcktTqGB9y6FH3akrV5pgLecMeR8lvGT+Q9e4KkOXZ8eIckVNYGg9ZkX6RIga
 VPS/6j+aZxS+ND+dRGeK1Cb6LTnDahA2ksDebHZh7pQLsRkS9i9WZPNrGO3jJuIs5HQh
 MlevVwF9U/R7/0WTTjIDtPqKklufkpXurbRZhySD40u0w0yS3dZk6v3+oFwJ0OMreuAr
 fnQ5BVOJr7FFQmb6n/9juW6eeIpb0G/T6DvVSKOR9nMD6zdnV2X7NUVB5QRJVEtGQ58G
 GrDDwLS22l9ycPwsUIBzeIXbK23gEpn0IOlbnkDFsaFDIxxXbvt6kdn3AXH4nb/FX7yx
 KstQ==
X-Gm-Message-State: AOAM5318y4TwgjA2EefJ+xgJyOrxlIISFUietgCh/rwclK+DpNHAjODX
 N/EGNAtcDQra8zH2QsWtf16BBJBU
X-Google-Smtp-Source: ABdhPJwiBhhdiSv5xipwUBmxFfUuE7Js6srJ5I4x//n2LAjphXaXilwy/UiUFaG7+ZnnplrFb1ATaw==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr17874609wrq.362.1590946703877; 
 Sun, 31 May 2020 10:38:23 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/8] hw/pci/pci_bridge: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:10 +0200
Message-Id: <20200531173814.8734-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 31 May 2020 17:38:31 -0000

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3ba3203f72..3789c17edc 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -423,14 +423,14 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     }
 
     if (res_reserve.mem_non_pref != (uint64_t)-1 &&
-        res_reserve.mem_non_pref >= (1ULL << 32)) {
+        res_reserve.mem_non_pref >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: mem-reserve must be less than 4G");
         return -EINVAL;
     }
 
     if (res_reserve.mem_pref_32 != (uint64_t)-1 &&
-        res_reserve.mem_pref_32 >= (1ULL << 32)) {
+        res_reserve.mem_pref_32 >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: pref32-reserve  must be less than 4G");
         return -EINVAL;
-- 
2.21.3


