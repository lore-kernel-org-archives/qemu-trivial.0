Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kazwC-0004Kv-D5
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 06:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kazwA-0004K6-WC
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 06:29:47 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kazw8-00005a-CL
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 06:29:46 -0500
Received: by mail-wm1-x341.google.com with SMTP id s13so1004321wmh.4
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBzZbxOaDzhkED96Ml51ZDDBBbPq+OYnSrAXiAMh9s8=;
 b=d9e8ZSf/AGefJuuJ4O79zTi50Klm9dlLjQJeL89hxcdSYwBm1k+Ol5LGjADDKpYZAV
 lAobDEMY9gnZZHcKEMNRMgjY/bxWDobMT//xt6eAeu5oKUBzcxHh/sWy11EFAu3sjtiw
 CXY+3oQAKBLNSjL4KhN36rgAi2D18yqzFfzZlPE91OWOrtR2EHgItT4pmwgCBx+3wvlT
 NUulEnipjTXP2M8edbW5MuNgtsrNEaTw5m4gwLpLdzbPYvDT2bu3f47wxdKTHSww2fr+
 +0Z4CVMnEvwD5sZBEBwfwFzhCe7Td5UDX8ZdBiXJCRgeQ/R5O21Z8nr1c4X0q6SPxVpr
 w0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBzZbxOaDzhkED96Ml51ZDDBBbPq+OYnSrAXiAMh9s8=;
 b=AvbzNNYBkfbAxiCGHeOcbEsNajkAhCSaa9HPv+ktLzNeESvMHrMezaMyKU0erdcns7
 NKEURrp5BlyVeIzlAyVIDG7apaRT2QSVdFlg4SFsEnDv6mLFV7cDYwBioddwlhmGEENa
 gk+2cOuyEJOu+Y64WjBJsYZ80IyUCUW/PqMnYMMdoyXld8XrBRE1F9ss9gpXzkDfgj/j
 0koObgOnrL6oKC0NHLNZrWnQuzyaPAF62Erpb+PjLBc8ifwiYqbqnzhzl6oOZ5EUxLae
 OKGT6eFtWNaTlChjKqWv5Z4TYhgiKBhoVBDd48gg3UMQEyf0/3pko4jii5fhGBFdVnJc
 94yg==
X-Gm-Message-State: AOAM530k+9w193Fhu2KMUBk8jFBADFdJx/Mfij05EIo1Dz2dljwwk6y/
 HgRlBQA+KTuujHkLgX2JSnxObg==
X-Google-Smtp-Source: ABdhPJxWrkxCRFfga7ylwsyuh8c94BLbuiBI8XVFpfKfrFo/f8JVwa4eYVmhEnBiRptbZMd2ILQ6pg==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr2047297wma.182.1604662182672; 
 Fri, 06 Nov 2020 03:29:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h128sm2019919wme.38.2020.11.06.03.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 03:29:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gan Qixin <ganqixin@huawei.com>
Subject: [PATCH] CODING_STYLE.rst: Be less strict about 80 character limit
Date: Fri,  6 Nov 2020 11:29:40 +0000
Message-Id: <20201106112940.31300-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 06 Nov 2020 11:29:47 -0000

Relax the wording about line lengths a little bit; this goes with the
checkpatch changes to warn at 100 characters rather than 80.

(Compare the Linux kernel commit bdc48fa11e46f8; our coding style is
not theirs, but the rationale is good and applies to us too.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 CODING_STYLE.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
index 8b13ef0669e..7bf4e39d487 100644
--- a/CODING_STYLE.rst
+++ b/CODING_STYLE.rst
@@ -85,8 +85,13 @@ Line width
 Lines should be 80 characters; try not to make them longer.
 
 Sometimes it is hard to do, especially when dealing with QEMU subsystems
-that use long function or symbol names.  Even in that case, do not make
-lines much longer than 80 characters.
+that use long function or symbol names. If wrapping the line at 80 columns
+is obviously less readable and more awkward, prefer not to wrap it; better
+to have an 85 character line than one which is awkwardly wrapped.
+
+Even in that case, try not to make lines much longer than 80 characters.
+(The checkpatch script will warn at 100 characters, but this is intended
+as a guard against obviously-overlength lines, not a target.)
 
 Rationale:
 
-- 
2.20.1


