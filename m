Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYSNP-0007D1-J1
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 10:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSNM-0007Bs-72
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:01:12 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSNE-0000WN-Ll
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:01:08 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-511689cc22aso1593472e87.0
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707490862; x=1708095662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+v+hVYqqgGqr1jR1gLh8c+Nc8frKXqRwnR2qVdfBAM=;
 b=gQZ+/++9DhdhU+cVWQZEWYpuOq9m6m7J8yrpBWBqb7CbPjxkYdNrQE6SBmLr1jloA4
 OoyW4vlcTlD/HuY5NKAlfL5Fa/1jC8GAOmQiEtx+xfSVQPHxvqpAqUui0fpWvB4GfZH9
 8yK5N+wa17HZWKkkW9J3djnj7WoTK4s++pQeWTASgt4uDIkPWiWGSrv8t2JHUIcvCprh
 qNpxVa7DFnSiGApdJlDM6R4P+woOAEQdhAJKM/4VpB/zLtXGe63F5zy+FpxOzdpxVYOG
 53XOmEjCJlK8PmGEaZOvxxEZzy67cexi6t3qdehwsTv4kSELcKCID+JBczMZLcLs9e97
 Dz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707490862; x=1708095662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+v+hVYqqgGqr1jR1gLh8c+Nc8frKXqRwnR2qVdfBAM=;
 b=E66WqAg9BlIA7C12l/Ju8fStIRcEKy+OAoGWS2nrjLcC4n0l4JikffRFQh2mbCeAMQ
 thvrN3Rz2xldI6UCSM04N13v7B7uwLHP5IOcoZUXR255Za6rxZTWIK+GfOF6KNjhdHIw
 VZUA8WSv6EShFvxcfc4G5aeGaG7KXUpy3Qo+NqsOxn37x8vA0GVqQVjY9HumwdmUSvff
 0RcsphQi8jgmVUqlGFXjndgzlcsNI13wYyhAQddF3aXLAaXIli/Zhv8azIvPOR2jvIby
 oNE1rgT0Nd+pCt05NsCqX5+cLqeJj2JFB6t6LMi/8MRJA4UhQ1DEVK5jnwpFGEiiLFas
 iKpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN708ZK2OVtuTLd+beVZyPVWnYq/1Llv0kn4lzjWn7CYl8mpB58Bc7NeLVCicg9bNYCC1f0AqTnAbwhLiahnv1EiuFgZPckQ==
X-Gm-Message-State: AOJu0YyvcKw6YHNOzfbVcoZiqQPHeGcKlvJoa6LN9vR1QSgXXhbO/NGi
 AtgviKMB9XIIcF9nE1DDwD2oE7Frp6ItEJHOpXi0U13KSsFZ+RkKuBSziB1RCSE=
X-Google-Smtp-Source: AGHT+IFj+aGJPIoWWprFQKssNruIS63gbqlWCLeY5MKQt390gW3/zz++pRSa2b2EN65G6hitUVtmCw==
X-Received: by 2002:a05:6512:2c96:b0:511:4f29:7fab with SMTP id
 dw22-20020a0565122c9600b005114f297fabmr1475511lfb.67.1707490862517; 
 Fri, 09 Feb 2024 07:01:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZNjfWqNiyfom6BZ2L7hpksOZx/tzkSC2EQ5fQRv0BbS+gqkdph1PmuO848Z9G/fJWY8ua7PA+mkYC97ImZjv4svlV4205j16Ac9q/xdM3f8cQCx2mBaSBPz0+AfztfvuzbGIogF6yepqAF0bzG/+zdnz+BaoTYkaSShE3mbreVMKgmku5T/0XZUneOm1NLSJ6Vz7iyDivLheiGOb/Mw8DDreeMoJinQbBhTkK43+h+O9oQ7Wu7kd4Ol+1P+H8yCuP9JaHIccIMlN5E9ppCoxqRY/8Wqh3lw==
Received: from m1x-phil.lan ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0040fafd84095sm924049wmq.41.2024.02.09.07.01.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Feb 2024 07:01:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Subject: [PATCH 3/3] system/physmem: Assign global system I/O Memory to machine
Date: Fri,  9 Feb 2024 16:00:39 +0100
Message-ID: <20240209150039.22211-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240209150039.22211-1-philmd@linaro.org>
References: <20240209150039.22211-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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
X-List-Received-Date: Fri, 09 Feb 2024 15:01:13 -0000

So far there is only one system I/O and one system
memory per machine.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index 5e66d9ae36..50947a374e 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2554,12 +2554,13 @@ static void memory_map_init(void)
 {
     system_memory = g_malloc(sizeof(*system_memory));
 
-    memory_region_init(system_memory, NULL, "system", UINT64_MAX);
+    memory_region_init(system_memory, OBJECT(current_machine),
+                       "system", UINT64_MAX);
     address_space_init(&address_space_memory, system_memory, "memory");
 
     system_io = g_malloc(sizeof(*system_io));
-    memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL, "io",
-                          65536);
+    memory_region_init_io(system_io, OBJECT(current_machine),
+                          &unassigned_io_ops, NULL, "io", 65535);
     address_space_init(&address_space_io, system_io, "I/O");
 }
 
-- 
2.41.0


