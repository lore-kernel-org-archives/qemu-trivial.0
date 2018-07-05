Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eZ-0004XF-3Z
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eX-0004VY-7q
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eW-00059O-C7
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:41 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eW-000597-7H; Thu, 05 Jul 2018 11:58:40 -0400
Received: by mail-qt0-x244.google.com with SMTP id a18-v6so7513421qtj.4;
	Thu, 05 Jul 2018 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yGtY8l/t2pCEmtTAH5145GE5iSKPEhTwEwNv0TUoqRs=;
	b=kQgZ/wVNq77VeXy1xKnIoTvdgew1KkhIZYyWnyQX6AKDwIuqRa4BFw7jSluFfFKoPJ
	m03/Bbap0jH40fIE9ytnJYkQjkCKxaeAXxJ/nYmEU2foIpszm+RFYzvgonP78UNTb099
	rOOy75Msk1seMMijJGaiAaWRF+r5v5VujiIV5N+lUwy8tl2LdWwM8F6d3BWgPnfXMk7B
	dF7xyXdIT55InATWKWwayfbppXMvnA9E7IpFDjCra4U2rY/g+VmqBxO0qcd4zwGTxJzI
	ef2mvadnPo26kgQVbq3pGeQmECSrnv9dCYWjqMV6UERXW610FV69tGB0RU9oQzxbb6Wt
	AAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=yGtY8l/t2pCEmtTAH5145GE5iSKPEhTwEwNv0TUoqRs=;
	b=KFTm2tZ3ivJP8ra7BjdWER4pdH9tjjKxvyivetkTfmDHC5gU0gy+oAcDKvcmv8aIoP
	wji5OjjJhqykyoi+az008ZcgNv7VMk2d976G1bM38vs33w5L7ZEKz3GWSkxNNOOYmX0n
	jW4F09NOAdOVyAWE8nrAlYSc5ZoILSpvl4chy73boH06tuUgVK3UoMfqJhv2F+2TWTw9
	5znvzmNK+Bkm/0VgdF8SrACmG0pHTmWIFHqg/HWC3LwYUI35P4/2fvykrmRy61p5T3c0
	URxzkvcMJIYno/yJStwR7lQpnFjvs2myBX5H+2wUNKPWOkRi+RRWK3gMyVzI5wlnCi1W
	YbRw==
X-Gm-Message-State: APt69E1pZNBjrdklw0CKsrXLGuNjtzSXrNaeJfyneHiGSty1gH3iHokr
	uCiORf2uSmdIjYaIwIC8HnnUpJul
X-Google-Smtp-Source: AAOMgpcITqE9mQOx8Hp3j3lxTs+idodPj95Cz+4+Ol0YSU1pbporjtV3FGh6K7eElyLFcOooHS77mQ==
X-Received: by 2002:aed:3a24:: with SMTP id
	n33-v6mr6011131qte.348.1530806319391; 
	Thu, 05 Jul 2018 08:58:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu,  5 Jul 2018 12:58:10 -0300
Message-Id: <20180705155811.20366-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 6/7] hw/pci-host: Remove useless
 parenthesis around DIV_ROUND_UP macro
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 15:58:42 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/piix.c | 2 +-
 hw/pci-host/q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 0e608347c1..317c0feca6 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -144,7 +144,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&d->pam_regions[i], i,
-                   pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[I440FX_PAM + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_set_enabled(&d->smram_region,
                               !(pd->config[I440FX_SMRAM] & SMRAM_D_OPEN));
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 02f9576588..b3a5b3036d 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -352,7 +352,7 @@ static void mch_update_pam(MCHPCIState *mch)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&mch->pam_regions[i], i,
-                   pd->config[MCH_HOST_BRIDGE_PAM0 + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[MCH_HOST_BRIDGE_PAM0 + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_transaction_commit();
 }
-- 
2.18.0


