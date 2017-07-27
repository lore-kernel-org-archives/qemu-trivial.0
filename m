Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlu-0005yx-T7
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYls-0005w2-5o
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlr-0008H2-Br
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:28 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlp-0008F1-9A; Wed, 26 Jul 2017 22:43:25 -0400
Received: by mail-qt0-x244.google.com with SMTP id p3so8855514qtg.5;
	Wed, 26 Jul 2017 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lnpQHmS0mkoJ2CIwvdvhNpPk+XM5i+XhB+k6Jy8lhQ4=;
	b=UsxBWq09L8WPgGvisyfO/F4p12G/HccJqAXz/Oahz3qrIjhtGzO7EGSGZYZd2DT3xl
	Xe5UR1spZtS2X24HGG/ankbHu23TBccRITD/IPgSPa7zCt/40UAGAKVP53reLpc0CNLR
	6m10sTtJzp1F91Bf0LvcOlxPq7VDBrpuzYMs+t7n9qkpD6t0Nxl07AcWgX2mJ48Uhbzj
	LXH5fHN+pU+1NeZl81n/016KAqkIViNKaOzEcOq9rhy/GEJHFeVxsS9lDCLbCWLbMP8R
	VAsV2j31ldAKAXmfqpEtt0lNj0o0kbRlcXZXDs1NPCy3SrP3X8FHwE2V4/qvlYtKy+gP
	0MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=lnpQHmS0mkoJ2CIwvdvhNpPk+XM5i+XhB+k6Jy8lhQ4=;
	b=OQE7g+glQEtQU0V57G0W7Ss5u5mK9Gw0O5dcvQc14VIdTp+DzQ5ZP8TdMwWQswBet2
	MKJ5vQp3BzFAnaxXnW8r7V2UXU0TqH53+eL/MrMKQr5cndUSR5B/g3qWdf9SyT6rGYT+
	TCxnesCCQCqklOBKFZayR4aCNrMvj+fTia1O+gmf/rPH+j96X0Vfuvgrd0Gl5ZWqZ3e8
	g8QsBNCa6JaUHL3gkAObwnFJWu7Dwnoj7PaRIYD8/2DV+7SLVD+SCVoCgY1/QDg+K4AJ
	Ba+w/zoDU7Hr0evkm0OFHQQQGTRd5k/4eZ7uUFWFW15XiXEpJWq0zrw0JYxnKfwhg7pz
	lGZg==
X-Gm-Message-State: AIVw110I/thlWXxPn20C4cu3N1F/pA2bpR+CsmE4pRMa6ejaIf6348Pc
	6YiwRtP2yB4c6w==
X-Received: by 10.200.8.106 with SMTP id x39mr4304160qth.309.1501123404817;
	Wed, 26 Jul 2017 19:43:24 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:21 -0300
Message-Id: <20170727024224.22900-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 17/20] bt-sdp: fix memory leak in
 sdp_service_record_build()
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:29 -0000

hw/bt/sdp.c:753:5: warning: Potential leak of memory pointed to by 'data'
    qsort(record->attribute_list, record->attributes,
    ^~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
hw/bt/*:
get_maintainer.pl: No maintainers found

 hw/bt/sdp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index f67b3b89c0..7b2186e1f4 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -711,7 +711,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
                 struct sdp_def_service_s *def, int handle)
 {
     int len = 0;
-    uint8_t *data;
+    uint8_t *buf, *data;
     int *uuid;
 
     record->uuids = 0;
@@ -725,7 +725,8 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
             g_malloc0(record->attributes * sizeof(*record->attribute_list));
     record->uuid =
             g_malloc0(record->uuids * sizeof(*record->uuid));
-    data = g_malloc(len);
+    buf = g_malloc(len);
+    data = buf;
 
     record->attributes = 0;
     uuid = record->uuid;
@@ -748,6 +749,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
         record->attribute_list[record->attributes ++].len = len;
         data += len;
     }
+    g_free(buf);
 
     /* Sort the attribute list by the AttributeID */
     qsort(record->attribute_list, record->attributes,
-- 
2.13.3


