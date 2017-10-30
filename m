Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e9Eh9-0004yc-5h
	for mharc-qemu-trivial@gnu.org; Mon, 30 Oct 2017 14:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Eh5-0004vz-8U
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Eh4-00046I-6L
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:21:51 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:48864)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Egw-00044Y-Gf; Mon, 30 Oct 2017 14:21:42 -0400
Received: by mail-qk0-x243.google.com with SMTP id d67so17330431qkg.5;
	Mon, 30 Oct 2017 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3s2TNKK9nVaBozO6isVF13EjBSzDIr9nty/k8WuDd04=;
	b=UcTSqPRxL576+DykgiFjRzjYtbdcKM7pMe6lI4ZBnmJMxPP3XuoqxFRUUbl6wH1/Ll
	agxkLz8bZ87KWceKmhqKOijm61uHEiybY9Jc+Pbm/NfwU0eeL7skm2tQ7cMYKhx3Vxn7
	ECGWg42xGpa6oXKkRPq9jIfZ9jFxuh6P9tgeLe+ThEHY40DIsKx8h6T9QIbYyX0O/kk+
	fzktUPfsB4ASDWJ6aovDbb1HuUhA7uVe9wL+EOuok2HTgIG1hXP1QnjoroLs0cNyuRrA
	ml71SCfigEJ05C8z+hCwIWwCHOb3g66dvqognyJUaRadA1o1P15LgprDhqPm1zx2h6AH
	CdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=3s2TNKK9nVaBozO6isVF13EjBSzDIr9nty/k8WuDd04=;
	b=AKkb6nczJKbvRFHPyZowRHizYhk22h5mgYUcOJp5nu13wWDi1pGrQS8wsgpx4HgG+4
	TA9euS4FdcaNwEtDfMK9l52+leES6vyVmVs4I1+EbFglP9NG8fqudyHokywEyzBsZxD5
	divfKvEPeYlJHwRRKcTAGTXNuDcZ981WZKuR/hAbahraE5M9dNEpyihAvQb01uc6kXWY
	u80lqBYNz+2XL13AKsrscWWFpvA7JrAww7NFlwbATV+iO32W83RhDtlPqxEV4hte5l+x
	C8BS/EWgScDK/r4wNcqLSQFbB1tK2SYXz67nvjw033HaB6iGFiTZrmF26n6zfl8Arofv
	ckVg==
X-Gm-Message-State: AMCzsaV+4/c9W3euQybwao8AqO1Uyc7/fakMoPRW153nZS0vupRLxTBK
	WaWgiB6E4bYeekr+xAS/828=
X-Google-Smtp-Source: ABhQp+Rc1r5A9OckfovV8+XM1LUtaBHn3aE0PSW+THnNk0LsgwD5mPWfTiqXngMO/B1K7aCqOxyiDw==
X-Received: by 10.55.214.142 with SMTP id p14mr14594420qkl.199.1509387701715; 
	Mon, 30 Oct 2017 11:21:41 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	c10sm9978240qtj.29.2017.10.30.11.21.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 11:21:40 -0700 (PDT)
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
Date: Mon, 30 Oct 2017 15:20:21 -0300
Message-Id: <20171030182021.2175-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH RESEND] vl: only display available
 accelerators
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
X-List-Received-Date: Mon, 30 Oct 2017 18:21:54 -0000

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
resend without RFC in subject...

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


