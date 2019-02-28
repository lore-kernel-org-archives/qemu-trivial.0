Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzOq4-0001Zg-9C
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 11:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzOq1-0001Xy-70
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 11:47:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzOq0-0002Vt-0N
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 11:47:12 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1gzOpu-0002Rz-OO; Thu, 28 Feb 2019 11:47:06 -0500
Received: by mail-pf1-x442.google.com with SMTP id n22so9992055pfa.3;
	Thu, 28 Feb 2019 08:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=zLu66D0uwzClyJYR/h/ld+mnIYFUWkCBfsq2ybFqzY0=;
	b=mi//3nTZrX926QdWwMNKznDGeLRc1jVBnYnluFhVoWddN9DobEq7g4CguDpEk60/R9
	6JfWmiSlkeZ+a+r9SLPz8AaX9I2CfmTjbUsl8LFz9ZiAoytWtxglrwXBrk+s42tvnosb
	RBulAEb8Vcw3JJhRviEybNZfP8Iknt5y8SHOk+e6wKVjaEeEdKTlNnF5UtfOMGggwjc0
	wg8d12ThU1bxZq2xRs5OT9mNQGxo0QuD3D8kxT50oOlQH/D79YQflwieIe60SnuKyCCZ
	Ia2dtsn3AS8NA3QDQP7wqqd7LVnvTPgXrjfujGGZ747jBDQRWffPcy/VA5CajajlSmub
	0sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=zLu66D0uwzClyJYR/h/ld+mnIYFUWkCBfsq2ybFqzY0=;
	b=K5m+9JZBCHk/8FwnWCWqHQ06daP504lpE/BEwmLwewyh/OnUobv2V7kixY22fGtfDi
	JJ6aiKLUaHLR//AoIfLY7N3SuC9+MX9hvnNpiw6lzAKpPqg9cbrOrFMxnCso/SAbe+nl
	ZedIGCJ5rvsJtVaN057ig9V5U/RZ9EUtQjCvI/LmOO52ySBlp14oNsHPWN/Z9/9ATXrL
	GmmYBheE438zMamv+BiK3QBfAwaBAI1/ltHt518fjZGWuXti9+rESbvyqQ+kmnw6Q4AN
	jtdLn+6pyeXDbRe2tQ34NdMoQ1cdfM6nPVha9AennNEZeuXEQ+yRbeO2uIXeaGhhTDwQ
	joYg==
X-Gm-Message-State: APjAAAXlUmWy2yaXdhnkC+3MLdVeuP6IuUIHbUY668RAa1pOHU8AIGgt
	zHJjy+FSXGIN4hyNsb5SXLABp0WOEEY=
X-Google-Smtp-Source: APXvYqz6vyMGMRd+dXbtVpPJxuZFuOm7RbSu+gZDr4W/SuoHFAhk8ZrET3N0Ma11rZCWNcrSgk7eFQ==
X-Received: by 2002:a65:46cd:: with SMTP id n13mr46507pgr.221.1551372424555;
	Thu, 28 Feb 2019 08:47:04 -0800 (PST)
Received: from am-swift ([136.233.9.103]) by smtp.gmail.com with ESMTPSA id
	d16sm22999078pgj.21.2019.02.28.08.47.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 08:47:03 -0800 (PST)
Message-ID: <63559cf027d4ebd95a844b73b1f20444fb72fb2c.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, Stefan Hajnoczi
	<stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>, eblake@redhat.com
Date: Thu, 28 Feb 2019 22:16:57 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-trivial] [PATCH v3] trivial fix of malloc to g_new in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 16:47:15 -0000

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>

Note that since thunking occurs throughout the lifetime of the QEMU
instance, there is no matching 'free' to correct.

---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index d5d8645cd4..17f3d320bb 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name,
const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_new(int, nb_fields);
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.17.1
Regards
Aarushi Mehta



