Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s3t9n-0007sc-Qk
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2024 03:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1s3t9Q-0006cj-OR
 for qemu-trivial@nongnu.org; Mon, 06 May 2024 03:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1s3t9P-0001jo-2d
 for qemu-trivial@nongnu.org; Mon, 06 May 2024 03:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714981962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXL8u/WSR5nc+uR+16Rj/aOdLSI5R+KIVqaTq5s6rWg=;
 b=Z6VOMPKRfCjj3GlSte1IVNSwtkEw/MZdFotUhz2eBrvyddV7/f6l+toI8yX79m78BvNqmE
 56f9WF5Mk+8q6QgA6vvc6yOKVo6VKXx+zxHTAWbhUaF3Z3pbXShiTMOqrZW8C++835GZSj
 jqKN42GPXq8onFXliAyConFYiALpkwM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-yKnh7dUdOJaB3EN9mnNEtg-1; Mon, 06 May 2024 03:52:40 -0400
X-MC-Unique: yKnh7dUdOJaB3EN9mnNEtg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5725f45da8eso311468a12.0
 for <qemu-trivial@nongnu.org>; Mon, 06 May 2024 00:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714981959; x=1715586759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXL8u/WSR5nc+uR+16Rj/aOdLSI5R+KIVqaTq5s6rWg=;
 b=q2blPKIKTbnw1x8DxO/BRbDXD/pUyIqD9rvA5hHPeEV2e0cn8umAMXu0t2sTklM+6N
 smCSHj+6x4nVvdiGE79IP+/nhVUW+LkS2dLxbdVkuC29/O5bN+00HqucmC/eecM3XBd4
 GVrx6ohaqufFmmxKq6FvUqHmfmY5g2E1YJ5ca62GiNmYSuFjRG+HLtrP/QHscWzW6Jz3
 6lzhViaLZeuJyfneDVvKFkZ5pQJ8inQ8iGmIxtYFcS4AIcpEvNeNLNxlCFF5ZzJBGbBU
 jyJecyDDsfHXoCjps56gxRDZ+LJNFPtoPzucqG1lO+TknAGoXGmLesRY63LJYUlHf7RR
 RkVQ==
X-Gm-Message-State: AOJu0YyI4WvI7MiPQoJE6DzIcg7MJbnPVMF/S29vE2U+Dx9Nm5TQZguw
 fOuDkKyUFQxJlqqLJMq0SDiGRAO8BvQP+7D3wouQeDFNyf3k2fHs7YR0azZxDjJG0MErKtjby77
 9CnHnFcPAfjEfYxeHfyCCLYX1PfZVxzHGypmm+mm1Dl2VFJSHlHOEOzY=
X-Received: by 2002:a50:f603:0:b0:56f:e609:743 with SMTP id
 c3-20020a50f603000000b0056fe6090743mr6411157edn.35.1714981959585; 
 Mon, 06 May 2024 00:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW7mNMPoufFYIMPya8+3wvyUjp23TPTuknlUZKaYSt3Dzg8dCqJS1KRWCY760t42Nr00ENzA==
X-Received: by 2002:a50:f603:0:b0:56f:e609:743 with SMTP id
 c3-20020a50f603000000b0056fe6090743mr6411150edn.35.1714981959285; 
 Mon, 06 May 2024 00:52:39 -0700 (PDT)
Received: from avogadro.local ([151.95.155.52])
 by smtp.gmail.com with ESMTPSA id
 fj20-20020a0564022b9400b00572336c900asm4840451edb.74.2024.05.06.00.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 00:52:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Roman Kiryanov <rkir@google.com>,
 Daniel Berrange <berrange@redhat.com>
Subject: [PULL 29/46] bitmap: Use g_try_new0/g_new0/g_renew
Date: Mon,  6 May 2024 09:51:08 +0200
Message-ID: <20240506075125.8238-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240506075125.8238-1-pbonzini@redhat.com>
References: <20240506075125.8238-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.431,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2024 07:52:45 -0000

Avoids an explicit use of sizeof().  The GLib allocation macros
ensure that the multiplication by the size of the element
uses the right type and does not overflow.

While at it, change bitmap_new() to use g_new0 directly.  Its current
impl of calling bitmap_try_new() followed by a plain abort() has
worse diagnostics than g_new0, which uses g_error to report the actual
allocation size that failed.

Cc: qemu-trivial@nongnu.org
Cc: Roman Kiryanov <rkir@google.com>
Reviewed-by: Daniel Berrange <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/bitmap.h | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 97806811eeb..1cf288445f3 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -92,17 +92,14 @@ long slow_bitmap_count_one(const unsigned long *bitmap, long nbits);
 
 static inline unsigned long *bitmap_try_new(long nbits)
 {
-    long len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-    return g_try_malloc0(len);
+    long nelem = BITS_TO_LONGS(nbits);
+    return g_try_new0(unsigned long, nelem);
 }
 
 static inline unsigned long *bitmap_new(long nbits)
 {
-    unsigned long *ptr = bitmap_try_new(nbits);
-    if (ptr == NULL) {
-        abort();
-    }
-    return ptr;
+    long nelem = BITS_TO_LONGS(nbits);
+    return g_new0(unsigned long, nelem);
 }
 
 static inline void bitmap_zero(unsigned long *dst, long nbits)
@@ -265,10 +262,10 @@ unsigned long bitmap_find_next_zero_area(unsigned long *map,
 static inline unsigned long *bitmap_zero_extend(unsigned long *old,
                                                 long old_nbits, long new_nbits)
 {
-    long new_len = BITS_TO_LONGS(new_nbits) * sizeof(unsigned long);
-    unsigned long *new = g_realloc(old, new_len);
-    bitmap_clear(new, old_nbits, new_nbits - old_nbits);
-    return new;
+    long new_nelem = BITS_TO_LONGS(new_nbits);
+    unsigned long *ptr = g_renew(unsigned long, old, new_nelem);
+    bitmap_clear(ptr, old_nbits, new_nbits - old_nbits);
+    return ptr;
 }
 
 void bitmap_to_le(unsigned long *dst, const unsigned long *src,
-- 
2.44.0


