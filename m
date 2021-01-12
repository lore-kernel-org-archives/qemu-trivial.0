Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzNGA-0003kc-Pg
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 12:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG8-0003gM-HU; Tue, 12 Jan 2021 12:15:08 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG5-0004uA-UY; Tue, 12 Jan 2021 12:15:08 -0500
Received: by mail-ej1-x634.google.com with SMTP id lt17so4622880ejb.3;
 Tue, 12 Jan 2021 09:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E32qdYLqzFMMYrI5MZeNvAqG0VE5UJ2Fib0kQ0NVFVk=;
 b=X7Pml1zifvQRoawinF3/zdcGSvahvUQzlo2RTNAW4ouJOUZjIwyYxifxO8Zdd1TEdM
 6smXy2SbxMbWE27zFy/vbs4OGu/Y4qBKFQBjCqR4KBa9Xikg8sVJtdqTvxgDxvvgqj/U
 U6OVlKxy1gENM9EDlwKAsMvgEH50FPV0dv/p2ue8iF0rFEcRlVvNX2vndE/yn1paTg4Y
 oLb/M0UB2k987hFT+ervjaArmNFic6dzxGYvzr7o6ZwCwLk2OCzWVCXFg8Ng3HPHy0dW
 flAodCZrdlSc0fIHhUqklhEEHTxWiFZehxAIOokxzqnO7dsUKcHy555vvL7ARTikg1FR
 eqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E32qdYLqzFMMYrI5MZeNvAqG0VE5UJ2Fib0kQ0NVFVk=;
 b=Qa6sZTV63A3Ql3pX+n5E0vl6Bw9Uo/2qDQZX3XdI3+jTLRPoeR2k5FDONSZbpavij1
 vrrrENLIgLyD831mUedohqlrNQr96rjPvvCDA+LMy5MQ0bifhGLqEEXLeTtoOE0YyPvI
 1GaLUV2fwDDNoUL/z1D5CLZjfBizVYuSsgTPm/BgInWjPHi9C5BIV5JgH/segXgzazFI
 4SVAyaV5+3nrnamlr7HXUHvjGY4pLzlPUVDyXBlKlOUN/FrJzPHUzLa+wPXykyEVnDsB
 KD7For8SNtEV848MdfHyUmZgeu36e4pwyIAQSRYiS+JgVu2207hdeCGaaFG2ePRgHiOo
 UeIA==
X-Gm-Message-State: AOAM532yagIimHWT9q3Yqpfmx5PW4f0YgqhKEYJRMjtO8ZCfAg2O7Hfn
 lm6cU3rd4vEB3oTh1Pj8oIA9Ey1OEgGC6w==
X-Google-Smtp-Source: ABdhPJxInmw1C5G5ffimbSjDXD2DAoodXC8WGcyoSGrpjBFlpPuH8hkD/tDfgYNVD5gXDYMN4POq8Q==
X-Received: by 2002:a17:906:4d52:: with SMTP id
 b18mr3686728ejv.405.1610471702048; 
 Tue, 12 Jan 2021 09:15:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:01 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Keqian Zhu <zhukeqian1@huawei.com>, qemu-trivial@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 11/20] Docs/RCU: Correct sample code of qatomic_rcu_set
Date: Tue, 12 Jan 2021 18:14:41 +0100
Message-Id: <20210112171450.791427-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 17:15:09 -0000

From: Keqian Zhu <zhukeqian1@huawei.com>

Correct sample code to avoid confusing readers.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210106071710.15836-1-zhukeqian1@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rcu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
index cdf002edd8..2e6cc607a1 100644
--- a/docs/devel/rcu.txt
+++ b/docs/devel/rcu.txt
@@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
 
             /* Removal phase.  */
             old_array = global_array;
-            qatomic_rcu_set(&new_array->data, new_array);
+            qatomic_rcu_set(&global_array, new_array);
             synchronize_rcu();
 
             /* Reclamation phase.  */
-- 
2.29.2



