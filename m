Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sG4-0005Ez-QA
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFw-0005Bt-8U
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFv-0002RP-Fr
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:56 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFt-0002Pg-LT; Mon, 08 May 2017 19:39:53 -0400
Received: by mail-qk0-x244.google.com with SMTP id o85so12376081qkh.0;
	Mon, 08 May 2017 16:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Auh8xPHt3nwp2AkEUvs0s6gHn54/N7d8c8s8vQy1YQI=;
	b=YvxwHr94PkVL7vNfvcPqFUW9NoayQhjPDx3MynYHOuyVrefvpk4F9Bb2w3+jifEL8f
	U5YajPUMNZC06rYOQwFLZ/HncoiQ5ZDlcp1/xS1dCV2jp1zbe81mVWG+CKSiua6eyNdL
	ruGoMO9Ax5J1PGgYzFAhl2HFKgD3q4shG5BWk1m392tZwM5VGorddTug3iGejkwqRHxt
	rZNy7rODcDZ78G7jksz18P1OcVtWuZeXMwsbMUEMkLiopKceAHNuyiaKNpNWPxUjbqZn
	8n3ggcoaEkm5z8F2DgTADmoin324TMr9qbz7n9g0iwSfpyXwk/VJZ53eKI2yylc5K1cL
	1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Auh8xPHt3nwp2AkEUvs0s6gHn54/N7d8c8s8vQy1YQI=;
	b=cXL61vhSd02JIPvdp2dYu5Otr2ON2113nZdNldbQ2TVw0e0CVQFdhDy3n4oAR4NjA3
	kjd6g7TtwTHQ5UhW3+pg6FXKqR9twI+Lu8XhM5pgiedcP95GFqo1qr+kQJfhaxHgIwlJ
	aPAXy3caFajxqlPRXs5OOuI0w1h9slw8jiPA4vFKR7ZeYi8h2IcJAidaVlzcrD+M+wuQ
	J9G+CYzF0nHrzAKiNNa9KNJb/8neZnweTaodqQqnx09xssKN1jlGp4QzSlqXxBsNPK2V
	wU9BaJDM7vfqjlvyjZ544i2Wr6eiADjmQ5YHfuEV5z7siVohXRjB4Pz0KfrKgY5vzggO
	y2Tw==
X-Gm-Message-State: AODbwcB2vmM+yCudXQhKuUGNyo9xchu9lRIboukThN9S8/DEtNRcPYaA
	Mb6Uf6MsbggZZFHDhh3WNA==
X-Received: by 10.55.71.139 with SMTP id u133mr994960qka.317.1494286793094;
	Mon, 08 May 2017 16:39:53 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:17 -0300
Message-Id: <20170508233918.9043-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 10/11] register: display register prefix
 (name) since it is available
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
X-List-Received-Date: Mon, 08 May 2017 23:40:00 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/register.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index dc335a79a9..b5988c9cc3 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -195,8 +195,8 @@ void register_write_memory(void *opaque, hwaddr addr,
     }
 
     if (!reg) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Write to unimplemented register at " \
-                      "address: %#" PRIx64 "\n", addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
+                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
         return;
     }
 
@@ -224,8 +224,8 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
     }
 
     if (!reg) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Read to unimplemented register at " \
-                      "address: %#" PRIx64 "\n", addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
+                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
         return 0;
     }
 
-- 
2.11.0


