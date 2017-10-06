Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSF-00028E-Bi
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSC-000252-Ox
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSB-0007oc-Km
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:52 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cS5-0007hU-KW; Fri, 06 Oct 2017 19:54:45 -0400
Received: by mail-qt0-x242.google.com with SMTP id o52so34329318qtc.9;
	Fri, 06 Oct 2017 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gs1hp8s1gqzQW6gjNwbpFvPx+RGl0n1rIJqAJMqnj3Q=;
	b=N0I8MhVxgemTbAOOQMzDkRTuFWJefUZqY30MaNuCvjlOlou3hLBooswvo0jEIINm7M
	99c0Z2QKT7EK7pyS3jxOd+2u7qMuNTHb8swcxwEY5fHR0YCE4WoK2MdmVqMt7QCnyVc5
	YMq9Y3dhuE8y8JSLM9+ELwOJGZEN9jmKumMegpW0LrbY52jNO4VvGBCqFgquwa1TmYQb
	/Q98tO4712ZCtW6LDgml2+aBR3sPGJsvv6uM2LA8NrYAYqyBsaekgXq7f/YCiQF8/Rog
	R4ZzsQs/2Tmj+Zx028EgZE+DSs8MRSdn68nVV2Frb+CD1pqkHT1vDLbMc4474IWYfqM2
	kU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gs1hp8s1gqzQW6gjNwbpFvPx+RGl0n1rIJqAJMqnj3Q=;
	b=HZA1SFogPIYpyEDcrh6kRVg2V8gDkIyChyBKLL7i/fUU0h/oox1W7wZsYEru5Bcm++
	AHK19/mbdN2sLvlvyaxZ29kUJzp+WG8oyoUmtiOmQtuQqbhoTXKWIPQAPM3qGA4U9EBZ
	BLDIWP636xxQxRV6HHLTf99Sq40807Ypd04cdJHABxtgMB6K4rNWHwYenkqyFsKNQ4BM
	cuLVlPOHLsJxURSYNIJxP3eYSgrLSMlk5xRbXfvUKXhWVgcQKgrdT+N6229UOqCro1WA
	J5gughun8PfnkNethuZ1+n56aadE5DAX88xW2WTqxwfvDUP7y/sEew6ncsY+dcwNEMBF
	Mr5Q==
X-Gm-Message-State: AMCzsaVrUKD7ubbfqLEIOtdjWACMv3TVvBkkAui1IdL03hwonSFAuGL6
	ZIcIz+7tfPhwemMDXgPBC2E=
X-Google-Smtp-Source: AOwi7QD61hxWpokzFtk394fZxjJocBNS8jx4jSP2rqHhwKsROuClu20QvXkl2AmWphmCFk/0CSFczQ==
X-Received: by 10.237.36.145 with SMTP id t17mr5210353qtc.162.1507334085064;
	Fri, 06 Oct 2017 16:54:45 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-block@nongnu.org
Date: Fri,  6 Oct 2017 20:50:06 -0300
Message-Id: <20171006235023.11952-72-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 71/88] block: avoid use of g_new0()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:53 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/qcow2.c | 2 +-
 block/vhdx.c  | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index f63d1831f8..3e7d6c81be 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2738,7 +2738,7 @@ static int qcow2_create2(const char *filename, int64_t total_size,
 
     /* Write the header */
     QEMU_BUILD_BUG_ON((1 << MIN_CLUSTER_BITS) < sizeof(*header));
-    header = g_malloc0(cluster_size);
+    header = g_malloc(cluster_size);
     *header = (QCowHeader) {
         .magic                      = cpu_to_be32(QCOW_MAGIC),
         .version                    = cpu_to_be32(version),
diff --git a/block/vhdx.c b/block/vhdx.c
index 8260fb46cd..91e532df8a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -244,10 +244,11 @@ static void vhdx_region_register(BDRVVHDXState *s,
 {
     VHDXRegionEntry *r;
 
-    r = g_new0(VHDXRegionEntry, 1);
-
-    r->start = start;
-    r->end = start + length;
+    r = g_new(VHDXRegionEntry, 1);
+    *r = (VHDXRegionEntry) {
+        .start = start,
+        .end = start + length,
+    };
 
     QLIST_INSERT_HEAD(&s->regions, r, entries);
 }
-- 
2.14.2


