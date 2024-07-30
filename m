Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYjdy-00079r-3u
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jul 2024 05:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYjdw-00071c-6R
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 05:59:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYjdu-0003cg-IK
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 05:59:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-368380828d6so2634844f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 30 Jul 2024 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722333581; x=1722938381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1gxlSql/jvVtYT0aRUJJ4TNUP3dRmkRFYomfT7w2uNg=;
 b=hOEk35TYr/S71hWKLhloROXb9KJ4yMFEib5OiIdwqIh5vi51SYAG++0CDyRW8ntiLf
 ik18gsojF09zTFMrYZsH3F0ZKi5R0Px2KcGST9wgUlBUCiEYKl1QvBdsWinkrg29pZJE
 sO0LRtTt7lvT7DWNlkDt33AwVe/SqnDMvo+8/nEgHtsDMz1pTsz156rUalJLj3+QmJme
 OSDuxAsM+qF5Z2JOfSosl8lCYFkG8G6E9XjEuK0HXbdAEvQ33D9PKyT1hlHJ1b3QQwaW
 6b92rQIQHK08PUQ5ZfhKeF2Maq9c+iDov8+hmQWerxkRXr39u+gv9PLzuDmSDjpa/PcI
 n++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722333581; x=1722938381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gxlSql/jvVtYT0aRUJJ4TNUP3dRmkRFYomfT7w2uNg=;
 b=rVKCkMPdP4v8ZXUk0Rhc56i3EootFteGfkukkO5YpzyqmjwAlyE9eU0uNWBcigOf7C
 5elI6DcMnCh92qr93Bt48/5diB3uduvub7m8cOdbezXRBb+DdEXIaRckhsotK9w+CRpv
 D7P09zeFyIIK3Zt3f000vU+EJDwYG+Rx3HiWBoQRvM6FOZxXTJvMBNc2Yti7LDYDp1ke
 5vnU5qfnjBX5XqkQWqoSwJYiQZIbgH/B9rv++ROi0o5jrZl4LzrGwcyUFOjkQbS0oP5w
 dyCjbuXDId1ePVSKYnrwTWyPsanetqhntLh7AgrvoJUrRHp3mRsixE5KYpVKvYBk2rCg
 cjlg==
X-Gm-Message-State: AOJu0Yzy+fhhAeeAub09BM02W4KPNcgEPAd/rmBiPAG7CHgoSIoqmD3Q
 0iKftk2K5si7QQPYGygjH3Iun4Vw9hE5t2Mmcg60GVUsTOhn44Rd+cGsxy5MtmU=
X-Google-Smtp-Source: AGHT+IF24LWWhXZ7QjjDCPI4ChXMw7KuebQTyK/nVxlqOO2l/b/3u+zRZYu6sU+2FVdPgV05QN8Q7A==
X-Received: by 2002:a5d:6891:0:b0:368:6f19:cbf5 with SMTP id
 ffacd0b85a97d-36b5d03cb72mr6353539f8f.31.1722333580788; 
 Tue, 30 Jul 2024 02:59:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42805730d92sm209679985e9.3.2024.07.30.02.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 02:59:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] osdep.h: Clean up no-longer-needed back-compat for macOS 10
Date: Tue, 30 Jul 2024 10:59:39 +0100
Message-Id: <20240730095939.2781172-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 30 Jul 2024 09:59:44 -0000

Our official support policy only supports the most recent two
versions of macOS (currently macOS 13 Ventura and macOS 14 Sonoma),
and we already have code that assumes at least macOS 12 Monterey or
better.  In commit 2d27c91e2b72ac7 we dropped some of the back-compat
code for older macOS versions, but missed the guard in osdep.h that
is providing a fallback for macOS 10 and earlier.

Simplify the ifdef to the "ifdef __APPLE__" that we use elsewhere for
"is this macOS?".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/osdep.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 191916f38e6..720ed21a7e4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -786,8 +786,7 @@ size_t qemu_get_host_physmem(void);
  * Toggle write/execute on the pages marked MAP_JIT
  * for the current thread.
  */
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+#ifdef __APPLE__
 static inline void qemu_thread_jit_execute(void)
 {
     pthread_jit_write_protect_np(true);
-- 
2.34.1


