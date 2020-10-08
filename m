Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQYbx-00006v-SB
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 12:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.turek@gmail.com>)
 id 1kQWfE-0007NY-SP
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 10:13:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brian.turek@gmail.com>)
 id 1kQWfD-00045S-A4
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 10:13:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id n18so6800718wrs.5
 for <qemu-trivial@nongnu.org>; Thu, 08 Oct 2020 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3EWFtYWy1PxrutwWixMHjNhMppH8NW5awcdMGVYfFc=;
 b=Rk+GXiUuLt+V7PLOjcT2A074nOPuweVzV1+BVvCcaXZsqSofVqnOAbup7nzJxMruPm
 tWitm01HrNLY7g9wSNW0SAw+ZKPOXEMT4GcrgaD73VGv5GVMat1+7dR4KNqGOzVyR3cF
 ri4QRrh8i168h5Vd5fPogoTHgaeRqHOUMjKb4TaisH8TXJQ90d8+m4ozp/E/Eiu4KQ7t
 vL78Ydgi2zfaaAq5EIUC+9Sm6GOEmktHEdVdtURop/jjzZ0kuLgtLEkcYRe0N8CuuOkh
 L7tCcthUoeGThhvNkYnBRm5bvxjUNFZJlJQCUjvAmRY+GUPRe4k3PNANkmqB5ITHyjLR
 Yh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3EWFtYWy1PxrutwWixMHjNhMppH8NW5awcdMGVYfFc=;
 b=ghigiwraM83Lpn5bnYwi/zGTh7dHr7KFDBPJpTBmIqozESmK2DPBABJpUEmrGgG/hd
 mG+IJm05xOtQLAnSqk3ZIEHDKHJyH3TNxnbf4LROoFopoH8sJs4Bkc++kvBX5KyYgc0G
 vf8Gip7vJmu62WX7qpFeFjB5dwTrfzlMTJeHqXmMoN3Nx9Fy7Sid88FkaKhMyhCw8ymb
 mxvkVkUXQ8HmhnEZx6etksJKTCIc12ckqjWbxIM9V9OjRzmOVb5q0J19E8KkVyot+B6e
 58Rz3J5fB35SSVBC+/IqHrNwel2edaOkcyp64nr9DZqQvmWreOzuMv2umr7PosGEwh0w
 B5sA==
X-Gm-Message-State: AOAM532cHkxRFfqa6CaFDUQ/sdoFfpyTXDqyzo+unI98FrSpcXFFWSAO
 XUIL6x28xc0SQ5AhBUpoIvI/08kgFQP+QA==
X-Google-Smtp-Source: ABdhPJwkImjVCFtcHElJi8Aea4QB4ppf8XiLJ8+H8dpgXHsKS3QgY3yTfQlATdW9q1omYDyUTLUTWw==
X-Received: by 2002:adf:9541:: with SMTP id 59mr9624731wrs.396.1602166377571; 
 Thu, 08 Oct 2020 07:12:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc75556-harg6-2-0-cust35.7-1.cable.virginm.net. [86.3.36.36])
 by smtp.gmail.com with ESMTPSA id a199sm7565353wmd.8.2020.10.08.07.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:12:57 -0700 (PDT)
From: Brian Turek <brian.turek@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Brian Turek <brian.turek@gmail.com>
Subject: [PATCH 1/1] docs: Clarify formatting for 'fmode' and 'dmode'
Date: Thu,  8 Oct 2020 15:12:31 +0100
Message-Id: <20201008141231.5738-2-brian.turek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201008141231.5738-1-brian.turek@gmail.com>
References: <20201008141231.5738-1-brian.turek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=brian.turek@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Oct 2020 12:17:42 -0400
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
X-List-Received-Date: Thu, 08 Oct 2020 14:13:01 -0000

Explictly state that the 'fmode' and 'dmode' values for a fsdev/virtfs
must be formatted with a preceeding 0 to be interpreted as base-8.
Currently the code will parse a value like "644" as base-10 which leads
to unexpected behavior.

Signed-off-by: Brian Turek <brian.turek@gmail.com>
---
 qemu-options.hx | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 1da52a269c..b92f32005a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1492,12 +1492,16 @@ SRST
     ``fmode=fmode``
         Specifies the default mode for newly created files on the host.
         Works only with security models "mapped-xattr" and
-        "mapped-file".
+        "mapped-file". Must be formatted with a preceeding 0 to be
+        interpreted as a octal value (e.g. 0644). The setuid, setgid,
+        and sticky bit are all ignored.
 
     ``dmode=dmode``
         Specifies the default mode for newly created directories on the
         host. Works only with security models "mapped-xattr" and
-        "mapped-file".
+        "mapped-file". Must be formatted with a preceeding 0 to be
+        interpreted as a octal value (e.g. 0755). The setuid, setgid,
+        and sticky bit are all ignored.
 
     ``throttling.bps-total=b,throttling.bps-read=r,throttling.bps-write=w``
         Specify bandwidth throttling limits in bytes per second, either
-- 
2.25.1


