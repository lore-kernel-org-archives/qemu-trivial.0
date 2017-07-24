Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6q-0001Bn-Dc
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6k-00015n-Oe
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6h-0005eu-Kd
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:30 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6f-0005dp-BQ; Mon, 24 Jul 2017 14:29:25 -0400
Received: by mail-qk0-x241.google.com with SMTP id k2so3227132qkf.2;
	Mon, 24 Jul 2017 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cTPrwNR5Zh92wu/+TbrpewVtE8VS1FvcmNf5Q9/Fnek=;
	b=ulC5eaSiukVCEz6zyGNyU60m5eFnbYZCIBQBCRHUeGKCFBx0gv7amgZzBIcUtaMuac
	w7NkLbuX6R2a+9dMzupcwT37zrs1K2gyn2ZweOtmNYgHuRNiSjOzXKgOi/xFK93I4aam
	HBb3PwCqolNDJyCeJi4EynrpiSO3JSTRwJsYD1eFD/SO7ut6j36sVtiLGdJ1p9iOxdpr
	087D/RqnqinP12HQEyyFHFEQa4SqYgMnjiZ71H7YoILDgFQtE/pLial20s+qNzCOQJCt
	QgXd/npbeS7c4uFXEp2AUXvjD20gNBqWavhwxrcl5JF+K8nWBfAgjKWao3YIXBMRHLZA
	AaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cTPrwNR5Zh92wu/+TbrpewVtE8VS1FvcmNf5Q9/Fnek=;
	b=GgSbc84T0clhnGm2n67uKyTMACHTgyBgrojcqZwRokza8pAJIJVFGLJMba6y7NiUK9
	/vYZG4nyhR52IbK2ciKsREJOscSK4sLesiIhLsOzZlyfp6Z08buwoVwkTagR9owC/bmn
	vid5mxkYQXI9qXKBLlLBGpEM/95oJiEymWp1zeQQTeN8ZkhZSbzOBA8TC/AKygT2DGkJ
	O2+QBAU2aGFAD0UateBaDG5m3W9RirjpG/v65NKwy4VFLEeOQZudyWZXb52+vjiKR1Px
	RShjmzFP9Gph5mwJuHDiofAZxool1J+L5KbEJeHTclsXCt13StLtyqzwqGoI5wOQR2d5
	qrFQ==
X-Gm-Message-State: AIVw1106ngCpiRCaxE54lOBP8mnPIhb9rap40SvYNTtcGdCCg2QEaPol
	IA1QZcb0mGmxOA==
X-Received: by 10.55.110.67 with SMTP id j64mr807725qkc.26.1500920964851;
	Mon, 24 Jul 2017 11:29:24 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:42 -0300
Message-Id: <20170724182751.18261-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH for 2.10 26/35] linux-user: use is_error() to
 avoid warnings and make the code clearer
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:34 -0000

linux-user/flatload.c:740:9: warning: Loss of sign in implicit conversion
    if (res > (unsigned long)-4096)
        ^~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/flatload.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index a35a560904..10c529910f 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -224,8 +224,9 @@ static int decompress_exec(
 		ret = bprm->file->f_op->read(bprm->file, buf, LBUFSIZE, &fpos);
 		if (ret <= 0)
 			break;
-		if (ret >= (unsigned long) -4096)
+                if (is_error(ret)) {
 			break;
+                }
 		len -= ret;
 
 		strm.next_in = buf;
@@ -283,8 +284,7 @@ calc_reloc(abi_ulong r, struct lib_info *p, int curid, int internalp)
                     "in same module (%d != %d)\n",
                     (unsigned) r, curid, id);
             goto failed;
-        } else if ( ! p[id].loaded &&
-                    load_flat_shared_library(id, p) > (unsigned long) -4096) {
+        } else if (!p[id].loaded && is_error(load_flat_shared_library(id, p))) {
             fprintf(stderr, "BINFMT_FLAT: failed to load library %d\n", id);
             goto failed;
         }
@@ -523,9 +523,10 @@ static int load_flat_file(struct linux_binprm * bprm,
                 fpos = 0;
                 result = bprm->file->f_op->read(bprm->file,
                                 (char *) textpos, text_len, &fpos);
-                if (result < (unsigned long) -4096)
+                if (!is_error(result)) {
                         result = decompress_exec(bprm, text_len, (char *) datapos,
                                          data_len + (relocs * sizeof(unsigned long)), 0);
+                }
         }
         else
 #endif
@@ -693,8 +694,9 @@ static int load_flat_shared_library(int id, struct lib_info *libs)
 
 	res = prepare_binprm(&bprm);
 
-	if (res <= (unsigned long)-4096)
+        if (!is_error(res)) {
 		res = load_flat_file(&bprm, libs, id, NULL);
+        }
 	if (bprm.file) {
 		allow_write_access(bprm.file);
 		fput(bprm.file);
@@ -737,8 +739,9 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
 
 
     res = load_flat_file(bprm, libinfo, 0, &stack_len);
-    if (res > (unsigned long)-4096)
+    if (is_error(res)) {
             return res;
+    }
 
     /* Update data segment pointers for all libraries */
     for (i=0; i<MAX_SHARED_LIBS; i++) {
-- 
2.13.3


