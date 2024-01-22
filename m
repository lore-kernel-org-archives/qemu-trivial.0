Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rS1bI-0005Ef-2V
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jan 2024 16:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rS1b7-00054j-0R
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 16:12:50 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rS1b3-0002RQ-Ko
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 16:12:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2906773c7e9so864209a91.1
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 13:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705957962; x=1706562762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BZA4U8FeZ42t0bbhSQ7qFVMrjXIpcqIQEt110wRVJmg=;
 b=dc/QndNeBHCq926xkoNBJwa8rR9o0j/lWibSHN4xYANfkiD7tL4X6XGoOrz+Ey6yil
 tXVOHGmtOnnb+/uzZPglE3foW3DCRd79kA9Ue+iG8mJ8CEOHXMNBIuDpjTuD4fQeaBdk
 tIPR63kczwF6Buu6pwW+M0HZsHmTViiEBQ1eT9mgg9WjMZDk48RkB3aWhsUNJNbOnCQT
 NAfcIpMnA0OZ60ni1XT28qv3dwg/HAFclWlPz4iPmhO8d45VFSq1RPMIZioTmOqkoJyT
 izh51gLltS/OiU89RuS/6D9G7OL3gIyRU+CB6Q2Tg0ABftzSsb+HfflXDQjJ/sArTrYS
 Jvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705957962; x=1706562762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZA4U8FeZ42t0bbhSQ7qFVMrjXIpcqIQEt110wRVJmg=;
 b=aDGWcg0nU824El/h9RkbE9cqO9ZVQEViKEn+qBTXqWkuVLBp841AcPW4ada/CyWpYb
 g/K0ExymNU5Pnt97fujCWhFnGOotUIvfNv1x74pqXiBbnkq/96k9NUjKsbwEeOs/0Sn8
 CvSaNApaP2TSZ0pxVR8z+ei+2IvMRVfkqQ/q6hkSrT7iAlEkuaDi1wIij8JgG3rM6Zam
 IqvY5vfDJe6HnvVqYZ+DduTgQLhWDoXrE/QEQC4F/bUWIi9a64wM+84OfsiQwbg9K7G1
 v2UAiJhkimFhIeotG0Lsz7aPeF75I9ZTqOOBjcJg50A+drLypMCQLeAdlQX0Bk+KjfPn
 fKRw==
X-Gm-Message-State: AOJu0YyA/8p7VQGyUoGwFS1TQxEkg9aFOsij7K1J3/cdFdtMKqXr7wwZ
 icNjOHpr5UQtnDXw5h102a4p45IsBuDHvcHC7OOXKOpN48/CTGj0E/sb429nTrYWIlMSrSJhdGE
 as5s=
X-Google-Smtp-Source: AGHT+IH+pgh2XdNWPI/Fn8UgrkugJbCpXEhxxjK8PdG5o6UMwfVJqBVNI5JcVainqswSWOiBGI20dg==
X-Received: by 2002:a17:90a:2f24:b0:28b:3335:1489 with SMTP id
 s33-20020a17090a2f2400b0028b33351489mr1866163pjd.99.1705957961972; 
 Mon, 22 Jan 2024 13:12:41 -0800 (PST)
Received: from amd.. ([2804:7f0:b401:e1f2:3e7c:3fff:fe7a:e83b])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a170903011100b001d71cbf200esm5972636plc.260.2024.01.22.13.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 13:12:41 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, gustavo.romero@linaro.org
Subject: [PATCH v2] docs/system/arm/virt.rst: Add note on CPU features off by
 default
Date: Mon, 22 Jan 2024 21:12:15 +0000
Message-Id: <20240122211215.95073-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Mon, 22 Jan 2024 21:12:51 -0000

Add a note on CPU features that are off by default in `virt` machines.
Some CPU features will remain off even if a CPU-capable CPU (e.g.,
`-cpu max`) is selected because they require support in both the CPU
itself and in the wider system. Therefore, the user, besides selecting a
CPU that supports such features, must also turn on the feature using a
machine option.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/virt.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index c245c52b7a..1888e31956 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -69,6 +69,19 @@ Supported guest CPU types:
 Note that the default is ``cortex-a15``, so for an AArch64 guest you must
 specify a CPU type.
 
+Also, please note that passing ``max`` CPU (i.e. ``-cpu max``) won't
+enable all the CPU features for a given ``virt`` machine. Where a CPU
+architectural feature requires support in both the CPU itself and in the
+wider system (e.g. the MTE feature), it may not be enabled by default,
+but instead requires a machine option to enable it.
+
+For example, MTE support must be enabled with ``-machine virt,mte=on``,
+as well as by selecting an MTE-capable CPU (e.g., ``max``) with the
+``-cpu`` option.
+
+See the machine-specific options below or check them for a given machine
+passing ``help``, like: ``-machine virt-9.0,help``.
+
 Graphics output is available, but unlike the x86 PC machine types
 there is no default display device enabled: you should select one from
 the Display devices section of "-device help". The recommended option
-- 
2.34.1


