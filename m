Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobmG-0000yG-7W
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4L-0002LU-Lh
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4K-0004Ng-D3
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:37 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:44903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4H-0004Ik-8v; Mon, 06 Jan 2020 13:25:33 -0500
Received: by mail-qt1-x841.google.com with SMTP id t3so43183042qtr.11;
 Mon, 06 Jan 2020 10:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETqO23SHWpPMRbtRK9xMCrBSsMXG0QNt/7zW03rA7Ew=;
 b=pkqpqClAAU65D8rWlHzvXBzNxtF8NFiKqQd/peZLcto6NN8X4vC011llPx805Cuh9j
 okgP2a4G55Vc75DZiwkkL7LflHQd6GUb8yTJh3JgzJFK8VPYgIwgWnnk/XhSHdcmKlLz
 VGPbSH3HIozEfeeyOmzCfu3r4rX1sZM7Gtbu8gHVpaPNnb5GI+Dx4yPA0478xOFxdBJ5
 EWIXsbpNUZE7f4KX7YJcs7mTHE7LlmvthkL3BEauzAYAF4U1i1Xe7lSZQJR8lNvRtvTJ
 IrDfUiLViWdxs7Ve/1SHxdutDNjVuQVaHAT3NTQnPWxjr+fqcMo7DdHxDHDlmuWLT/o5
 fLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETqO23SHWpPMRbtRK9xMCrBSsMXG0QNt/7zW03rA7Ew=;
 b=cxKVJ0LH+nXBX+7Gye5xO0QMhoCe0B7Mi9CR3abxOnLg97vMCKk5Obiq0dUJ9fUTg3
 qQWgiODD48JO2G/oxGirhBIF8rmUj0rw/qAFk544Hmo9CnGrMuZCy2IWGE0/Qt0GXbei
 k3i6zdVXGN1DQJqeMeQb/UVI74hvG4bG2iZmbnO5mQGsslZ7eJ11tYCY49Zc84Q+j0yk
 w7bYdCnHu9QKwbPcS4JfTWy+rkRhIVN+/InK5b8dBV/zWIJc5fqEzNr7qJ7xv9uyCowl
 UIsqSEj0Vafy0fPZUhaAXe/T6W+STBn3qiOY2SpkBPs4ZYS068NQD63o74Ml/tW7JzIt
 eVjg==
X-Gm-Message-State: APjAAAXkrtCBI6CbfgCU3qilZN+SrXLsddIVxms9nfj/P2Ql+Ae1znqE
 PHZU5uEyTPMdDyw/j8M7CoXN08+G
X-Google-Smtp-Source: APXvYqwVAjtRACMUNbwLQSLwq35h9JtpfeE9y9G2e55OXgkDStnsckiZohcDDEa5GjF3ioEOBZ6VIw==
X-Received: by 2002:ac8:5442:: with SMTP id d2mr78985485qtq.297.1578335131570; 
 Mon, 06 Jan 2020 10:25:31 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:31 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
Subject: [PATCH v1 22/59] block/vmdk.c: remove unneeded labels
Date: Mon,  6 Jan 2020 15:23:48 -0300
Message-Id: <20200106182425.20312-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 18:25:40 -0000

'exit' label from vmdk_open_desc_file() can be replaced by
'return' calls with the appropriate value. Same thing with
the 'out' label from vmdk_co_create().

CC: Fam Zheng <fam@euphon.net>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/vmdk.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 20e909d997..d1491486de 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1222,14 +1222,12 @@ out:
 static int vmdk_open_desc_file(BlockDriverState *bs, int flags, char *buf,
                                QDict *options, Error **errp)
 {
-    int ret;
     char ct[128];
     BDRVVmdkState *s = bs->opaque;
 
     if (vmdk_parse_description(buf, "createType", ct, sizeof(ct))) {
         error_setg(errp, "invalid VMDK image descriptor");
-        ret = -EINVAL;
-        goto exit;
+        return -EINVAL;
     }
     if (strcmp(ct, "monolithicFlat") &&
         strcmp(ct, "vmfs") &&
@@ -1238,14 +1236,11 @@ static int vmdk_open_desc_file(BlockDriverState *bs, int flags, char *buf,
         strcmp(ct, "twoGbMaxExtentSparse") &&
         strcmp(ct, "twoGbMaxExtentFlat")) {
         error_setg(errp, "Unsupported image type '%s'", ct);
-        ret = -ENOTSUP;
-        goto exit;
+        return -ENOTSUP;
     }
     s->create_type = g_strdup(ct);
     s->desc_offset = 0;
-    ret = vmdk_parse_extents(buf, bs, options, errp);
-exit:
-    return ret;
+    return vmdk_parse_extents(buf, bs, options, errp);
 }
 
 static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
@@ -2738,7 +2733,6 @@ static BlockBackend *vmdk_co_create_cb(int64_t size, int idx,
 static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
                                        Error **errp)
 {
-    int ret;
     BlockdevCreateOptionsVmdk *opts;
 
     opts = &create_options->u.vmdk;
@@ -2746,23 +2740,18 @@ static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
     /* Validate options */
     if (!QEMU_IS_ALIGNED(opts->size, BDRV_SECTOR_SIZE)) {
         error_setg(errp, "Image size must be a multiple of 512 bytes");
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
-    ret = vmdk_co_do_create(opts->size,
-                            opts->subformat,
-                            opts->adapter_type,
-                            opts->backing_file,
-                            opts->hwversion,
-                            false,
-                            opts->zeroed_grain,
-                            vmdk_co_create_cb,
-                            opts, errp);
-    return ret;
-
-out:
-    return ret;
+    return vmdk_co_do_create(opts->size,
+                             opts->subformat,
+                             opts->adapter_type,
+                             opts->backing_file,
+                             opts->hwversion,
+                             false,
+                             opts->zeroed_grain,
+                             vmdk_co_create_cb,
+                             opts, errp);
 }
 
 static void vmdk_close(BlockDriverState *bs)
-- 
2.24.1


