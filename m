Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e9EcI-00023n-On
	for mharc-qemu-trivial@gnu.org; Mon, 30 Oct 2017 14:16:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9EcB-00020B-UQ
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Ec5-0001Hj-Fa
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:16:45 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Ebx-00014O-55; Mon, 30 Oct 2017 14:16:33 -0400
Received: by mail-qt0-x243.google.com with SMTP id 8so17609419qtv.1;
	Mon, 30 Oct 2017 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NAngpiz2T14My7xRCFTTHIl77LItBmfCWQua3phzSTU=;
	b=dfq6ZjImZuM4Qs32JmdjPBm8Cq7qaqtDZ1hwSkS2ukLAJvFKFXs42xizvnBSxiI0MT
	K8QcqsL9k4x7kAfocNWxbZmEUzt812SJFKmwydurAFlMOa9GugB5lD0DSlWgilqXBLNf
	OGIRanLafmEiPjm3Bt8kJSjtrEofEMs4w5XjbYLkUszN6xtBPEdFYt9zv34rcecmtuu8
	Bw8FurDEg+fwYcLhRecfOcqZRExhrb1t/k30p+p+NRDVYFJmWKlH292l5aZhd9EAW0PG
	Qic6hPahNEGY6/TcrGchP9NPhMzswanQIUH7Ff76Fm0q9JKwnRrCYjdplemrcnCmS8DE
	1/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=NAngpiz2T14My7xRCFTTHIl77LItBmfCWQua3phzSTU=;
	b=Z2PZSgr7Vw4QiVZRWJRorqsp1T/qNUzFKxoP00uzr9L7I9zWbGfBiHbV55P2ISOmDa
	Wl5Pk9RjCvhMv0XEwR8+31IYaX0YF1p8OtQp988tcr5o7rsrZde5NmBhsqy1pkHqJvP9
	w483DqP2psFgXOKds/94Ey0ThmFGXrC4iUdDOnl0LfibDNoK5tDkV7JumIggLf5jWD6j
	Ic/k6NvpMKWX9dERJ3PKAmR9jDASgRERqncnIBPfn6qN1sgPExRGMqJgNnirVMA5IeFT
	ihezyKvN14kWVBfoHGJgHg0WvRYWRYCA0CK37+Rso7UN8USxtvN+N1SoMTOJxTpMT2EQ
	c/hA==
X-Gm-Message-State: AMCzsaX+Ezgk0HD05Ot3u+KXM9NPrUx4GhkpOt9aMsodxLvLe6TE4yQ5
	I8ysE8WBMhUbq8Utd/WuBC8=
X-Google-Smtp-Source: ABhQp+RBJ6vLagSS4SE0OzPuooDG89ya0it3gUbKrOf7vlFTwPsJGfHSPYLtBFAjBfGHN5vo0/BB2A==
X-Received: by 10.200.53.200 with SMTP id l8mr16056707qtb.49.1509387392611;
	Mon, 30 Oct 2017 11:16:32 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	d1sm10075000qka.78.2017.10.30.11.16.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 11:16:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Emilio G . Cota" <cota@braap.org>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Date: Mon, 30 Oct 2017 15:14:59 -0300
Message-Id: <20171030181459.1951-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [RFC PATCH] vl: only display available accelerators
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
X-List-Received-Date: Mon, 30 Oct 2017 18:16:52 -0000

examples configuring with '--enable-kvm --disable-tcg'

- before

  $ qemu-system-x86_64 -accel help
  Possible accelerators: kvm, xen, hax, tcg

  $ qemu-system-x86_64 -accel tcg
  qemu-system-x86_64: -machine accel=tcg: No accelerator found

  # qemu-system-x86_64 -accel hax
  qemu-system-x86_64: -machine accel=hax: No accelerator found

- after

  $ qemu-system-x86_64 -accel help
  Possible accelerators:
    xen
    kvm

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
since RFC:
  - use much cleaner object_class_get_list(TYPE_ACCEL, false)

 vl.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index ec299099ff..0f13641715 100644
--- a/vl.c
+++ b/vl.c
@@ -2764,6 +2764,39 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
     exit(!name || !is_help_option(name));
 }
 
+static void accel_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    const char *typename = object_class_get_name(oc);
+    int len;
+
+    if (!qtest_driver() && !g_strcmp0(typename, ACCEL_CLASS_NAME("qtest"))) {
+        return; /* used by test cases */
+    }
+
+    len = strlen(typename) - strlen("-" TYPE_ACCEL);
+    if (len > 0) {
+        error_printf("  %.*s\n", len, typename);
+    }
+}
+
+static void accel_parse(const char *name, QemuOpts *accel_opts)
+{
+    const char *optarg = qemu_opt_get(accel_opts, "accel");
+    GSList *list;
+
+    if (!is_help_option(optarg)) {
+        return;
+    }
+
+    list = object_class_get_list(TYPE_ACCEL, false);
+    error_printf("Possible accelerators:\n");
+    g_slist_foreach(list, accel_list_entry, NULL);
+    g_slist_free(list);
+
+    exit(0);
+}
+
 void qemu_add_exit_notifier(Notifier *notify)
 {
     notifier_list_add(&exit_notifiers, notify);
@@ -3881,11 +3914,7 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_accel:
                 accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
                                                      optarg, true);
-                optarg = qemu_opt_get(accel_opts, "accel");
-                if (!optarg || is_help_option(optarg)) {
-                    error_printf("Possible accelerators: kvm, xen, hax, tcg\n");
-                    exit(0);
-                }
+                accel_parse(optarg, accel_opts);
                 opts = qemu_opts_create(qemu_find_opts("machine"), NULL,
                                         false, &error_abort);
                 qemu_opt_set(opts, "accel", optarg, &error_abort);
-- 
2.15.0.rc2


