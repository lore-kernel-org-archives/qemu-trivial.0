Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsnnh-000188-Rb
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 10:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsnng-00017n-QU
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 10:42:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsnnf-0003fE-39
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 10:42:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso58578wmc.1
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECdCjep+exRjL8EyrEnPOHozC3bO4JnEMpjKGLksv7w=;
 b=p+cvOKVc367KO/Y819uCbsbB8RwiHK6FyMEDc9EUdyN3TuAqPhy2C09HooVzTelvM+
 LByk+PvJevXi+SilqBOnW1pqh0irik2x4Z0cld70EL0tpF8ImVf8eW5Zup4yzf9X2YiE
 PtYXFq51GVUoyiHfLjsdamXUYFf2HP+9HffBDbuFhS5h43LHQyIdU6zkG2mRj5TMTrpv
 t4ZwyaRwwRQi6BdTIWj71d3hrAgPXwMyUEtBhdyWQRvMFeAFArgBSo9avzf4cWgltXJH
 eZRMLKfl0kfQySS0CkBILC84MW+ZI/KpINoxj8YbihN84SI2udmUDO4NJEe2Gqo4HP13
 Ag1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECdCjep+exRjL8EyrEnPOHozC3bO4JnEMpjKGLksv7w=;
 b=ZPtrU2FslS2g+SGBnj7NFJ7MxrlBCNST6kjQatckNR0PKFqso5Cb8NaIbC+KhwH5n+
 w9D7qCdRiUqIp8FEL5lajvSr0iIo0vpUdoRFX7hJnfI4/cgHgeMGHHRkhq7kCPwmIuTl
 1ZSZwN5qB/XQsmFCfVSqZ/1asHzj/2wwPNrxPhdMJ/Q+lpAZwuslc0CwHbOHnGo2Ahmn
 VuQAI1sERZSfjIpmdKfDVfYcEreifIPjCRAMO55xIPQN6xPHqyfR88gSMedgbDVjsZuP
 jefjL2cZMtKKKzYtAJOof1Xu3QEb0uWhsAK8atPR+6hiI5rT1lULN933iXCKztdhNcUa
 n1XQ==
X-Gm-Message-State: AOAM530+rgiS0wr6COAgTIggjo34oSFBhaE9P9fENsn4Zz/8zfYIZRq4
 CWnFkg2w7l1QX64DEd/DMPSj0A==
X-Google-Smtp-Source: ABdhPJycLlmqHpodz26exmaF99Yy8mAiLLXSt6s5NFOS8/5oAQ7+m6DhBKBpj4AIMrEydZkP/guZyA==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr33712963wmq.40.1623681769583; 
 Mon, 14 Jun 2021 07:42:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u18sm13128922wmj.15.2021.06.14.07.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 07:42:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B6BB1FF7E;
 Mon, 14 Jun 2021 15:42:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] linux-user/trace-events: fix minor typo in format string
Date: Mon, 14 Jun 2021 15:42:45 +0100
Message-Id: <20210614144245.17660-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 14 Jun 2021 14:42:53 -0000

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix typo in summary :-O
---
 linux-user/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/trace-events b/linux-user/trace-events
index 1ec0d11ee3..e7d2f54e94 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
 user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
-user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
+user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
 user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
 
-- 
2.20.1


