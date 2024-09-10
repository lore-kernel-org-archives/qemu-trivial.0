Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzbe-0006rM-FE
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 08:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzbc-0006hJ-2b
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:04:24 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzba-0008VD-1B
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:04:23 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so723063e87.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725969860; x=1726574660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lsGYTq1QpiT+N/yyLFsqNm2hUCSVXF6KhaQHQJ1beN8=;
 b=QBjzUHbLll2vgeM2LW5epcfls6Smv+DJ4p1hIArmv6jh7CaVQO3YMVlkdXPyNmuG/k
 +jQD7kgN6g04IUotGk+1iLwHxyHTx7LmfRTXRiCm4lmTYeaa6MDZpjvqVEPsOvIBB/0r
 Q0BocK5aT+yrRzf08s7inuPGTW5MTJX5C3fRMJPswGe4AiZsNzf+aEcW0zjvzzTH64zj
 swtc9v2opriqgtxXlgTx8Ryp7jTrDAD5EDz84hyD3g4PVPIVprB8floaNfLlfJv1qZEi
 HUKQk/JKuWFs5w6uQ0n4YiZKRlMa+MV6rH4M1gN77mef6NhWBla2kyjGbvi0Wqrzg4ii
 nrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969860; x=1726574660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lsGYTq1QpiT+N/yyLFsqNm2hUCSVXF6KhaQHQJ1beN8=;
 b=G7bjcngtfqA0WQvdTIPHI1X1m0jg4b+VFXej4MReO32OlDtlURWdl6nNull+aCyX+b
 IGsNwQfpdyDGd1YVdHZGc+dRsUgWE7eL8waAYgHPl7hsV2aTF0N9wApZhLe7qE5BcBRz
 GfTHCtjxTSizZ+qzQ7lPNM9rJN5U1yGsQXAwOlBLQkpWTEwUUK9KITZPYgJWOpCKHm81
 eCH1YSq1urbb0R8LRtZPAAA17gfAPgnP4rs9/fWnDp+A9yAuVpYOn6J5BDouVYAKMDRS
 bEd4x9L21rLSRkE1++hQ7gVEijSBwwUxXWyJn7dmnZkUXPUqhkMPH3pKyMdXzvb+iT0p
 PYyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaI6QLG9E/ihl+GEObJ5RBcbVhSfqJay+gYuVUDghqQJdEu3ASQB5N02lw7oJZvBKH/8EXhHpl5mIW1RE=@nongnu.org
X-Gm-Message-State: AOJu0YwPZvC05e+y7HlGiIAXNtZGmxao6q7g38VBXetzWAhqSWuwc/FH
 RArK0vjc3FcT1VnrmkRVOidnwyw2E52tZVqkTbqZGRP1AlRCPxIvTueVQ8ucUHZZTBsNcgYN8+i
 i
X-Google-Smtp-Source: AGHT+IHZomFpW5IvxvKfqQMESqUXQlkgFLG2uBp/b0hD5sA0+xjowxtn0YpG/mdTiWxzeTdQv8HVJA==
X-Received: by 2002:a05:6512:104b:b0:533:4505:5b2d with SMTP id
 2adb3069b0e04-53658816b7amr7156781e87.60.1725969859748; 
 Tue, 10 Sep 2024 05:04:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d259f56f6sm464687866b.81.2024.09.10.05.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:04:19 -0700 (PDT)
Message-ID: <3849f9dc-57ce-4924-ba90-b2ad912ccd60@linaro.org>
Date: Tue, 10 Sep 2024 14:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] license: Update deprecated SPDX tag GPL-2.0 to
 GPL-2.0-only
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-trivial@nongnu.org
References: <20240910115131.28766-1-philmd@linaro.org>
 <20240910115131.28766-6-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910115131.28766-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 10 Sep 2024 12:04:24 -0000

On 10/9/24 13:51, Philippe Mathieu-Daudé wrote:
> The 'GPL-2.0' license identifier has been deprecated since license
> list version 3.0 [1] and replaced by the 'GPL-2.0-only' tag [2].
> 
> [1] https://spdx.org/licenses/GPL-2.0.html
> [2] https://spdx.org/licenses/GPL-2.0-only.html
> 
> Mechanical patch running:
> 
>    $ sed -i -e s/GPL-2.0/GPL-2.0-only/ \
>      $(git grep -l 'SPDX-License-Identifier: GPL-2.0$')

This didn't catch the full list, this command does:

   $ sed -i -e s/GPL-2.0/GPL-2.0-only/ \
     $(git grep -lE 'SPDX-License-Identifier: GPL-2.0( \*|$)' \
         | egrep -v '^linux-headers|^include/standard-headers')

Thus squashing:

-- >8 --
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index e5a47eab64..4dc4c31da2 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
  /*
   * This is copied + edited from kernel header files in
   * drivers/net/ethernet/intel/igb
diff --git a/tests/tcg/loongarch64/system/regdef.h 
b/tests/tcg/loongarch64/system/regdef.h
index faa09b2377..b586b4e86d 100644
--- a/tests/tcg/loongarch64/system/regdef.h
+++ b/tests/tcg/loongarch64/system/regdef.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
  /*
   * Copyright (c) 2021 Loongson Technology Corporation Limited
   */
---

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/crc-ccitt.h            | 2 +-
>   linux-user/alpha/syscallhdr.sh      | 2 +-
>   linux-user/arm/syscallhdr.sh        | 2 +-
>   linux-user/hppa/syscallhdr.sh       | 2 +-
>   linux-user/i386/syscallhdr.sh       | 2 +-
>   linux-user/m68k/syscallhdr.sh       | 2 +-
>   linux-user/microblaze/syscallhdr.sh | 2 +-
>   linux-user/mips/syscallhdr.sh       | 2 +-
>   linux-user/mips64/syscallhdr.sh     | 2 +-
>   linux-user/ppc/syscallhdr.sh        | 2 +-
>   linux-user/s390x/syscallhdr.sh      | 2 +-
>   linux-user/sh4/syscallhdr.sh        | 2 +-
>   linux-user/sparc/syscallhdr.sh      | 2 +-
>   linux-user/x86_64/syscallhdr.sh     | 2 +-
>   linux-user/xtensa/syscallhdr.sh     | 2 +-
>   scripts/kernel-doc                  | 2 +-
>   16 files changed, 16 insertions(+), 16 deletions(-)


