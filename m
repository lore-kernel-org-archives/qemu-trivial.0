Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uClfZ-0007Rc-Mo
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 16:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfQ-0007KX-Lo
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:47:00 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfO-000383-Dq
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:47:00 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-60634f82c77so100429eaf.1
 for <qemu-trivial@nongnu.org>; Wed, 07 May 2025 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746650816; x=1747255616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X5YlAX5hZZRj1bHKGnAqtuguXh/5Kuv3WoZqq6wDMY=;
 b=J5LOJbmCBY2kNs5XrvJV1/XIWunEegAxHY/VlqigdIC8T+KP2Sq8mF6zVfF/Lj178m
 rClBkfoqdpoHUnl14rCxUB1nvg7j+ZcAO3M6+2uhVV0ibKl6FMX3uQsTRd9uAY+DDKLi
 0q96Pqi5FqVwUHEJvfmwgAsxqZQ6P36m2Y7C0HRk4EUSe5iMvnapUhhI1aZZYmckqyUQ
 ClByHmlhGxiOkr2f1WqabwkOjba5EgjC+GM3aP1dgvg8eYs3XEkx+XHCfBkHY+L/HmOe
 5nNQvtU39kjkoc2OnsBPZkcfgc2WkBu8CQiMiRHpjeb3cOV8UA70dOVWOdKTMIR9OIfo
 qPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650816; x=1747255616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9X5YlAX5hZZRj1bHKGnAqtuguXh/5Kuv3WoZqq6wDMY=;
 b=S+UuCP3Z96/rM9W/LHeaROCVgIQ0LzbvmEYMyn9MkkyQf8HgnnZzEXZf8B94CbjZVY
 uu2c0njLIF9B4wu2cp7GMMSffLbmiKCxIBHIFCBSdCgPM0sl0oSSJUtl+/zxB8tsQCQt
 b5YVm0B+8b8AZ+a9jdPDWw4g5HKVnLdwwVvc3dAmCbeN6GlxEvOrrkP9qE+9NUKgsgoY
 tUWQ4Ys7ZtZRoLA23jdwYClBF3be0H0/+IvH1fc5W5js3zaB1xdCzurWPQ0aYHl28Ba8
 mt4C36+JyNBYhhVduLEqLAjeuLYN5V/AAUx2+x1JIq7azY2+FOnY/MomRN204eVcmuUR
 iqDw==
X-Gm-Message-State: AOJu0Yz+AXHk5Gqa4elMXQcEiM2VcJ77QODKpimHhmpi1jIGNHln/7jX
 EVceXBnDTSEBYVpslwms+9v41jMdEGuCfx6peAIc/EW+eovZumfhHYm6m/NLIOF446Zp0tm+xZv
 q+As=
X-Gm-Gg: ASbGncu9DB4TYJfaI4uj5hChHSDOVXeWsXHkelwZrKC53VzIfbqUU7jBtl5AeS7hAyS
 5+CKFKd5rUeb99QMTX3SPoMswMx9F2knvll3xtJwH+BS4rI7Tnik6Z+hLQBugN0rZx9Smtwg0Ja
 yQui0BiD2PTSSKdIOuZnz+KW1MUzfoaNpqHu49Lou7T4oe8JwExGOXYdjLEW7K2f9kUDdo9VMcb
 2iKQRFmBb4QuCsiX9oNZyHWzc5ZkDbxda+D6XzZAWUj8JMIL+CQz+czQE+e8IiM1f/HP/1enNvC
 9FoZ52sY4ZB4gohJsFsSOro1Ym1UzMv7MKXWVCcwXAo9Oc9B
X-Google-Smtp-Source: AGHT+IHTxYqW4lQZOBxH+deLgwoMHTIfpvcRsWcAhaSh4m8JgywEvo0bfyvdUiv4X+rnUPFucaKp0w==
X-Received: by 2002:a05:6870:a449:b0:2d8:957a:5176 with SMTP id
 586e51a60fabf-2db5bd76631mr3279626fac.5.1746650816499; 
 Wed, 07 May 2025 13:46:56 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2db5cbc7d1fsm920933fac.11.2025.05.07.13.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:46:56 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org
Subject: [PATCH 2/3] Fix typo in comments
Date: Wed,  7 May 2025 20:46:25 +0000
Message-Id: <20250507204626.139507-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507204626.139507-1-gustavo.romero@linaro.org>
References: <20250507204626.139507-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=gustavo.romero@linaro.org; helo=mail-oo1-xc34.google.com
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
X-List-Received-Date: Wed, 07 May 2025 20:47:01 -0000

Fix the duplicate "the" article in various comments.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Suggested-by: Thomas Huth <thuth@redhat.com>
---
 block.c                             | 4 ++--
 hw/xen/xen-hvm-common.c             | 2 +-
 include/exec/cpu-common.h           | 2 +-
 include/hw/xen/interface/io/blkif.h | 2 +-
 qapi/qom.json                       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 0ece805e41..2bac802da8 100644
--- a/block.c
+++ b/block.c
@@ -3153,8 +3153,8 @@ bdrv_attach_child_common(BlockDriverState *child_bs,
      * stop new requests from coming in. This is fine, we don't care about the
      * old requests here, they are not for this child. If another place enters a
      * drain section for the same parent, but wants it to be fully quiesced, it
-     * will not run most of the the code in .drained_begin() again (which is not
-     * a problem, we already did this), but it will still poll until the parent
+     * will not run most of the code in .drained_begin() again (which is not a
+     * problem, we already did this), but it will still poll until the parent
      * is fully quiesced, so it will not be negatively affected either.
      */
     bdrv_parent_drained_begin_single(new_child);
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 9a677e8ed7..78e0bc8f64 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -711,7 +711,7 @@ static int xen_map_ioreq_server(XenIOState *state)
     /*
      * If we fail to map the shared page with xenforeignmemory_map_resource()
      * or if we're using buffered ioreqs, we need xen_get_ioreq_server_info()
-     * to provide the the addresses to map the shared page and/or to get the
+     * to provide the addresses to map the shared page and/or to get the
      * event-channel port for buffered ioreqs.
      */
     if (state->shared_page == NULL || state->has_bufioreq) {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index dab1e7e580..a68485547d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -182,7 +182,7 @@ void list_cpus(void);
  * @host_pc: the host pc within the translation
  * @data: output data
  *
- * Attempt to load the the unwind state for a host pc occurring in
+ * Attempt to load the unwind state for a host pc occurring in
  * translated code.  If @host_pc is not in translated code, the
  * function returns false; otherwise @data is loaded.
  * This is the same unwind info as given to restore_state_to_opc.
diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
index 22f1eef0c0..c5527999d1 100644
--- a/include/hw/xen/interface/io/blkif.h
+++ b/include/hw/xen/interface/io/blkif.h
@@ -324,7 +324,7 @@
  *      access (even when it should be read-only). If the frontend hits the
  *      maximum number of allowed persistently mapped grants, it can fallback
  *      to non persistent mode. This will cause a performance degradation,
- *      since the the backend driver will still try to map those grants
+ *      since the backend driver will still try to map those grants
  *      persistently. Since the persistent grants protocol is compatible with
  *      the previous protocol, a frontend driver can choose to work in
  *      persistent mode even when the backend doesn't support it.
diff --git a/qapi/qom.json b/qapi/qom.json
index 28ce24cd8d..04c118e4d6 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -871,7 +871,7 @@
 #     link characteristics read from PCIe Configuration space.
 #     To get the full path latency from CPU to CXL attached DRAM
 #     CXL device:  Add the latency from CPU to Generic Port (from
-#     HMAT indexed via the the node ID in this SRAT structure) to
+#     HMAT indexed via the node ID in this SRAT structure) to
 #     that for CXL bus links, the latency across intermediate switches
 #     and from the EP port to the actual memory.  Bandwidth is more
 #     complex as there may be interleaving across multiple devices
-- 
2.34.1


