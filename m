Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOc-00076t-Ey
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOa-00074z-Na
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOZ-0004uz-QB
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:08 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:56429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOU-0004qf-CO; Fri, 06 Oct 2017 19:51:02 -0400
Received: by mail-qt0-x244.google.com with SMTP id 34so17235062qtb.13;
	Fri, 06 Oct 2017 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/OTcOUTISd6uUSqk1km/zVSFqPQVLmTCnrhQ2HE73Z0=;
	b=YaMm694R1AMJY95ncsojic8SOqaOekl8ibuoe+CGN9Cfzzm6xUGaZrAYt4onZF7EZN
	KJuyq+HEcLiQYR2zDYxklvxgpsY0E5yZmrRfBdkWRNbhDc14Vd4B4m9QYh7LZx7I27av
	i9fTEfxLRjk2GHQloMBKtj/AA+uBQ9MkEHxoXSMZX9QloI+TdIcZJginaPseb0/R2NVe
	+IGfgnU2PqJQqNflf+W/avyNVbk7VHAwsm2gVpV/o5W7eqsoGYG0JaG+fBqxAgUhmY3i
	YLsyShqQ+EHEcOwUpLqJMwG6ZLKS46PoOYlXLntx5B4/g4csHA3HC3JPKranRwFJlX/1
	Sj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/OTcOUTISd6uUSqk1km/zVSFqPQVLmTCnrhQ2HE73Z0=;
	b=hKvspLpwsB/E/Spz3yKaPOTHoRIBMM4U/O7IQAsqsP4/hsLjB2en7pezdp5swq0PGk
	O87Kz6jHO175WDqxqg6MHqlNlJdwdaY60KFCtZJ8RzXzryjX00Cqpe7FntiCTvxydlv9
	iVXUjtAYbwv5Ax1nVonKW0e2H8Nm53Ugc+Lel890o9BdLM6LOYLXK9oBIm9RyePa7zjF
	sViciZMwA9UyKfu33QpVhFyUpvcRTKHu2Ft7xqHRcaj1mPwv7a7X+Jy3B1QhwnGaylvF
	AXTfP/DsIwvcrPHUZ11LJ3OyPIOiBnW+vvT526atQX2k2QwQj4zLmtU8uOeibSb0Qc7Y
	scKQ==
X-Gm-Message-State: AMCzsaWMm2es1RN0DzWfBnKUT0qUy+AbNsnn6axiSC9Abad+7JBMDv5j
	ZrkUu/WIOHsxplY1uIT6XUQ=
X-Google-Smtp-Source: AOwi7QDESmfJ0G4ShG0y6Y99STx6FnHELKxp7IZ0Fn8GMDF4BpNOeSu76dhu2QGJG7hOt7oH9OADBw==
X-Received: by 10.200.45.89 with SMTP id o25mr5468693qta.337.1507333861829;
	Fri, 06 Oct 2017 16:51:01 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:03 -0300
Message-Id: <20171006235023.11952-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 08/88] BT: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:09 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: another use in hw/bt/l2cap.c]
---
 bt-host.c     | 2 +-
 bt-vhci.c     | 2 +-
 hw/bt/core.c  | 4 ++--
 hw/bt/hci.c   | 4 ++--
 hw/bt/l2cap.c | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/bt-host.c b/bt-host.c
index 2f8f631c25..ad9e45ea43 100644
--- a/bt-host.c
+++ b/bt-host.c
@@ -177,7 +177,7 @@ struct HCIInfo *bt_host_hci(const char *id)
     }
 # endif
 
-    s = g_malloc0(sizeof(struct bt_host_hci_s));
+    s = g_new0(struct bt_host_hci_s, 1);
     s->fd = fd;
     s->hci.cmd_send = bt_host_cmd;
     s->hci.sco_send = bt_host_sco;
diff --git a/bt-vhci.c b/bt-vhci.c
index 9d277c32bf..a885e2b8b9 100644
--- a/bt-vhci.c
+++ b/bt-vhci.c
@@ -157,7 +157,7 @@ void bt_vhci_init(struct HCIInfo *info)
         exit(-1);
     }
 
-    s = g_malloc0(sizeof(struct bt_vhci_s));
+    s = g_new0(struct bt_vhci_s, 1);
     s->fd = fd;
     s->info = info ?: qemu_next_hci();
     s->info->opaque = s;
diff --git a/hw/bt/core.c b/hw/bt/core.c
index 615f0af073..281bb40501 100644
--- a/hw/bt/core.c
+++ b/hw/bt/core.c
@@ -55,7 +55,7 @@ static void bt_dummy_lmp_acl_resp(struct bt_link_s *link,
 /* Slaves that don't hold any additional per link state can use these */
 static void bt_dummy_lmp_connection_request(struct bt_link_s *req)
 {
-    struct bt_link_s *link = g_malloc0(sizeof(struct bt_link_s));
+    struct bt_link_s *link = g_new0(struct bt_link_s, 1);
 
     link->slave = req->slave;
     link->host = req->host;
@@ -135,7 +135,7 @@ struct bt_scatternet_s *qemu_find_bt_vlan(int id)
         if (vlan->id == id)
             return &vlan->net;
     }
-    vlan = g_malloc0(sizeof(struct bt_vlan_s));
+    vlan = g_new0(struct bt_vlan_s, 1);
     vlan->id = id;
     pvlan = &first_bt_vlan;
     while (*pvlan != NULL)
diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 476ebec0ab..08e65eb62e 100644
--- a/hw/bt/hci.c
+++ b/hw/bt/hci.c
@@ -742,7 +742,7 @@ static void bt_hci_connection_reject_event(struct bt_hci_s *hci,
 static void bt_hci_connection_accept(struct bt_hci_s *hci,
                 struct bt_device_s *host)
 {
-    struct bt_hci_link_s *link = g_malloc0(sizeof(struct bt_hci_link_s));
+    struct bt_hci_link_s *link = g_new0(struct bt_hci_link_s, 1);
     evt_conn_complete params;
     uint16_t handle;
     uint8_t status = HCI_SUCCESS;
@@ -2158,7 +2158,7 @@ static void bt_hci_destroy(struct bt_device_s *dev)
 
 struct HCIInfo *bt_new_hci(struct bt_scatternet_s *net)
 {
-    struct bt_hci_s *s = g_malloc0(sizeof(struct bt_hci_s));
+    struct bt_hci_s *s = g_new0(struct bt_hci_s, 1);
 
     s->lm.inquiry_done = timer_new_ns(QEMU_CLOCK_VIRTUAL, bt_hci_inquiry_done, s);
     s->lm.inquiry_next = timer_new_ns(QEMU_CLOCK_VIRTUAL, bt_hci_inquiry_next, s);
diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
index e342045140..94f5067d6e 100644
--- a/hw/bt/l2cap.c
+++ b/hw/bt/l2cap.c
@@ -1241,7 +1241,7 @@ static void l2cap_lmp_connection_request(struct bt_link_s *link)
 
     /* Always accept - we only get called if (dev->device->page_scan).  */
 
-    l2cap = g_malloc0(sizeof(struct slave_l2cap_instance_s));
+    l2cap = g_new0(struct slave_l2cap_instance_s, 1);
     l2cap->link.slave = &dev->device;
     l2cap->link.host = link->host;
     l2cap_init(&l2cap->l2cap, &l2cap->link, 0);
@@ -1262,7 +1262,7 @@ static void l2cap_lmp_connection_complete(struct bt_link_s *link)
         return;
     }
 
-    l2cap = g_malloc0(sizeof(struct l2cap_instance_s));
+    l2cap = g_new0(struct l2cap_instance_s, 1);
     l2cap_init(l2cap, link, 1);
 
     link->acl_mode = acl_active;
@@ -1358,7 +1358,7 @@ void bt_l2cap_psm_register(struct bt_l2cap_device_s *dev, int psm, int min_mtu,
         exit(-1);
     }
 
-    new_psm = g_malloc0(sizeof(*new_psm));
+    new_psm = g_new0(struct bt_l2cap_psm_s, 1);
     new_psm->psm = psm;
     new_psm->min_mtu = min_mtu;
     new_psm->new_channel = new_channel;
-- 
2.14.2


