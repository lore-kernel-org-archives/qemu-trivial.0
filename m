Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665FCC54F51
	for <qemu-trivial@archiver.kernel.org>; Wed, 29 Jul 2026 20:56:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpBJi-0001C5-7P; Wed, 29 Jul 2026 16:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBJe-0001AT-Ku
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:55:50 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBJa-0003DD-QR
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:55:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c96c92c0980so815767a12.3
 for <qemu-trivial@nongnu.org>; Wed, 29 Jul 2026 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785358544; x=1785963344; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4Ej3DW1eY98qhiDvk0JOCuaGZCu99VknOoWcd6Cyo/Y=;
 b=Y2r2s5RbEBNXaEkorfdv28tR1v7t5YY1RZpvp7DWdjL0HnCnQopR+Zv2o1Opc/vJE0
 Px3a8lYqXZQIGRDBEjDxd1zFrT0FJyv6sejRxyko4uAvUYtAPDICvBmLAUmpCwfM8y+k
 PqY0ai1h2r6aPcLd8WiWRyYQjulHizcoIhySzzHyJ9cK9GhNID9HSk27L9o0X9lXiNXT
 uQmk+4P5+FUDh9hqK9dmFpXxmJrXLAcGwoK/UXsnIVSgEtyqAxqYCTO2Er1iFrZ0U8K6
 e8ALDPiXHfxX/NBbkmwJ1dJf7O0cTttpkHgJPMWo9ugO7OnFWUSkbC5drTTEY5p8A+sM
 IqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785358544; x=1785963344;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4Ej3DW1eY98qhiDvk0JOCuaGZCu99VknOoWcd6Cyo/Y=;
 b=CclJ+hYZ1yUQ+9kntq/u4Zxb3znexqJxuyy2mmy11SQmWwBm2EukjV0uFqAzm1NEjT
 L978iBwPUsdsB6iaGc+evb4nEaUukmyXwlsdRB+rWIao0gEctUwKs8MGNXt/0eUwhrQn
 FRqWIDP9CWsTvBlfTBihv1FubD2O8si+oGLQ7412GqBu98nDWaI6Zfr3Db//MUzLmYgD
 18Z8pZUlT21OBc2I5crpkGrWvUuAJGxFu2CwZVRl7ncl3UxrbqZQgeX4qqjHST7IhleS
 eXmoOsRpdm0TSZ6aCSdmGa0oxHKFhy5hUWibnUC0Q7JTVUYLwW7YP4qyH8LyzWXjtMUR
 cHSA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9eThdNgT1Dd64+jZv/CIeixg0CvJSrN1/tfto6ElMOPxNr2jR/VxJB4RSVETajXuYzi+1/I+SDGSKYOo=@nongnu.org
X-Gm-Message-State: AOJu0YwNMs7qzp7OpClqG8maTRJYCbnjssgsK+e0BlNRTjD1EXsq5uTp
 h92rUHZVbb8l7L6SmIg8zfb0MhXA0RdNYWkfnPR8boPDrVh88Nsr9OG1Uzhd6t54
X-Gm-Gg: AR+sD13Xec+1bjgmEHfLJTfuXGJ8WsZ2Iwp15Wkgo13eEZr/O4EyzjbnnSuwgWuGUwl
 rK+2cC3KZb0tg77WtE9jeac5aQrb0m0sRpDlH65PwxPUHGzhMS8b7o8cs2ugv73sHse0XG9VyZn
 f1gn4ATo7qfJgmkFa47be1PsB2YckqA0rU1NjdU2S3HnAWqM5B15Hw2vUt97Hk2R9lM+BjjmvOc
 ZIjAx2YRy4zPXcY98+fK0Rl1t8UhlPJ0fXOKBzhWu8vQxTFM6nq+E+pQG/g6sEce/8QtfQvEmkn
 h8OqJ1WhhAbVWSJYOUr372j34hvi7SPZcAFe7otRMIODTKHirH4cYWkqFH/IbPLL/cA0uOspa4K
 0kFycBLXkILxiGiFu0c1YwntjbRsZzqTuKQ0oGQ52KED0fKkORm7y+LlH3aSepm0MZlmfVDPY2S
 aaiXp2KAdMzUHPXASxyEBAxB4oNMvrpB2BtoL+dm3zhVp0CGiRyQpAGD6qI7AhFp6Jhhoy+PA=
X-Received: by 2002:a05:6a21:e598:b0:3c1:657:4c95 with SMTP id
 adf61e73a8af0-3c8aafbb6f3mr9745217637.15.1785358544055; 
 Wed, 29 Jul 2026 13:55:44 -0700 (PDT)
Received: from devone.local ([2600:8801:100:1910:66a:cb3f:f6a7:d5f0])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13e7271f010sm14868879c88.9.2026.07.29.13.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 13:55:43 -0700 (PDT)
From: Randy Schifflin <randy.schifflin@gmail.com>
Subject: [PATCH 0/2] Fixup TCG for SH-4 fmov instructions
Date: Wed, 29 Jul 2026 13:55:06 -0700
Message-Id: <20260729-sh4-fix-fmov-instructions-b4-v1-0-65cc9679025a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpoamoC/x2MQQqEMAwAvyI5G2i7UqlfEQ9dN645WKXRIoh/N
 3gcmJkLhDKTQFddkKmw8JoUbF3BOMf0J+SfMjjjvGldQJkbnPjEaVkLcpI9H+OukeC3wdZbEz/
 RhmA86GLLpO6774f7fgCv2TadbgAAAA==
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-trivial@nongnu.org, 
 Randy Schifflin <randy.schifflin@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1785358542; l=1490;
 i=randy.schifflin@gmail.com; s=id_rsa; h=from:subject:message-id;
 bh=itsnf1e7shsb3U99QVVAXSy3j9LfDJebKiBCUdL6j8k=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBALXHj1ozDvr3TmWcPoueK1kIy
 Q3yQ7HL5bbiu8J+P0QBzcchmw5nwN0avQmreXhYuMhz40g0dhCJPnJqNHg1FBflQPz2cgY7Utm3
 9lQrK/CQqWsjRwXMinMR7LrmtMFp9+up7MzdXoxmTLgPsKJ/dQmx0rUHx++mUSl8zl7lHO50YVD
 hsw1RHrkrXlxnUjRi+jtjgErRHvoRwSZpKc44yR62wV8chkTMnHtrn8hgL0Hh+jhHteNn4JTQB/
 wme8MghhliXR5oh9xirpeLlS9S4TBY3Vdk6ccgvncSS4uF/y2ZAAV5sNiLZ97OFkBhIQ0bXhVx9
 w1LPMkho650Iu9da5/0koNheHS2KAVC2FdPTyaxvqeFAsAB8fCprfh4lpShdcVpyChdd2KXFS53
 s9MAUQmZjG0pQvS/dqGCCDWqo7cY3J3VTMXwVtdzYkgZt5eMajL7z8VljXQ08ZgAStdizC/rHNg
 wy+fIL+6kgxvL/NhJwoiAWhC4D+xQY7SXjJGTvwAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgEMHxiLQ0BOxCRnjnKEKKuKYJCDd+wZcJEaL7JWKL6Zg00E4d
 045mj3nErjn+lz3m6UYQ6doqw1oVE1YyEj6cAah2k8xTCpbEcuo525Yk8tLEtmdDIvFvHqetX/Z
 xHn6qV8uW6HtJGQs0OT5/T4sWLmsr3etzPJed+EUNQlNr4j8hi0VUp/XxBLS4U6mKJfsN+VE6wu
 alN9VBGuPxdB3ObuS37r5atYG2WdezERWtXj3wJ7P6ySh5WeKzDMaGwcwR4d9cHlGiWvf7j6IqE
 sPgwVeQ0EC6dFllZVBF7Z+19B+Bust/btxn724BF0ldon8qPR+E9L09HepTgfCCX8bsiMDfHdWy
 JZQzMNZBHZCEYmMljMgEqF4wdCgccEJyU3Hkbcgfm9vzWVv1RI3uKf0NlPqfQp96pshfYrTSBfs
 ctGavzanDcXSlSIyxg+qraq0Ya4kVXWT8o/5inyuS53I7+cQK7NpDGDBjXdrvt0JBZ3k01maUAD
 /z8NXhThmzVr3Rw==
X-Developer-Key: i=randy.schifflin@gmail.com; a=openssh;
 fpr=SHA256:7gww1tlDoVPb7symWGdTNhRWcHyTORA23OcjS8eyd8Y
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=randy.schifflin@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

SH-4 manual for reference:
https://0x04.net/~mwk/doc/sh/e602156_sh4.pdf

There is an issue with the current TCG code generation for `fmov` 
instructions. When the operands are double-register to memory 
(or vice versa), the generated code treats it as an f64 load/store. 
However, as specified in the manual, this operation is only supported 
when the PR flag is 0 (single-precision) and the SZ flag is 1 
(pair transfer size). The correct semantics then are to read/write a 
pair of f32 values, rather than a single f64 value. This is 
semantically different in little-endian mode, as the word-ordering 
gets reversed writing two f32s versus one f64.

This PR adds TCG tests for all permutations of `fmov` operands,
and fixes the issues above by ensuring the PR and SZ flags are correct 
and properly handling an f32 pair instead of a single f64.

Signed-off-by: Randy Schifflin <randy.schifflin@gmail.com>
---
Randy Schifflin (2):
      target/sh4: add tcg tests for fmov instructions
      target/sh4: fixup tcg generation for sh4 `fmov` instructions.

 target/sh4/translate.c        |  82 ++++---
 tests/tcg/sh4/Makefile.target |   3 +
 tests/tcg/sh4/test-fpu-fmov.c | 518 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 568 insertions(+), 35 deletions(-)
---
base-commit: e1705a25aff35635c360bbaba4c2731d019a422a
change-id: 20260729-sh4-fix-fmov-instructions-b4-7610a3a19906

Best regards,
-- 
Randy Schifflin <randy.schifflin@gmail.com>


