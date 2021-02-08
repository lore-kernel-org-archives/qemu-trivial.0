Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l94rX-0005k1-HM
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2021 06:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94rM-0005iV-FT
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 06:37:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94rE-00052J-T8
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 06:37:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id u14so16693677wri.3
 for <qemu-trivial@nongnu.org>; Mon, 08 Feb 2021 03:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+9T4r0TCi3EB/RVY07CvBs5uobmRjxRJ/NckeQRa2M=;
 b=sIAKhnRWbxtec9lx89+141c/cTWYv/oN1HjfVJhSWOj7WQMxxHg0MDEfrDzN4sI3x3
 cHYoosI1bwRT+dJcLfg2NPWoFrdOUwD8jphqANzaMLSAGn4O2IKTIfuqtdh3RODJRcbl
 AC8AGRX+gXgadL19aaCOMG7cRWVlKvG7G0X0Y2Hh+HBLccBk3foeNnGn9uYmxFKO3aeg
 65uHgxBZn5qGeBytxXScrLhaNZxkrdpMGT/19Gaxv8oalHZZ+3Jy1FnrXGhZ6fZw43OX
 eu7yuRXbcOdDn9Oc3+3ZJ+GCUc+o6BHv1jrsZ2j9YaiSLYC2x/uvaXigWnEDYgr+r18a
 ZAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+9T4r0TCi3EB/RVY07CvBs5uobmRjxRJ/NckeQRa2M=;
 b=r5zDXJRG1GPYyz0n/hNDsFsVxzjo7lBD3KkF1SVhh38oe8mEKRwPeZD2/VW3E0WoRL
 I+9U4ufl9+VnSXFN8LU54GscdbBkZnyFArccteUrUUX8w3O0zNwbPj+dNcPGdz+M8849
 +H+Ayfd/vsu4pACZcajiTkHM5sPbnuwyzZLmuwThqAs0aUWmIozqzvPKfBXtDgzbhMh3
 ME45QIHApqEHTU9T0V1sXs+K11FjCRs/KbNAvMfA55hnYWboWoYMEuX7z+0/2i+nM1EI
 gfoKu//T9gmgL0sFWddlQheeHLZLRsZQP0+/QfSna+nvOlLJcuRg5yfp1pd/MG7GvUI6
 Ksjw==
X-Gm-Message-State: AOAM530QdK7RByP9I6WMZxoSx5lbX1v4LFGkuX9WUs0pyI495/eLoMSk
 NIkBLvS6bKCnzTl8jU4SF2QwjU5jrcXnTA==
X-Google-Smtp-Source: ABdhPJxof+O6/4ovM4NcEL/z0MxCEi9XtWfmM0ofE/O3Lz8RUhxihg+deFd5qlTp7L5TsASEfLr2bw==
X-Received: by 2002:adf:8523:: with SMTP id 32mr6332257wrh.275.1612784251181; 
 Mon, 08 Feb 2021 03:37:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p9sm28649900wrj.11.2021.02.08.03.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:37:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Mon,  8 Feb 2021 11:37:29 +0000
Message-Id: <20210208113729.25170-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 11:37:48 -0000

The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed this because my recent patchset which touched gdbstub.h
didn't cause check-maintainers to add the gdb stub maintainers
automatically.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966d..f5e27502435 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2336,6 +2336,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
+F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 
-- 
2.20.1


