Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRe-0001WP-E0
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRb-0001TI-LU
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRa-0007Hz-S4
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:15 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRW-0007Fl-Tw; Fri, 06 Oct 2017 19:54:10 -0400
Received: by mail-qk0-x244.google.com with SMTP id 17so5919960qkq.5;
	Fri, 06 Oct 2017 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pSEuMLb4KNqK4hKyE9WYjo+BhFchDw/spXp+IVECoI4=;
	b=Cf/qJHiHcjm0PS4+EpKL7ayUhkeYPE3ktphI7As5Hc0y0L7RUUvaPH5Zq3RDqitkNM
	l9jw4QezsLiSyWxoU77d5fKs2IMShPwhSSvvtNWjQl+MBHiFSJTwVv81D/QN2M+uC2wI
	AyX5X3gTw9855spDWHRhdWmS3nZVLLJeEkogVe5qwXMUgfdFxn2b8NkDPx1uogtEHc+B
	Qt68yHv/ou336gR5/QdrdIx+GBDri5IDMXdLtRfrCwF+NFxY0hskC+4yQgavsukqkN+Y
	zxqFuD+QYtkgeIOxgBNVP5wFCd3ofqaf2RA4zXEHiHZdJSVfi0+eCGt0IQhxv+kStXl9
	tLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pSEuMLb4KNqK4hKyE9WYjo+BhFchDw/spXp+IVECoI4=;
	b=tWkMmh9f5zOFqZgs4kOk5wc0Aae/RCO7hLZTDMuCma5hAGZQ4SPH85AOW0qVSGC/aK
	5EZk0K5atlTut6OAh9vJ/fkXS95IuighNHppB00qRE0Vn5GjXfgqx6hjy6jU06h1Upo1
	I7AnhOIdADHFSkQqNHyGlVFCzOv7raInL4dEjEc3KCl/oV+0d/bCs3KYkhLL7bECnQRv
	3brTFpFnGDLBQD2EihmyzcPYubGB+1ni4DrcOnSPKoTTpjGdbI8nqXBENNonRUvwR+XW
	Vyppb5kkOSPMVumiboz9IqK3nyrXYjOaA7gIX1MYfDrkTAff8GSx/yd8G2lJoLeHxiOU
	p3Fg==
X-Gm-Message-State: AMCzsaVLZbn2ny2twa1jQivqzAyFz7Htxh/VdLg0AOQG3uH2LAi6g5kR
	pvJKWnQQH1o64F8ccbdQTL8=
X-Google-Smtp-Source: AOwi7QDaxGWjcXIIa1sVjJqT0vTExVfOKEAH+qwT+OIXq0c7+eCJFBZj2Vbfk8LhNBrJ6DGc7nhUpA==
X-Received: by 10.55.25.85 with SMTP id k82mr625290qkh.223.1507334050400;
	Fri, 06 Oct 2017 16:54:10 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:57 -0300
Message-Id: <20171006235023.11952-63-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 62/88] user: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:16 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added linux-user/elfload.c]
---
 linux-user/elfload.c | 2 +-
 thunk.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 79062882ba..0a826071e9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3014,7 +3014,7 @@ static void fill_thread_info(struct elf_note_info *info, const CPUArchState *env
     TaskState *ts = (TaskState *)cpu->opaque;
     struct elf_thread_status *ets;
 
-    ets = g_malloc0(sizeof (*ets));
+    ets = g_new0(struct elf_thread_status, 1);
     ets->num_notes = 1; /* only prstatus is dumped */
     fill_prstatus(&ets->prstatus, ts, 0);
     elf_core_copy_regs(&ets->prstatus.pr_reg, env);
diff --git a/thunk.c b/thunk.c
index d5d8645cd4..17f3d320bb 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_new(int, nb_fields);
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.14.2


