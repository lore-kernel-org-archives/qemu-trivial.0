Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQ9-00008u-Up
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ3-0008Vg-BE
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ2-00060F-KN
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:39 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ0-0005wO-FJ; Fri, 06 Oct 2017 19:52:36 -0400
Received: by mail-qt0-x241.google.com with SMTP id v28so25502053qtv.1;
	Fri, 06 Oct 2017 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TgeM8heC72pKCa2LEBzGZITh7g8M1kaYV2N9WefszIc=;
	b=Rg+ct2S6KwvhxMwb43IUwykEeiOHAjU64093hUj71QPvRzJzvL7YuTAlY3B5wn4EFs
	A2/8XMKeGxWnjnuWGK+c7ewsgHeuH3DwEXX13w7ut7FOmJ0X8UuMtSFYlDBE9NVu1qD7
	gU3oHsBDAe6Ss+2/CY7NQH7Dmvns/p+ZtKzPiUda5+bpUahPXu4KS+GC0YnWnWOn3l44
	A3ZoYeJKOpgYPyKEKgRebgTyYlZlQDP2h8C5pDAOj01c+RzMtoh7P8j3tSZIECiIOo6Z
	o4giLpPLeTOGYsaeFjjj/SMpQNLlt5MVhJ8VNJzhbLwIuEKZ9ERdx0lAseSIQh4ZtgTZ
	Amgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TgeM8heC72pKCa2LEBzGZITh7g8M1kaYV2N9WefszIc=;
	b=W+veShh6YRgIhBcBJ+OTstOtDqO7ubjkIRzNaLcWqvvWJ7jK7eHEVWuBCaaKUaWgXJ
	xR/07itrXxq4HQhTltngvGQStrq7UHqOPH40dI21cXYc8bmM7vYIBSeOh+trWYQOXkL8
	qVVu5r+0jijLolXPUMERHJm0jeUec8E1LwhzQVOUKm3iSeUsNoKrf3/5Xtnom60XOmUb
	cs1xJr661H97sUhdHImy3Mp0cf4FDS3VQ4dKLa4JXoszChU0BcgLLeoVz9cfSjTfuXX+
	j3lgrvqEwx+coGHLJS/aMqSsWIIF0xQe9iPSrh7//9i17SY5acJOKifcQwyhLNGjtEP8
	Mp7g==
X-Gm-Message-State: AMCzsaXV5gA0nqmYosw5AhxYejBag7gy8SZEUh4MV9HIT+QARy7DCQvt
	a8pnNUaPbWQ27QYxlhB1Q68=
X-Google-Smtp-Source: AOwi7QC0DFe3p/CD6LGIFMuCqW4mW4XAthlt+e84gkgWFUfX/7h2O1sbPaeAS1I1pgL/ar44fotNHg==
X-Received: by 10.237.36.145 with SMTP id t17mr5205976qtc.162.1507333955909;
	Fri, 06 Oct 2017 16:52:35 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:31 -0300
Message-Id: <20171006235023.11952-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 36/88] SLIRP: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:44 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added net/slirp.c]
---
 net/slirp.c    | 4 ++--
 slirp/slirp.c  | 2 +-
 slirp/socket.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 318a26e892..c42e1fd0d0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -869,7 +869,7 @@ net_init_slirp_configs(const StringList *fwd, int flags)
     while (fwd) {
         struct slirp_config_str *config;
 
-        config = g_malloc0(sizeof(*config));
+        config = g_new0(struct slirp_config_str, 1);
         pstrcpy(config->str, sizeof(config->str), fwd->value->str);
         config->flags = flags;
         config->next = slirp_configs;
@@ -973,7 +973,7 @@ int net_slirp_parse_legacy(QemuOptsList *opts_list, const char *optarg, int *ret
     if (QTAILQ_EMPTY(&slirp_stacks)) {
         struct slirp_config_str *config;
 
-        config = g_malloc(sizeof(*config));
+        config = g_new(struct slirp_config_str, 1);
         pstrcpy(config->str, sizeof(config->str), optarg);
         config->flags = SLIRP_CFG_LEGACY;
         config->next = slirp_configs;
diff --git a/slirp/slirp.c b/slirp/slirp.c
index 1cb6b07004..9af9179afa 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -288,7 +288,7 @@ Slirp *slirp_init(int restricted, bool in_enabled, struct in_addr vnetwork,
                   struct in6_addr vnameserver6, const char **vdnssearch,
                   void *opaque)
 {
-    Slirp *slirp = g_malloc0(sizeof(Slirp));
+    Slirp *slirp = g_new0(Slirp, 1);
 
     slirp_init_once();
 
diff --git a/slirp/socket.c b/slirp/socket.c
index cb7b5b608d..2eccb68c2e 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -48,7 +48,7 @@ socreate(Slirp *slirp)
 {
   struct socket *so;
 
-  so = (struct socket *)malloc(sizeof(struct socket));
+  so = g_new(struct socket, 1);
   if(so) {
     memset(so, 0, sizeof(struct socket));
     so->so_state = SS_NOFDREF;
-- 
2.14.2


