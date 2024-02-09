Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYSN8-00074v-1L
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 10:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSN2-00071Q-FH
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:00:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSN0-0000Qb-1U
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:00:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b68b26c55so97105f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 07:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707490843; x=1708095643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jR1Xb2v8k/8ZZSdjWOz5eRsjS9ULRCmvbK4cgzEA0yE=;
 b=bIvvJpm/AvO81pUi8HW+NMb7AXrUji8IpJQ/5xPKH4GUsCu0am/Oi9iF4ZiKIhG8j7
 lv0DE9r3eOYGrsR2kkmDliidbARI0BiayGJ087elm52QoMkrXm1/tTJlTz9Zd9ay29ir
 3H/GaZH58/blH/olDxy7yKPQ/lcLeNigpbiyesMAmi/5xMFhsnXLllwoRJGySoa8j5wd
 8dJ1sx8cBGmBuP5Dsb9J+kGtHKmTDS53zsHaaDLb+o5+W2Gj72FgSIvrH7XP9wnguIVp
 bPNaBPy5Pnvl4t9tRGmFoSBzya0EkXKlAIENJiQuyHwwEbYt15tUqF4i5psYUHkV+xg7
 tMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707490843; x=1708095643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR1Xb2v8k/8ZZSdjWOz5eRsjS9ULRCmvbK4cgzEA0yE=;
 b=Ls3cZ9ptyUnl4JC0wvQJeMQmUaB8NfMUbGBnaHJxgS24RasPm/DnfGZZLJdJzevPu4
 pHrXZGCAt6OqLaqBPD4hA1BjFmDjxG1TEbV4A7SK8S1BFYe7HdFgHguu1DLde3wv4DH8
 Q32l1A1yzYpq7G1+4Kb7fZPWWQD7pYmU4IZUOjsphku6P18Z0jWOHpOlqcIlWeiC98cF
 Z9lQ3nt+XWtkaX1Rt3j10T5ouVIMiyp11zEsFjYqrwKH1uCfPP+LvU03rH4l2uHhN/Wf
 /zaM6nSuQ+pOZrI9wT1ZwbJI6ELYmg3C8QjuHztzZ0O1RHNvZbUDFbdT930YRhsvIr0p
 xvZA==
X-Gm-Message-State: AOJu0YwZcnU83R/4irVVmqpjKI2H99g/W5yqiniXWCF0cIgLVA1cocIg
 yWR5p/c778xN6ShDGIwHCdiWGH5oXKSDAgoYNDFujOEKTfpFhk1jeTjck4s99Xs=
X-Google-Smtp-Source: AGHT+IFr8tqt0PvUirWWa9r0FVucaZjWYCAGc5hFrPUoLcAczMtZRy0eeVHUpWrC3sx0SNSuT6i0vw==
X-Received: by 2002:a05:6000:1183:b0:33b:1c33:2b3b with SMTP id
 g3-20020a056000118300b0033b1c332b3bmr1394869wrx.2.1707490843431; 
 Fri, 09 Feb 2024 07:00:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCVYKktD6KbWGfXstpNQihAEDcwzJ/Q1jtZdEitGAB6S3zLmAVlUO+a2ukDuFHf/cb0o9ZDvL4O4wFiTMDTYP6pWcSxQYaYjab1egR0H654eGCVGG4tYQv0HAmZn6ZV4WQCMfaP3cQlJ7zp0LX3i+Xs2KddyFeGzNnogCbdX47cAdfSjYO7LRA4zbcCjqqqNUHwTLbGAvpQmsbSt+td65kX0RsbxuGxwZZdEjTk+lRWMl2bevPT0D+9ScH99nV9rpQmRF0TIk+rJi75Fw1ycLn1cQuPqo8g==
Received: from m1x-phil.lan ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a05600c348f00b0041083b718e8sm219747wmq.43.2024.02.09.07.00.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Feb 2024 07:00:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Subject: [PATCH 0/3] system/memory: Trivial fixes
Date: Fri,  9 Feb 2024 16:00:36 +0100
Message-ID: <20240209150039.22211-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Feb 2024 15:00:53 -0000

- Include missing "exec/memory.h"
- Set machine as parent of io/mem regions

Philippe Mathieu-Daudé (3):
  cpu-target: Include missing 'exec/memory.h' header
  monitor/target: Include missing 'exec/memory.h' header
  system/physmem: Assign global system I/O Memory to machine

 cpu-target.c              | 1 +
 monitor/hmp-cmds-target.c | 1 +
 system/physmem.c          | 7 ++++---
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.41.0


