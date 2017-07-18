Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsM-0001XV-8f
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:20:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsK-0001VB-7s
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsJ-0000aG-G6
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:52 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsJ-0000a1-C4; Tue, 18 Jul 2017 02:20:51 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so1365268qki.1;
	Mon, 17 Jul 2017 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ALUcJEnLx6GpYjVKA72XwHdQGiS6UFG9CQsUGsJUkV8=;
	b=qXtbfgtPHXcaptP5qkdM6gBIALPC/5G3S3U/bxqs/tINNDyKv2tTVl/QZ+wyjt7mTU
	JTa/89M8uHvuIf6Eg6PjVkxN99iZObuLuBqy0je34J4iyir3OhXJpMLEYS30yoFA608d
	uYSWC9TKEzCN1iSyzksWL1wVN6DLFQo3OZ3cJN+IdDqP77D9t6A2Jmq1FvDsBy8r7R+k
	s2XbsngAoLYbJE+y07Vnw9OgxdclF4NoIbOp8f3p1xqqFi7mkH+wAlDidf9kVatDohYa
	2VUzolbxa1zghw5LKIywl0XefHjPZZ/ACZT4b7lQaeJFRDUOZdprhG1Y+mfrwkNSvT+q
	E59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ALUcJEnLx6GpYjVKA72XwHdQGiS6UFG9CQsUGsJUkV8=;
	b=rT4jlHoLDdkvwNOW5xv4S1bx+hLoMQNptglKnmoeCedgDM20NH+wWEroKJom1jeNyR
	Tbg6VplGaCf6BvFGh+jK43W7Bj85F4T0xAJxUevH9+nnHJG84gr3Xg0nJaOBIgBu+hkx
	WSojqvMMvDWLGLSHFb+87XhV7RwECVEbE1lRbWioGGdG0crB8zszuqmvWlRGpsJGL91G
	JvSAN9gFp+AbFYegDLHgqwm+Sd3FvmvgOpLT4ksvtCsdlWKAn8JwZ95xs6UnuI0LayJt
	Hjje3d4d8jldSQjb+SYfLAFWWJslAfv20G/J1+hFkyGci329HIn6Pfm1uEDGKas9eRwU
	9iRw==
X-Gm-Message-State: AIVw112G3YkNs9VdNaxLaaQxKKhqknD/gDimE6/HGhUM2Ers/Uj6XjWK
	Hkbg2B/NI/DDRd2mLY4+pg==
X-Received: by 10.55.20.211 with SMTP id 80mr108383qku.94.1500358850615;
	Mon, 17 Jul 2017 23:20:50 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:44 -0300
Message-Id: <20170718061005.29518-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 08/29] ui: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:20:53 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/console-gl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index 5165e21646..83ad31d223 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -80,7 +80,7 @@ void surface_gl_create_texture(ConsoleGLState *gls,
                                DisplaySurface *surface)
 {
     assert(gls);
-    assert(surface_stride(surface) % surface_bytes_per_pixel(surface) == 0);
+    assert(QEMU_IS_ALIGNED(surface_stride(surface), surface_bytes_per_pixel(surface)));
 
     switch (surface->format) {
     case PIXMAN_BE_b8g8r8x8:
-- 
2.13.2


