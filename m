Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCGXf-0003sj-DO
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 06:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sCGXe-0003sC-1z
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 06:28:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sCGXc-0006vO-6k
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 06:28:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35507a3a038so1177925f8f.0
 for <qemu-trivial@nongnu.org>; Wed, 29 May 2024 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716978498; x=1717583298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=veksHZG8ToetqWrM4ivblkbjvQQeHXcyu43Kx+l+0Zc=;
 b=nF0ZglrI3XGiCnsP5VIHmfq/oqPKOFzetygzp3GSTJC/6JHl21uY9UuBifNcaGg+Y9
 TXw7yta80xlRNiL9N4CbFuIvuqh9xCWkUcf72VK0o+me5YMy5fJL6qRB2SUmCnsQZDJE
 dbSfOwb52T9BaEb2vaoEk5q7i3/+t9zb7NdqCNBr/82oTALzrhIBEHscU33rocxmezXK
 X50VoVEPwgVTZ8tP7vxuop6c/LCBPBmd9qw0R4AdlBe1FQLUt2uI2myMsAmBuZRANywJ
 UXTOzGgnwXkJpsXQpTqQ9uk+ZMGIUoB4pzzr22OopT7Q4vr6eP4NTkq7XWA8JAWEETlE
 QcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716978498; x=1717583298;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veksHZG8ToetqWrM4ivblkbjvQQeHXcyu43Kx+l+0Zc=;
 b=HeM3qlDoAIcHdjADHQuCVRfZaIKz35I89r0WbUI+tdMEd62pOCp8CN5nzKR6UHTbuQ
 Gn6CHteoZgouOouugP2gq97VSHbgiLeH5YKFsUelcNzNL6EqnRBcSSWOPCv/9yGXdMC2
 UCslq9mquFPgaQBYwUzdKcgSTqwojxGwCZ5vIrBHf+5YMXSzhDltkuuTS7F8yohMNZ7g
 7pQRCJulwsSTAJ2O4SFO5PBkpSivs/5VFpTxVyC7/HzXO4zbbDQ3biQkwEmvwr9fH2ZT
 c8qxih/VjvUmctdekbgktxsykVoYCAe5dMBC+lx83q8WRqAUUscZagw+VhnLyO+mb6hO
 FzSA==
X-Gm-Message-State: AOJu0YxYMNc1aiqD+mQhodhZb53cprLM4DZlfQRR1JZBAiXWkx/ft/Jy
 49skjzWqZtnc7mhyACdeGxYvRcoUK8hFi4zNARZsYGngv0a1EdF4yQwtxfx1jvI=
X-Google-Smtp-Source: AGHT+IHHf74QYC0Md/lZUqrg5qp1aVjOalfhfVqCOVusiHaSQUGwQO7s1X3Q2HcyWJpnbfAo/5iMcw==
X-Received: by 2002:adf:f4ce:0:b0:354:e021:51d5 with SMTP id
 ffacd0b85a97d-355245df173mr13784379f8f.13.1716978498315; 
 Wed, 29 May 2024 03:28:18 -0700 (PDT)
Received: from meli-email.org (adsl-49.37.6.163.tellas.gr. [37.6.163.49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3587724c6f4sm9510473f8f.28.2024.05.29.03.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 03:28:18 -0700 (PDT)
Date: Wed, 29 May 2024 13:12:39 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Will Gyda <vilhelmgyda@gmail.com>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 Will Gyda <vilhelmgyda@gmail.com>
Bcc: 
Subject: Re: [PATCH] Issue #2294 | Machine microvm doesn't run under Xen accel
 for x86_64
User-Agent: meli 0.8.5
References: <20240528102339.106257-1-vilhelmgyda@gmail.com>
In-Reply-To: <20240528102339.106257-1-vilhelmgyda@gmail.com>
Message-ID: <e8t34.08zb3hciwfl@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Wed, 29 May 2024 10:28:22 -0000

On Tue, 28 May 2024 13:23, Will Gyda <vilhelmgyda@gmail.com> wrote:
>Issue #2294: Machine microvm doesn't run under Xen accel for qemu-system-x86_64. 
>Solution: microvm is now not build if only Xen is available.
>
>Signed-off-by: Will Gyda <vilhelmgyda@gmail.com>
>


I suggest rewording the commit title to something like

"i386: remove microvm from default build"

And adding a commit message that explains that the microvm does not work 
on Xen, hence if only Xen is available it should not be built.

Also, you can add a

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2294

line before your Signed-off-by. See 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html

But, seeing the issue itself, it's about the microvm being stuck under 
Xen. So the commit that resolves this would either make it non-stuck or 
make it impossible to start the vm to begin with.


>---
> configs/devices/i386-softmmu/default.mak | 2 +-
> hw/i386/Kconfig                          | 2 ++
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/configs/devices/i386-softmmu/default.mak b/configs/devices/i386-softmmu/default.mak
>index 598c6646df..6a73aee7dd 100644
>--- a/configs/devices/i386-softmmu/default.mak
>+++ b/configs/devices/i386-softmmu/default.mak
>@@ -29,4 +29,4 @@
> CONFIG_ISAPC=y
> CONFIG_I440FX=y
> CONFIG_Q35=y
>-CONFIG_MICROVM=y
>+#CONFIG_MICROVM=n

Better remove this altogether since it's not a default anymore.

>diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>index a6ee052f9a..f8ec8ebd7a 100644
>--- a/hw/i386/Kconfig
>+++ b/hw/i386/Kconfig
>@@ -108,6 +108,8 @@ config Q35
> 
> config MICROVM
>     bool
>+    default y
>+    depends on KVM || WHPX || NVMM || HVF

What about TCG? Will it be available if we only build with tcg?

>     select SERIAL_ISA # for serial_hds_isa_init()
>     select ISA_BUS
>     select APIC
>-- 
>2.25.1
>
>

