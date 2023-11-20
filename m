Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r56En-0001Lv-67
	for mharc-qemu-trivial@gnu.org; Mon, 20 Nov 2023 10:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r56Eh-0001JP-CE
 for qemu-trivial@nongnu.org; Mon, 20 Nov 2023 10:30:56 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r56Ee-0000sj-FV
 for qemu-trivial@nongnu.org; Mon, 20 Nov 2023 10:30:54 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50a938dda08so6364878e87.3
 for <qemu-trivial@nongnu.org>; Mon, 20 Nov 2023 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700494224; x=1701099024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nIMbg0XVBLHMnhj8zz3grmVEBjX3OWKcS/qB/Dct9ZY=;
 b=J32Su2+uXIf91BqbG40curMJT3t/+e/2B2obvCzPtcg0/v6m51We3y96F5YbqlVjA1
 WJtm4UcmtGDm6lC8VWK1C+Y8+dMoP2rwGChaLmbpku8fDe+zKEyVFSVA+ppZC160zdbe
 GRg0VnAWHQJaABMtuQ5Whz8kVVRGMPjS5l7RdufLIW6EL8OtWsX+l7yyvYCRS2WKmn6p
 qTxkHx5wym+B4gTj0+fSxWPf9gQ0ToOfHBvlzwsicBOuQf0qSJ1PqQV7m+l4pfKnvob9
 p1w4HOba4/BNvqRhYI/CDofJBllm0RfNWdjB/fXWOb77n4noZ+lGVwJMny04LTfhaTkz
 GNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700494224; x=1701099024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nIMbg0XVBLHMnhj8zz3grmVEBjX3OWKcS/qB/Dct9ZY=;
 b=t8UsyCdHG+jyB0K416T314fyWDjoKD2QDeXznwinRZS4QieSkCqknAI02X65HLF8z8
 XzIGDhcQQAtRUyl42K8VsqjuDTVeNQqjI5PIHB5tSp4mGz/Hnd53yKoQ9pEGYvnEj+ru
 J0qOoJKu66UDYkfMXAlo4NaYOYxXjWDTz8f27aFdUBzYfeSCD4KXoz9LFAu/ySfzAWxq
 ty9PL+1p6336Ce/xeHi8JapEXl8+yp9MTZAXCujfKf5fzVzcbdz3eoxO7ddHwhHrEsRf
 1nlhOhnj8pwXBf/v3TbdaY5o7BAhJleOPhroiiVp9iiI32gZAHqwkdgV654M+zZnMMDG
 TayA==
X-Gm-Message-State: AOJu0YyJL/9k+YkJyHRuCbp/wCvzh6oe68ZzrXIh6MZ/Ex7G8h01KhdP
 F29+r4ZfRYoOMdCy10xGWIdTYg==
X-Google-Smtp-Source: AGHT+IEynmYQqMPuHO5sdxbAjhRTLUuf0bKcfkiOw8k/Hc5j2LMbOL1qQKnqhw71P/YpHJqmaGkr1A==
X-Received: by 2002:ac2:4552:0:b0:50a:a242:b614 with SMTP id
 j18-20020ac24552000000b0050aa242b614mr4866945lfm.2.1700494224484; 
 Mon, 20 Nov 2023 07:30:24 -0800 (PST)
Received: from [192.168.174.227] ([91.223.100.4])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a197509000000b0050a5460e19fsm1203042lfe.119.2023.11.20.07.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 07:30:24 -0800 (PST)
Message-ID: <54c7991d-7ba0-4d05-8653-b7218a3cb909@linaro.org>
Date: Mon, 20 Nov 2023 07:30:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/i386: fix short-circuit logic with non-optimizing
 builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dan Hoffman <dhoff749@gmail.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20231119203116.3027230-1-dhoff749@gmail.com>
 <3c44d5a5-818b-46b6-a07f-af655a060032@linaro.org>
 <CAFXChKJrXAop188pTFcU0YNPocn_KyiAXiqWoES2F0_==VyO+Q@mail.gmail.com>
 <20231120042116-mutt-send-email-mst@kernel.org>
 <9282a606-794a-432c-8b56-fedf6af67768@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9282a606-794a-432c-8b56-fedf6af67768@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Nov 2023 15:30:57 -0000

On 11/20/23 02:20, Philippe Mathieu-Daudé wrote:
> (Cc'ing Eric)
> 
> On 20/11/23 10:28, Michael S. Tsirkin wrote:
>> On Sun, Nov 19, 2023 at 07:34:58PM -0600, Dan Hoffman wrote:
>>> As far as I can tell, yes. Any optimization level above O0 does not have this
>>> issue (on this version of Clang, at least)
>>
>> Aha, this is with -O0. That makes sense.
> 
> But then, why the other cases aren't problematic?
> 
> $ git grep -E ' (&&|\|\|) !?kvm_enabled'
> hw/arm/boot.c:1228:    assert(!(info->secure_board_setup && kvm_enabled()));
> hw/i386/microvm.c:270:        (mms->rtc == ON_OFF_AUTO_AUTO && !kvm_enabled())) {
> hw/i386/x86.c:135:    if (x86ms->apic_id_limit > 255 && kvm_enabled() &&
> hw/mips/cps.c:62:    return is_mt && !kvm_enabled();
> system/physmem.c:760:    assert(asidx == 0 || !kvm_enabled());
> target/arm/cpu64.c:288:    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
> target/i386/cpu.c:7264:    if (requested_lbr_fmt && kvm_enabled()) {
> target/ppc/kvm.c:345:    if (!cpu->hash64_opts || !kvm_enabled()) {
> target/s390x/cpu_models.c:574:    if (xcc->kvm_required && !kvm_enabled()) {
> target/s390x/cpu_models_sysemu.c:124:    if (S390_CPU_CLASS(oc)->kvm_required && 
> !kvm_enabled()) {
> 

Because those are very simple tests that do not reference kvm-specific stuff, unlike...

>>>      > -    if (x86ms->apic_id_limit > 255 && kvm_enabled() &&
>>>      > +    if (kvm_enabled() && x86ms->apic_id_limit > 255 &&
>>>      >           (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {

... these function calls.


r~

