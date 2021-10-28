Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg9b5-0006QE-Sm
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 13:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9b4-0006Iz-4D
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:53:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9ay-0002Ih-3C
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:53:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so5003177plc.2
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVEFbbebEavpAjA+40ChiTwoU3XdNKynKWf/fcSYhdU=;
 b=Gi1MCdoGTGHCyV8fS7Nt6kXoKl+i0KPlnBAOV69z1+7is6eBolbh9lxYQBK6f0vrjS
 kbsDtwmkOy/B0KDWyUBFKJgVtoYWgoNQ0Rcs/QN2r0Ammt1+GQKWok13ZZEDJJluKXVZ
 yDEHU8tU7gzmAnFisDM/0OFUW+F5hipIBQf/xt4TM//H7L78M3DirjvjihjIjPcWIgdT
 Z4wHYoRu06EZXeHe7nykWgwdA6bQ98QVWSEPZP6UOwOq7CyUBJwUQZiBkA8rtk3BhlWI
 SAucL1+WJDUA5I7JCBEbeJn499/KQJm39lyE488LVtowz2WmW7uBV+cpKzGrwO6JhT8E
 fkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVEFbbebEavpAjA+40ChiTwoU3XdNKynKWf/fcSYhdU=;
 b=Td9dN4za+ECPSIPEiWqNl5BwGN2HrN6u/PDgNHhF8dKbwbyLIMHH/xNcBp3Cb8bM24
 NqO4hvRswlRIO7JPPtdjaHFwW+iLIhbxazSNJSa2X2IoKK8vkbwzCMK2gJUiDj/lyQrI
 11gDPv/+x3t/gaHUgxA3+TZf642B7zkrLITTQpHlfeoyE2umA813MurDJsepCMI3007x
 V6DgaZ00chmzhRtMti0qDL4E0u9NjTu0BFFxSqYkaHWMi9edn869hbotQM4t/NueF4fQ
 Z6mss0SQM9N/hlz9TuagjRBHFqiks1a6N0lJradN3dDYnF4ZXAfm4ZA9+4bmAlgnZG09
 SdQQ==
X-Gm-Message-State: AOAM532mIRMKx/nOJxrQyR6ZAsdNgeYwPssjR/yoj9LdcZm2ppLuvA0F
 MU5EU4W+wqH3WVwHsvLsEAKDNg==
X-Google-Smtp-Source: ABdhPJzVYZ1usxe0AVN2PHlbU33UosNCAubzxQDhbcSqEnf8klnVRvF2aOQeCyMYkt6+lqVmwKKA4w==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr6064847pjb.100.1635443622309; 
 Thu, 28 Oct 2021 10:53:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g22sm4442303pfc.202.2021.10.28.10.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:53:41 -0700 (PDT)
Subject: Re: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <344ac222-daa9-c752-8c6a-21773efb8656@linaro.org>
Date: Thu, 28 Oct 2021 10:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
X-List-Received-Date: Thu, 28 Oct 2021 17:53:50 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
> +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> +    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);

Hmm.  What's the expected behaviour if the saved CPSR state does not match the PC state 
wrt thumb?

I'm ok if this should fail in spectacular ways, I just wanna know.

I *think* what will happen at the moment is that qemu will go into a whacky state in which 
the translator will read and interpret unaligned data.

I have a pending patch set for arm to raise unaligned exceptions for mis-aligned pc.  For 
arm32 mode, this is fine, and we'll raise the exception.  But for thumb mode, this is 
architecturally impossible, and the translator will assert.

The assert is going to be a problem.  There are a couple of options:

(1) TARGET_REG_PC wins: unset PC[0] and adjust CPSR[T] to match.

(2) CPSR_T wins: unset pc[0] if CPSR[T] is set, unchanged otherwise.  (In the Arm ARM 
psueodcode, pc[0] is hardwired to 0 in thumb mode.)

(3) Don't worry about matching PC[0] and CPSR[T], but do prevent an impossible situation 
and unset PC[0] always.  If PC[1] is set, and CPSR[T] is unset, then we'll raise unaligned 
when the cpu restarts.

And, finally, you're missing the mc_vfp_* handling.


r~

