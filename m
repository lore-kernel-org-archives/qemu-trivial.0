Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeb6N-0001dk-N2
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 09:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeb6L-0001dD-Vi
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 09:00:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeb6J-000252-HB
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 09:00:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so1920610f8f.1
 for <qemu-trivial@nongnu.org>; Fri, 08 Sep 2023 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694178042; x=1694782842; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vyqE/4f+pcS0/D+aGnrXy0k/CeoXT9vuXK8tKhXEawE=;
 b=iuqDNhSeg7Q+aP5yj11+uWaU8R6w/4BZUPjCQv7SQXgysukZmRd78wtc0a1khbGyVg
 QPP5o2a2W7wjr7HX4QAnE1Mf9DPXqkj0LuCKAJu9qyaXk5PHnQbe6Q/c+/QAKsSGJsGO
 B5fwWcMJ8gqA7CXsxZ4BkQwlb2syWxPsExPNcyOW+keCNcxGA3I0OqUBItS1rBaORruO
 YBEEpP/l8FxltAfx013BxByfkd3rlkBofK4voA//HIIC/7HtPh7Pa+KM5uNDc9SKRhja
 ERvHpMi8Dac9Yvyb3EUoV6aPSZCHa0LJL64dZqsnr8X2OVMBbqO7hzIaaYutgVcqZmwO
 zh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694178042; x=1694782842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyqE/4f+pcS0/D+aGnrXy0k/CeoXT9vuXK8tKhXEawE=;
 b=Hzn3533Gltdew+tfrq1H3d9MPRwpJdR3ffTLqt2ILmjvVL0iTt/nUh7D3uc0R7y6UV
 PzaLKccYfVf13EPSe+rcenFL7AFf8HgVjSyfRhGXJIIYfkzzsXwtOnamnj+AiGLoKfi6
 B3SuB2MklgtU9WEinRltG3jFcRuvV2lWm77mkTOmBoTGMPY/xB3LCP8n6wOy3qaHpUuS
 ZB1uOUt0jf70l8RpLJngTIO5xeD0qqeuI4KY9mEAulU/q1fSrBGvr4jGDjs0ecunFebr
 McKcoHH9IVZYJb9SxG4RBcXkxoPL5Ll8ndNQAQJrT0t6XTw435fvMa2zpQsz53Nj7ZbX
 aJuQ==
X-Gm-Message-State: AOJu0Yyvhv8cRH1nYhH1JDZpO1hYKPjjNU1JEntJmMKkaW9JyXByanBv
 lx/txX6ubSK8MKJHIk5rt8HqOH/sF77YeAw9ddQSEA==
X-Google-Smtp-Source: AGHT+IGW9nyZnH9/LAXQvfyESQ5rz0/Ne+K2IyHeGWmVYxfsDCQQt18T54SFEO3B2qNdfZRtsi6hXlRB7tzplt4nGCc=
X-Received: by 2002:a5d:4b83:0:b0:313:dee2:e052 with SMTP id
 b3-20020a5d4b83000000b00313dee2e052mr2020172wrt.26.1694178041770; Fri, 08 Sep
 2023 06:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230831190052.129045-1-coltonlewis@google.com>
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:00:30 +0100
Message-ID: <CAFEAcA9x9OwCEd5s+q-Sk6mY2LcdmVv=9bCMtF_Ah7d5BmvMUg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
To: Colton Lewis <coltonlewis@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Fri, 08 Sep 2023 13:00:46 -0000

On Thu, 31 Aug 2023 at 20:01, Colton Lewis <coltonlewis@google.com> wrote:
>
> Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> in unintended trap and emulate access and a consequent performance
> hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> access.
>
> Quoting Andrew Jones:
>
> Simply reading the CNT register and writing back the same value is
> enough to set an offset, since the timer will have certainly moved
> past whatever value was read by the time it's written.  QEMU
> frequently saves and restores all registers in the get-reg-list array,
> unless they've been explicitly filtered out (with Linux commit
> 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> restore trapless ptimer accesses, we need a QEMU patch to filter out
> the register.
>
> See
> https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
> for additional context.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---



Applied to target-arm.next, thanks.

-- PMM

