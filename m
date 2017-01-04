Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOn2C-0002N7-9a
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 09:59:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOn2A-0002Lg-Ip
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:59:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOn29-0006Xp-Ix
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:59:22 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:35311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cOn25-0006WO-8J; Wed, 04 Jan 2017 09:59:17 -0500
Received: by mail-wm0-x229.google.com with SMTP id a197so409996647wmd.0;
	Wed, 04 Jan 2017 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=YCuv9nrfCFv95jOVkCapVyGbEygV0kS4OWf+lV7S0LQ=;
	b=ddSSM4Z3VI6LQBxmuNUJfN33NnOS76EumZvTBZc/FgpD1yK+vlRj38W4s3dYndLvzK
	dw5u9aTcT0xwuPHOg/GSq14F59cIzteCj9ukF8cVe64RO4ArY7Vy1x3JmgxGWKIwzaKk
	bGS1N0R1TQ7IR3xyD1jhfm4P0HZaxdRJHVSv0FY62+oIeqcpIwTIL+uAR5BbWFuYAMSy
	Q6limdSF3D/S2O/dCNhuT5xwkjMFJ0Z6GXKQ2U2h/bzK2QWY8XMc9mc+0TCxEExUDvAf
	zvce8e6gatecwlwGt6OBLTDX7B6Ei9jri/peNP0yXl8oIx63foxuN636DgcipnmCJOBt
	1v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=YCuv9nrfCFv95jOVkCapVyGbEygV0kS4OWf+lV7S0LQ=;
	b=HIQ2hplXkQX/xjB6V1A7pjeyHKY9oWfU4Ed0TRJ+9S4veWzVoXZ4f4nrDyJHbsk4FC
	JP8+d61uM1YNViA3mRBcI0tNNwZIH9nHEraTtZ+iywwVTwefbC6GHcprJJD+AMQ1krIl
	J5eoaMrs3pd5jXDaMBSfOCITKNTiLlQd6FeqEnG1D+KgDOzcX+9XafPQvaMIQvDRff8N
	JGdVzjpYjtIuN9STmdkJxFDFemJn9UGoifH1IuT9Mdmp8b/Z/qeMYTT8Fo4LmvywdykR
	2wj5Qrp9xlyc085o9/HhqHpswrAYnrn7Qs4Df660YlFUMFONbZgS38XoatC6OULMudCH
	LjCA==
X-Gm-Message-State: AIkVDXK+/cH6um+6XoZoUU7xfyqlIt3RthLbnn6z6hlTWh1Z8nx085lL9u8VBT68lSsq4Q==
X-Received: by 10.28.52.76 with SMTP id b73mr62801950wma.8.1483541955827;
	Wed, 04 Jan 2017 06:59:15 -0800 (PST)
Received: from donizetti.lan (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.gmail.com with ESMTPSA id
	x188sm95423965wmx.4.2017.01.04.06.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 06:59:15 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 Jan 2017 15:59:14 +0100
Message-Id: <20170104145914.3361-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: [Qemu-trivial] [PATCH] block: remove dead check
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
X-List-Received-Date: Wed, 04 Jan 2017 14:59:23 -0000

options must be non-NULL here, because a NULL value is replaced with
qdict_new earlier in the function.  Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 39ddea3..a0346c8 100644
--- a/block.c
+++ b/block.c
@@ -1851,7 +1851,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     bdrv_refresh_filename(bs);
 
     /* Check if any unknown options were used */
-    if (options && (qdict_size(options) != 0)) {
+    if (qdict_size(options) != 0) {
         const QDictEntry *entry = qdict_first(options);
         if (flags & BDRV_O_PROTOCOL) {
             error_setg(errp, "Block protocol '%s' doesn't support the option "
-- 
2.9.3


