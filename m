Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jw60l-0001Ac-OO
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jul 2020 11:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw60g-00019a-4o
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 11:41:22 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw60d-0007cv-6u
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 11:41:21 -0400
Received: by mail-wm1-x341.google.com with SMTP id j18so10714178wmi.3
 for <qemu-trivial@nongnu.org>; Thu, 16 Jul 2020 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFEeAigEIjpMhWK7DoHcFuCUqfcQKRxgqCRDpAIxz64=;
 b=W4ELa6bwjHcVX3CesooMK/yVwoBCd4shwKHFCmu4wGfLzoUIsZXDRR1Yx95nfvgIZw
 U4BvBX894c6gdLfZcBnJvpzXdlUf9w2ot03j7TfFHpSYcZw2SSQx9arc3ED4CZ+FRuwU
 77xDC8265rpV2KmIR0fpIMJjL7216ugylwpN7j7zhTUziRJdTjn3U4r1GJ3TPJspGX4I
 5v5TJxDpBePh1/D70ijoluJVa/YU0lc6MXh+Z86GmGSdrrSrM1FhMqXlmb4DWjhU1lyJ
 AoDxLT40WRM3JsNgLzSXU5OxMeEaBuq0rM3Bt4xPcH/FrdM0KZYd6aOoRO1Km7ipvAGg
 frtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFEeAigEIjpMhWK7DoHcFuCUqfcQKRxgqCRDpAIxz64=;
 b=mB0eKUNgbuZbTwf/gwVLF/xklrz193HP6Rd7eND05fmCnTVhXODCIlp82lI/S3RxDT
 shbqvSiyvlur93WW6UPXNjaDLlQUghxCzZaSC7OReL22dBGztbkZ0CGFcmJH3a8HmbFi
 k6IG4OfD+dfexCy+e1q8HVMO9Ysrzs3FhSk7WTQywXjpzQdJhzOrW7sa1CM2DJEY5Cyq
 Rvav2L1NYwMOMX3DWZFIAv8S3fkAek+sFhegl0tocIQn5p+Vkx1wXPmSnPoF0zTncodY
 4N0P4gegv+LPQBa0aNbqJ31ngcrkA17TukmMaogxiUE75LAY+ruPvWhJNM47c6a2w6CX
 sdcA==
X-Gm-Message-State: AOAM532+dUds0Ob7hDrV/NW+xMgro+WxvZyTILdhpXgyo4dmx43bGXiK
 TLXIbjxBilUKyKoIOc4s8grpaA==
X-Google-Smtp-Source: ABdhPJwUs/Re27mBoKaIarf4T99MABoHs/uKrZYIOZ6y7XA4AJfSaNnVZnELXcF/WVfradYvyPug8g==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr4935929wmj.67.1594914077203; 
 Thu, 16 Jul 2020 08:41:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm9505012wrx.69.2020.07.16.08.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] osdep.h: Add doc comment for qemu_get_thread_id()
Date: Thu, 16 Jul 2020 16:41:14 +0100
Message-Id: <20200716154114.10838-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jul 2020 15:41:22 -0000

Add a documentation comment for qemu_get_thread_id(): since this
is rather host-OS-specific it's useful if people writing the
implementation and people thinking of using the function know
what the purpose and limitations are.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based on conversation with Dan on IRC, and prompted by the recent
patch to add OpenBSD support.

Q: should we document exactly what the thread-id value is for
each host platform in the QMP documentation ? Somebody writing
a management layer app should ideally not have to grovel through
the application to figure out what they should do with the
integer value they get back from query-cpus...

 include/qemu/osdep.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 4841b5c6b5f..8279f72e5ed 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -515,6 +515,20 @@ bool qemu_has_ofd_lock(void);
 
 bool qemu_write_pidfile(const char *pidfile, Error **errp);
 
+/**
+ * qemu_get_thread_id: Return OS-specific ID of current thread
+ *
+ * This function returns an OS-specific identifier of the
+ * current thread. This will be used for the "thread-id" field in
+ * the response to the QMP query-cpus and query-iothreads commands.
+ * The intention is that a VM management layer application can then
+ * use it to tie specific QEMU vCPU and IO threads to specific host
+ * CPUs using whatever the host OS's CPU affinity setting API is.
+ * New implementations of this function for new host OSes should
+ * return the most sensible integer ID that works for that purpose.
+ *
+ * This function should not be used for anything else inside QEMU.
+ */
 int qemu_get_thread_id(void);
 
 #ifndef CONFIG_IOVEC
-- 
2.20.1


