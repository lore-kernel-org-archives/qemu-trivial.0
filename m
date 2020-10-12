Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kS8d9-00034Z-EU
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 20:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kherman@inbox.lv>)
 id 1kS6mJ-0004pd-PW; Mon, 12 Oct 2020 18:58:52 -0400
Received: from shark3.inbox.lv ([194.152.32.83]:60426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kherman@inbox.lv>)
 id 1kS6mH-0002eF-N3; Mon, 12 Oct 2020 18:58:51 -0400
Received: from shark3.inbox.lv (localhost [127.0.0.1])
 by shark3-out.inbox.lv (Postfix) with ESMTP id E7667280497;
 Tue, 13 Oct 2020 01:58:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv; s=30062014;
 t=1602543521; bh=YURXcdd3KixEF1JRsw7xcPaqVLvQhhrS2Ji7AWyby/c=;
 h=From:To:Cc:Subject:Date;
 b=lY339KaCq+88J75H225bQjuxJuYv/waZ2GKYvB9dJQHtBNLRF/sOkepWYqkv8KppV
 aOeRtvRy0nJC+uQ4U7LuZPzTm4OPgHuoFXe7O371+DfnoyqQgAUjfY1Wck8SW2TG8d
 DZ+CGqFXX6UOAkWSNq9tRmHwZtUoKj6OFGbL154I=
Received: from localhost (localhost [127.0.0.1])
 by shark3-in.inbox.lv (Postfix) with ESMTP id E1C4928049E;
 Tue, 13 Oct 2020 01:58:41 +0300 (EEST)
Received: from shark3.inbox.lv ([127.0.0.1])
 by localhost (shark3.inbox.lv [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id D1X3p9Y2KjnD; Tue, 13 Oct 2020 01:58:41 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
 by shark3-in.inbox.lv (Postfix) with ESMTP id A8EFD280497;
 Tue, 13 Oct 2020 01:58:41 +0300 (EEST)
Received: from localhost.localdomain (net-93-145-34-111.cust.vodafonedsl.it
 [93.145.34.111]) (Authenticated sender: kherman@inbox.lv)
 by mail.inbox.lv (Postfix) with ESMTPA id 7B9F545B033;
 Tue, 13 Oct 2020 01:58:38 +0300 (EEST)
From: Klaus Herman <kherman@inbox.lv>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Klaus Herman <kherman@inbox.lv>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] hw/core/qdev-properties: Fix pci bus range in
 set_pci_host_devaddr()
Date: Mon, 12 Oct 2020 22:58:31 +0000
Message-Id: <20201012225831.72920-1-kherman@inbox.lv>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: G4mES3oDmH1DpsO6NYVt5v+GstuyV1kquSb9yrQ39QEqu8qlr7wGfWmJaPriWV35bg==
Received-SPF: pass client-ip=194.152.32.83; envelope-from=kherman@inbox.lv;
 helo=shark3.inbox.lv
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 18:58:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Oct 2020 20:57:29 -0400
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
X-List-Received-Date: Mon, 12 Oct 2020 22:58:52 -0000

---
 hw/core/qdev-properties-system.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 49bdd12..e3dca56 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -903,7 +903,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     bus = val;
 
     p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xff || e == p) {
         goto inval;
     }
     if (*e == ':') {
-- 
2.28.0


