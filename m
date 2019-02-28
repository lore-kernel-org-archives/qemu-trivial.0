Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzNEu-000249-0i
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 10:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzLxy-0004Kj-PZ
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:43:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzLxs-0005eE-Vr
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:43:14 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1gzLxq-0005Yw-JP; Thu, 28 Feb 2019 08:43:06 -0500
Received: by mail-pl1-x642.google.com with SMTP id g37so6975407plb.5;
	Thu, 28 Feb 2019 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=caZCtLOJxLHuXbGNoCrKqy+4QSaxAz1Cagv4eT6F4I8=;
	b=VEtSZK4fSiYBp6RcgP0HV5Rf8mPeN9XpYwRqE7ccAYFUM6g0yryOEoWZaGMRFnLaYq
	HMli44ZGtqIYS54o4U/Ge1Gey+5BoirwVSS0bhVcQpWU4jD3jSijKD19K9ru52AEs9VR
	q6oArMSr4cpf90s7+t1+Vp6p867M8aVPCAx2Dyb99EcMOMk9uzTqwo+G/2RqGfVhqT5J
	xXivLdl2MRB2maQrRBCxTcy+dpBKuAl5OozFYD3pn3M5XxLmLRSzieaJaTP/CbgNyoHb
	3cclBx5M59xGXuWQ/+DNE4R81rO0Uiw3fQPXofspbNVIjr/qlsyGV8PM+PHKSDv5xKAF
	2Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=caZCtLOJxLHuXbGNoCrKqy+4QSaxAz1Cagv4eT6F4I8=;
	b=Eau2Hmy3yQgapZfo6l1gyc7W30FUOF7yRF/xoAudRuCWVIN2MSbf2Jsu9jbwfccXmO
	jrXcs0pBOduMhfp5J1ZJPbU52mUUVxHU2IsI5sPM1WegXzwgJ5NccZhL26Y0axtfBh3g
	DI0/HwjqP1M011kOOS2mTGFsZx0+Dz62KJgyVgrZrebmYY/tXfjyfFJXscr8fOK2AIyJ
	0KVeBx0ZLvzFAGneZvksSeitEl2CudJ/AFLzKj0u41Bre81aOoSgrwEyHc67lvzTPftb
	50O9Pe+SfcpOjssERtqQypqWlSK8hMbSetg0PStY/XDRj2x14fvA7WBOGSDGJ+VEZQJE
	F6+Q==
X-Gm-Message-State: AHQUAubRqftLBPyKhk/WJ1my6KfQsLQNWs5S/nc/CLNywV8F4uXjRAVA
	Q/jbqshpKkiuu081gj39Wk/kVdeW86Q=
X-Google-Smtp-Source: AHgI3Ia1qCBr9XdeheH7xlggOhRYryigzZSqoORP7rpbTZbSvMlPu8cWZIUKMiedtPYYHlzg65wpBQ==
X-Received: by 2002:a17:902:8d89:: with SMTP id
	v9mr7203957plo.254.1551361372436; 
	Thu, 28 Feb 2019 05:42:52 -0800 (PST)
Received: from am-swift ([136.233.9.103]) by smtp.gmail.com with ESMTPSA id
	p11sm54876891pfi.10.2019.02.28.05.42.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 05:42:51 -0800 (PST)
Message-ID: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>, Julia
	Suvorova <jusual@mail.ru>
Date: Thu, 28 Feb 2019 19:12:45 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-Mailman-Approved-At: Thu, 28 Feb 2019 10:04:42 -0500
Subject: [Qemu-trivial] [PATCH] trivial malloc to g_malloc in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 13:43:15 -0000

Hi

This is a trivial contribution part of the BiteSizedTasks on the wiki.
I found this discussion http://git.corpit.ru/?p=qemu.git;a=commit;h=b45c03f585ea9bb1af76c73e82195418c294919d
on migrating even g_malloc to g_new, is this not appropriate for the same? 
The wiki can presumably use an update regarding this.

Signed-off-by: Aarushi <mehta.aaru20@gmail.com>
---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index d5d8645cd4..03fb2abab7 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_malloc(nb_fields * sizeof(int));
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.17.1



