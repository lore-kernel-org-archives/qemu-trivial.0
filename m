Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtUJV-0005M9-LO
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 10:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qtUJT-0005Is-Vb
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 10:47:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qtUJS-0003bv-5z
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 10:47:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso5315535e9.1
 for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2023 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697726868; x=1698331668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nneD4HdeurggZQELllDiQ+M3+QZ2zLmj+zTEoZbm1vE=;
 b=WLVAEPfEd7r4FRm7SfFBzyB5chwyigvHp9FKzdZrs/5cR+JVhDPMyBrEZSrL7BE7nV
 w8ciGFSln7Ew4xBfUn0lsLLjngRwA/8X4G4WVzBwAI7GR2IldHCF2P23Tatgn2Z7k1O/
 7k4CCFR4f0CtLaGbhVMFWND7LSG7hQRbIMCeKeE84DUNRK2OwT0BlxvTAxvoyA9gfrB/
 3/7aO7mBDfY/Ts5NSJbrgd/Z6l9wRRuPrPd11awnTQzv61wiU6kFE5uYWMvZLj+6zhqa
 524izPws8Iron9AVpmkgWNzlb8xKwY+ZYz+MLYXqkbJJDsXuc7LXkI0Hv90AfVrfJZBB
 GvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697726868; x=1698331668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nneD4HdeurggZQELllDiQ+M3+QZ2zLmj+zTEoZbm1vE=;
 b=QiR8ildSjP+lgNO6i6upq2A73uGrWyhIeJ9kz5+f5b97CZULKqj8LJRbFPBxO2vnQP
 EzkrTKhB12xjDi0qwzPJxVJ9LCvy91HPgAHYlyjrE/l86jr5YYxXt9k+Lv+JNB7u8ZRM
 ov6zFgipT+zCanmrjOcgwPuEh3PxFAig1QdgcbXPsFtxHujrCSWyAD0itxjsWHWqz1iN
 lCuXxuUqYGv3E+yeq0FY0tUiDSkiiKmk2WAbEb7sIe3MbWGceJ0Zco04fSQ71cCmG4YU
 /kuBgagulwYS8u83eM0YwMgXKxQzxhirjBnwYR84f4eNqnHSb3HmYRXr2UUJYURStwQt
 hw2A==
X-Gm-Message-State: AOJu0YzuLgTMqInH38EbGHFXZaKPxyP41ILaDRjyi/ijOtf/m51LsObn
 BwWlmIO87Davbt3bRBfSKHBi8A==
X-Google-Smtp-Source: AGHT+IEN3CxRIaE5d+A/oouAxheQomCrz/b06fnh51ioQYRAG8klVFraCn01Ih16PPEHEcCs4O0FDA==
X-Received: by 2002:a05:6000:102:b0:31f:a717:f1b6 with SMTP id
 o2-20020a056000010200b0031fa717f1b6mr2161986wrx.11.1697726868463; 
 Thu, 19 Oct 2023 07:47:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g15-20020adfe40f000000b0032d88e370basm4666883wrm.34.2023.10.19.07.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 07:47:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/rdma/vmw/pvrdma_cmd: Use correct struct in query_port()
Date: Thu, 19 Oct 2023 15:47:47 +0100
Message-Id: <20231019144747.2199130-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Thu, 19 Oct 2023 14:47:52 -0000

In query_port() we pass the address of a local pvrdma_port_attr
struct to the rdma_query_backend_port() function.  Unfortunately,
rdma_backend_query_port() wants a pointer to a struct ibv_port_attr,
and the two are not the same length.

Coverity spotted this (CID 1507146): pvrdma_port_attr is 48 bytes
long, and ibv_port_attr is 52 bytes, because it has a few extra
fields at the end.

Fortunately, all we do with the attrs struct after the call is to
read a few specific fields out of it which are all at the same
offsets in both structs, so we can simply make the local variable the
correct type.  This also lets us drop the cast (which should have
been a bit of a warning flag that we were doing something wrong
here).

We do however need to add extra casts for the fields of the
struct that are enums: clang will complain about the implicit
cast to a different enum type otherwise.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: Add explicit casts on the enum fields, and a comment about
why they're OK.
---
 hw/rdma/vmw/pvrdma_cmd.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index c6ed0259821..d385d18d9c0 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -129,23 +129,27 @@ static int query_port(PVRDMADev *dev, union pvrdma_cmd_req *req,
 {
     struct pvrdma_cmd_query_port *cmd = &req->query_port;
     struct pvrdma_cmd_query_port_resp *resp = &rsp->query_port_resp;
-    struct pvrdma_port_attr attrs = {};
+    struct ibv_port_attr attrs = {};
 
     if (cmd->port_num > MAX_PORTS) {
         return -EINVAL;
     }
 
-    if (rdma_backend_query_port(&dev->backend_dev,
-                                (struct ibv_port_attr *)&attrs)) {
+    if (rdma_backend_query_port(&dev->backend_dev, &attrs)) {
         return -ENOMEM;
     }
 
     memset(resp, 0, sizeof(*resp));
 
-    resp->attrs.state = dev->func0->device_active ? attrs.state :
-                                                    PVRDMA_PORT_DOWN;
-    resp->attrs.max_mtu = attrs.max_mtu;
-    resp->attrs.active_mtu = attrs.active_mtu;
+    /*
+     * The state, max_mtu and active_mtu fields are enums; the values
+     * for pvrdma_port_state and pvrdma_mtu match those for
+     * ibv_port_state and ibv_mtu, so we can cast them safely.
+     */
+    resp->attrs.state = dev->func0->device_active ?
+        (enum pvrdma_port_state)attrs.state : PVRDMA_PORT_DOWN;
+    resp->attrs.max_mtu = (enum pvrdma_mtu)attrs.max_mtu;
+    resp->attrs.active_mtu = (enum pvrdma_mtu)attrs.active_mtu;
     resp->attrs.phys_state = attrs.phys_state;
     resp->attrs.gid_tbl_len = MIN(MAX_PORT_GIDS, attrs.gid_tbl_len);
     resp->attrs.max_msg_sz = 1024;
-- 
2.34.1


