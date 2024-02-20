Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsj-0000ja-BO
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsi-0000iL-14
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:40 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsX-0008FH-Av
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3cc2f9621aso548708366b.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419207; x=1709024007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVGSDDuh83CPH0ZtXdDBtmjkmYoWaBhCuelQOBGBJXM=;
 b=r4brvH6HJ/GfZN3mMe2U2ZhGV8FSuZPNeHNWOqVQLi873SInP4UmJ3gqWRKK/iv3NC
 oubYY67Pmd9kPcaOYUbVJMW8xbEHTmn5Id/OUISQWWD3YLr/oe22ryWA7ReJMn2ItLIR
 HCR3piTowuMkSqTz1yD4pi3RiD2KXMF6Vm52/ROUSNrSvhNvSCRUa/Y6pM7HpYx+Pwtz
 hhAjzqBdhecIm5agHgpIWBi5+fixR4uEmcCSKQjVVZM71mg2YqRy2ai/5gWRc3CTXf4X
 hUaInymicWdSQ9XJCpyw3xuWRFJCrFz5wBIxqWrw2idDGiZlUKiGVhIlwrn8M60ZLtkm
 qkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419207; x=1709024007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iVGSDDuh83CPH0ZtXdDBtmjkmYoWaBhCuelQOBGBJXM=;
 b=ILpItaSgjFYoRDw2L11Op2pCmOCYM2Jb6Es/pqmlPMZKO0/C+pH55Xyaks0cCbX6rS
 z4mwGb7h+RdK33Q450D3QMb7n6zv1XyNsTsBUVk2k9xyWp0qbnSEmgVsc/1YKvApz22F
 hMSMW54IgZuW6JVipwyvQUb3PnBNw8QqCDQkpZYiz7BUOeXyL3B6PGECB64KTwoOR+1u
 KHdrbTPCdv+A9XtKX+2AMs3DQJZjDSEYNcCmq9t4BuITmC7bxvQcSck7pLU0aVPNeS4P
 YWIlETcl9ZqYMivBd1wFN0ukxh77LW+XtO63ZV3V66oRs5UA3120eqU+e18gZK49UnEv
 WeSA==
X-Gm-Message-State: AOJu0YyZ44LgMMAmxrA3PoOjeMMraGISufYITWcUpriPBvDF2Zq6uJMk
 LR5zahyZ0Gx/lJ0V3AhGXNPOFacZTe46HY8trdiJleUdzg5S/irPJE0IY1Mi2magQtpAdCXv+e6
 J0Rg=
X-Google-Smtp-Source: AGHT+IHE6LTWqTn4TCP9TiKtgZGQ3JJ/Tt0dG5+iRdrHh49z7Am7MlQk6hJZ4pYios2ZDJ/NaMIrvw==
X-Received: by 2002:a17:906:2785:b0:a3e:b523:6c8 with SMTP id
 j5-20020a170906278500b00a3eb52306c8mr2124297ejc.67.1708419206913; 
 Tue, 20 Feb 2024 00:53:26 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:26 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v1 15/21] qapi/ui: correct typos
Date: Tue, 20 Feb 2024 10:52:22 +0200
Message-Id: <2b12236539211bfa887364cf7b621586addbb42e.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:40 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 qapi/ui.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index b6d7e142b7..1448eaca73 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -63,7 +63,7 @@
 ##
 # @SetPasswordOptionsVnc:
 #
-# Options for set_password specific to the VNC procotol.
+# Options for set_password specific to the VNC protocol.
 #
 # @display: The id of the display where the password should be
 #     changed.  Defaults to the first.
@@ -125,7 +125,7 @@
 ##
 # @ExpirePasswordOptionsVnc:
 #
-# Options for expire_password specific to the VNC procotol.
+# Options for expire_password specific to the VNC protocol.
 #
 # @display: The id of the display where the expiration should be
 #     changed.  Defaults to the first.
-- 
γαῖα πυρί μιχθήτω


