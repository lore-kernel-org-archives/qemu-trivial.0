Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQs-0000kR-Ld
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQp-0000jJ-HE
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQm-0006bd-Fi
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:27 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQk-0006ak-Lo; Fri, 06 Oct 2017 19:53:22 -0400
Received: by mail-qt0-x241.google.com with SMTP id q4so34332582qtq.8;
	Fri, 06 Oct 2017 16:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZyghmgeowrOeYWPAWPdWiGRkj3RR6t7cAXme875MWUg=;
	b=hOX88c14ItvQq5hrEN/W+1mgZgY7k8G1p+WADliA4xpJ8EEueT93cApZJQ6dlYKbPn
	dFIewHRKiCewRwqbma1RYrR94Xd843lmMTvVke0eNu7rKw3E+AWXOvSFozlBOldQGCiS
	PqbK0tYcUjlFnMh/2zKZ7TrcdbEcbC2nrZyXvRcowfWvBviLevYJZXmPxQLDqprjwFgH
	JQQ11QSGtPubA3tq3yuu2lyOT5mbx7fKJsowPB70gZPU75MA4ZP2eoFXoHLnthRMxxU0
	QZNypG+ZZBPdTSyXiIKNasUEn2LmzhhSb6Ry5ZwLO2h9Eil4bpWor15n5bQAG/tu0YC8
	mPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZyghmgeowrOeYWPAWPdWiGRkj3RR6t7cAXme875MWUg=;
	b=JWd9WL8PUm9SS+TvZGIpfm3yCVbyfmBFS8TJKx2b0cD1SXBgUMv+C/2H2hniE3uYKr
	dO2dA3/3GMlQKyP7DXqwAC71a3cf3T0CR+oQm18Re6WmAGegoOfbjxkpKjqt+PmCkf5m
	/HDD2mR/1TDTVh7ten4AfAPMUjCbo91SbZKTQxkVgpNhh2jy87FeNYrZr7v2tfZ2K3n8
	Vaj1XXrybP80ZRPX6oJvV6uUcGxqVwxurH+AY2G+mixoNQzz1vTjWVcRW5yNNqLH3XbH
	uqBiPDMetdd744W/Gn2Ae5B+721dTCFJYpqo7wYfsCxDIB7gkf6sK9BwUxNc058PmZca
	gonA==
X-Gm-Message-State: AMCzsaUh33RMApmXel2LCc3fPMkc6n9O/gsENYw9Vlqlcdq98YvE6OZE
	pJ8XAJUYI4NQ+lHZS8Hau3g=
X-Google-Smtp-Source: AOwi7QAI6Ph27pQU+q9M7JHHc37guv6xtMpPsKUzzDjP3Gf2VETW+Zw7va6bhTMUkdAi2vdFM2baHQ==
X-Received: by 10.237.46.98 with SMTP id j89mr5833139qtd.182.1507334002167;
	Fri, 06 Oct 2017 16:53:22 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Gabriel Somlo <gsomlo@gmail.com>,
	"Denis V. Lunev" <den@openvz.org>,
	Anton Nefedov <anton.nefedov@virtuozzo.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:44 -0300
Message-Id: <20171006235023.11952-50-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 49/88] hw/misc: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:29 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added hw/misc/pvpanic.c]
---
 hw/misc/applesmc.c | 2 +-
 hw/misc/pvpanic.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 7be8b5f13c..12e32b107e 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -252,7 +252,7 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
 {
     struct AppleSMCData *def;
 
-    def = g_malloc0(sizeof(struct AppleSMCData));
+    def = g_new0(struct AppleSMCData, 1);
     def->key = key;
     def->len = len;
     def->data = data;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 2b1e9a6450..dc51e4386c 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -95,7 +95,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
+    pvpanic_port = g_new(uint16_t, 1);
     *pvpanic_port = cpu_to_le16(s->ioport);
     fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
                     sizeof(*pvpanic_port));
-- 
2.14.2


