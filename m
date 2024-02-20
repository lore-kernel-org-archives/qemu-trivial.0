Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLse-0000bG-HE
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsd-0000aA-Gq
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:35 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsZ-0008GC-Ii
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3cc2f9621aso548712566b.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419209; x=1709024009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAkF59EwY8fUX/a1Fp7pYk/1Z9QBW83OQ84YuPeKoyg=;
 b=qWeQ/MeNtR1jE9NFHt+d0iHNu7YE7z9BpesW9tNYBvcPDYjs1Ay+73Rc3vk0mGwHmZ
 G6JPq0hgKXJd0Lv0bDex7vsuFJw98hX39MDZbOm0OKsooVeJSx/9IKcp3Nq29jGk3VmT
 cZPMOBkOhsxmO8hJxYAth1rOOCDt8gurT1KwM8WvT6SYROLiBC9toTqK4plxpHEkWIrh
 gl1MoL8jTKGX40al8e0t+iQu4egbIOetKcsrldq64w2BF4bS6IW6f4vF22RpNKLCOGLj
 cD8OViB2Tat6RBURIOTKSMJKhbczxWE7lB+BW/WjSLG+1Q0kt9FW/YmnVvd69P+LuAtp
 kt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419209; x=1709024009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAkF59EwY8fUX/a1Fp7pYk/1Z9QBW83OQ84YuPeKoyg=;
 b=FuHYatyPAt14wdb8RAgX5aepmDGJOkTBmGhYcsH2vjPbV5j0N/IkmYrUpfqwOBNwId
 gIpvcgsFIZ0T43FddjxdhKbd5/A+NnXHEdGBkXvoF/F0LI4y/POLLtSXQIJgjgsQ98R6
 YXYF6eDeiomwJb5vB83jq7LMbT7Ixv2idR5oWAB3t6O7hKEI2qxO06VxiMHfU19aVLBT
 3O1iR0pwAvUMhytyGqh53KgILe78XGYZ7TlEsBlAywGMepIFV1Hdzx1YtZLmWn84ZY56
 gu3+zlImfDqMJNXnV+QCi4g3xA3Dl2vVmi0sJIJLZHTJutkeeEFGf4MDd6MzfZNsTErP
 RGXA==
X-Gm-Message-State: AOJu0YwoB+jF5MIoUmRlsh/8DkO4wE7r7ehgFaW+SVxlo4mD8n5V8OvY
 S+0PP7ze/kxOdioTqYjHrcO15qfbO3lb/zifyrOZGLyLd0dt7bl1ddSX7ngdz03AkUpIotN2FLx
 iwVg=
X-Google-Smtp-Source: AGHT+IFVNV4VkPgHeK7Q36xRCLjSLsuWQVy25lUslwaUxEQijO3QqmVboW0ePWIP8MGtoBOZZfhW4Q==
X-Received: by 2002:a17:906:1249:b0:a3b:e8f3:25d with SMTP id
 u9-20020a170906124900b00a3be8f3025dmr8895757eja.75.1708419209539; 
 Tue, 20 Feb 2024 00:53:29 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:29 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 17/21] ci/gitlab-pipeline-status: correct typos
Date: Tue, 20 Feb 2024 10:52:24 +0200
Message-Id: <5f804fdf765bd656296743315293695ed803ee0c.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:35 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 scripts/ci/gitlab-pipeline-status | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
index e3343b0510..39f3c22c66 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -131,7 +131,7 @@ def create_parser():
                               'checks of the pipeline status.  Defaults '
                               'to %(default)s'))
     parser.add_argument('-w', '--wait', action='store_true', default=False,
-                        help=('Wether to wait, instead of checking only once '
+                        help=('Whether to wait, instead of checking only once '
                               'the status of a pipeline'))
     parser.add_argument('-p', '--project-id', type=int, default=11167699,
                         help=('The GitLab project ID. Defaults to the project '
-- 
γαῖα πυρί μιχθήτω


