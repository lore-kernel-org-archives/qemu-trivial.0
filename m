Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcUlK-0003Ky-84
	for mharc-qemu-trivial@gnu.org; Fri, 30 Apr 2021 11:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sguelton@redhat.com>)
 id 1lcUlI-0003IH-JK
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 11:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sguelton@redhat.com>)
 id 1lcUlH-0004AK-5z
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 11:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619795335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+VSUJXhr7+FMvVxsYo48gJ8kkG68R3As+c+JifbZNfU=;
 b=AqtbI8K0dMfZqvA00QCROMHnI7GaMTgSCjx9UeMPp+5lN2bvLN0eHiRfdJWs7IDbzcxdhv
 5DPyr1K0ywqzbXMnkbHkFyPBqBvpGClsGnm26+rMkT/n9LJJbCQd6EnZuvz0OqDJWonT/U
 gp87JuoGrlZ0MjlyyDn5Xf8vJxRZUw8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-AzdHj_OeP4mytPJD80h2Ww-1; Fri, 30 Apr 2021 11:07:49 -0400
X-MC-Unique: AzdHj_OeP4mytPJD80h2Ww-1
Received: by mail-wm1-f72.google.com with SMTP id
 c205-20020a1c9ad60000b02901477e6d427bso555345wme.1
 for <qemu-trivial@nongnu.org>; Fri, 30 Apr 2021 08:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=+VSUJXhr7+FMvVxsYo48gJ8kkG68R3As+c+JifbZNfU=;
 b=LcNBQrosuG6AqBdNJ+f+THh9jYz7OPkSJ27lRXVyQPvuFG+FuvFFpCSC9t3JWKnExI
 q/YS9bHoLpZO9oXTAGZNSnWXb0ZdWZzLG6QOvyA22POMJ8vdtk29n0/OPpkj/w1I5agi
 MENeh5CYPhXMXSTUWrlbBSBBlc4IcP2abjdfL6hiU1rIn2qRIb/1RjvL+MhmpliByIUD
 EonHmEAo3NQJVXkpJTKGDPzyXjZ2qAOr3/UObyXtpp3v8h7ZMMajIA68xrMNPTh3qYpV
 8h/gCS336682ra8BeuXvbRdO2MB5bkUe2rYzVR+OiU37yOBHuQPZ9l8RYYJm147J+m0R
 cyJQ==
X-Gm-Message-State: AOAM532YPnbGjgqhgymDc9xjlUqEodaX1Pp0BEXoMjlipEs++RZ3+OVc
 bwS9pEhrGmJSYOQR5eu/hEVu1Wtx3Gl5dmbZ/RJiwa8eEi4XW1s5CexOF27VrksYGHMiWV3XZhF
 hqEGwGKenPQCn6bBPwQ==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr6624616wmk.163.1619795267853; 
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN0/CCHx9+vgeFLUWjmiN+cBWpkMGGNEtodHoq0Pi1xpihqyE39gdna0ZzIuCkdNYBkhJmmw==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr6624585wmk.163.1619795267657; 
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:923:3150:6f60:5f78:f08b:c504])
 by smtp.gmail.com with ESMTPSA id n3sm3282350wmi.7.2021.04.30.08.07.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
Date: Fri, 30 Apr 2021 17:07:45 +0200
From: Serge Guelton <sguelton@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, laurent@vivier.eu
Subject: [PATCH v2] Fix typo in CFI build documentation
Message-ID: <20210430150745.GA1401713@sguelton.remote.csb>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sguelton@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sguelton@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 30 Apr 2021 15:09:00 -0000

Signed-off-by: Serge Guelton <sguelton@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/control-flow-integrity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index d89d707..e6b73a4 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -39,7 +39,7 @@ later).
 Given the use of LTO, a version of AR that supports LLVM IR is required.
 The easies way of doing this is by selecting the AR provided by LLVM::
 
- AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+ AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
 
 CFI is enabled on every binary produced.
 
@@ -131,7 +131,7 @@ lld with version 11+.
 In other words, to compile with fuzzing and CFI, clang 11+ is required, and
 lld needs to be used as a linker::
 
- AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+ AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
                            -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
 
 and then, compile the fuzzers as usual.
-- 
1.8.3.1


