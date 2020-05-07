Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWfNT-0000tS-6k
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2020 08:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNQ-0000nH-Ul
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50183
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNQ-0001IN-3a
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588853503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7CZXWmOlzkPDw3ChgdIHxPbxxhNLd9Vo76+h31WmPg=;
 b=D4Zm97/y+Pu2OPnk9/6+iXQy7JCQrhudAZMuVBoKTTjBmz56asXzfe/CFFaSs/l32Zbebs
 nMaq3+N2TdNMRx9OSgJSwUBzE567uFH5qgFDoC/tZYj3DUkSaOgHpyMrWWNJPQAlcKcqXx
 8nbPQ8I/TzX30F3kfaSu/HDHTvPL1Eo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-M41c0RMVN6uQQAb3NHnrCQ-1; Thu, 07 May 2020 08:11:41 -0400
X-MC-Unique: M41c0RMVN6uQQAb3NHnrCQ-1
Received: by mail-wm1-f69.google.com with SMTP id t62so3267730wma.0
 for <qemu-trivial@nongnu.org>; Thu, 07 May 2020 05:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZ2/ambaHE8VhJjgmhxpgBUMEyLaxhrdquoTUVQ9dy0=;
 b=cO+1IIhRS3uh1IghZDboJcfr1x4LMgMJFRuSKpSatG/hF/QyaUbSZnwHenwkygu6OC
 UQfyO9adAHa56PY34cwti+m8CHJ+/AQcWIdR+IOqKbaTmyftxhAw6/6ZbbDHRk0fptR3
 io9/9/wBc+AUwk3G6Wnc19cpj5NsxsiZ/OGoNfUZdU5ItU0G1f1NsSYtY3KaOpr68ZyZ
 Q03TUFZ5gng/NNyzBauWHNnJ9/3pg2ORxBJrl4857x1gq3EIMCxjrGcNZJCFVB3MnqEs
 KebM02ztv1e6uSBjTQG6MyFQxf/pkgpXtah6tDHiRajDRcnSNL7QmYlTRjZmyaV2Jr/t
 sGlg==
X-Gm-Message-State: AGi0PuaroCxgFrgSBISv6Tsj6Rkyax+mKUPOjdkWnGNeiXtxd0YQjchq
 pOZLU9nnAyzWvAV/hCOmp6x7ZFH67KV0/SrOwjMk9DVIK1e+WTFHep7CzTsZPNbW3OhIjlJnJMZ
 SjZp92EeyCZhtx89nEA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr10632100wmg.110.1588853500612; 
 Thu, 07 May 2020 05:11:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJSF8oG7QplyhjKGqHJMPP5ZsxjW4dc6j+pQ8T/c3dghHLieQonfoBK/OTVoWgUUdzHmJHBzg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr10632084wmg.110.1588853500427; 
 Thu, 07 May 2020 05:11:40 -0700 (PDT)
Received: from x1w.redhat.com (248.red-88-21-203.staticip.rima-tde.net.
 [88.21.203.248])
 by smtp.gmail.com with ESMTPSA id q2sm2372018wrm.42.2020.05.07.05.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 05:11:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/2] block/block-copy: Simplify block_copy_do_copy()
Date: Thu,  7 May 2020 14:11:29 +0200
Message-Id: <20200507121129.29760-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
References: <20200507121129.29760-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 07 May 2020 12:11:45 -0000

block_copy_do_copy() is static, only used in block_copy_task_entry
with the error_is_read argument set. No need to check for it,
simplify.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block/block-copy.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 83e16c89d9..e8455b817a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -343,9 +343,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
             trace_block_copy_write_zeroes_fail(s, offset, ret);
-            if (error_is_read) {
-                *error_is_read =3D false;
-            }
+            *error_is_read =3D false;
         }
         return ret;
     }
@@ -393,9 +391,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
     ret =3D bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
     if (ret < 0) {
         trace_block_copy_read_fail(s, offset, ret);
-        if (error_is_read) {
-            *error_is_read =3D true;
-        }
+        *error_is_read =3D true;
         goto out;
     }
=20
@@ -403,9 +399,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
                          s->write_flags);
     if (ret < 0) {
         trace_block_copy_write_fail(s, offset, ret);
-        if (error_is_read) {
-            *error_is_read =3D false;
-        }
+        *error_is_read =3D false;
         goto out;
     }
=20
--=20
2.21.3


