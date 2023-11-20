Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r51Oo-0008Ax-Fn
	for mharc-qemu-trivial@gnu.org; Mon, 20 Nov 2023 05:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r51Om-0008Af-FD
 for qemu-trivial@nongnu.org; Mon, 20 Nov 2023 05:21:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r51Oj-000765-7M
 for qemu-trivial@nongnu.org; Mon, 20 Nov 2023 05:21:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so3257256f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 20 Nov 2023 02:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700475655; x=1701080455; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pvmVT7FcqKkXzuHW0d+7hRew5FugdBaiXm8hpZXbZpg=;
 b=PnCBaiNgF4nLMN+UGKucs2rU+5wuq7YPEbeAqrBG62Rva6+kliyxtNHpxNQA+LXOic
 66pxldv4TLEJSbp8GSCW9Q00AOwW4jgH1F9Y5W/+taAVXnAoZ3Lat+yx7RbckZtRpWLs
 NOO3dFpSCniVCTA9opE0470D7Z47Oi02dP7oo+CPcgotbVAqB/6ubG8pBMlN/1Nlm0as
 ERtFXvVgZ+QY0HomQ6F8hovRSh2CW0yYTCwOp/cBOzciranzo1VwflYBYU3Uz7IWwgcW
 a/EM+2NMacKTFegNuszl5npjTWXqI+ws1dBNyO1YJhfSekemGKSlZBz0oGNNM7FRYtW7
 +hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700475655; x=1701080455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pvmVT7FcqKkXzuHW0d+7hRew5FugdBaiXm8hpZXbZpg=;
 b=vOuhQadjzGjDruyQR3/s8Rwz1b83BLm7wtdgACP1zys0KtwQc2bChG/bohhqXzFhl8
 PCOeJ4zQMqQb2kqEX9xyz2BuGnWRtnLtwtCOkZvqhx7Tsd7RltqlAosD3ZJmu/QPWpfT
 /yPG2icBaRoM/IePV0nD6xoKoncVZG9B8I5MtqGEUw4xoPwkM5qeWxyIZq6rQVGjIhYJ
 VmsnkUFQrZYDZhLjWjy6JwcpKotd4iaAnRd3ibUmHXaLMXlWcisOsmapFXxjpKF/9WjK
 gG+DPNBBdo4gQsz67M50pzI91DfFIpxjjCjfIC5NtJtgpP0LyKnfVXAuiAmYPjoQ+qUI
 /o+g==
X-Gm-Message-State: AOJu0YxBhbHJHk9hejvMzcdmDDFAY7MMeG6DjCLexhdWneCiBa1YzBlu
 fZ+N/7CuZvwIdm8GAUDpQYVbFA==
X-Google-Smtp-Source: AGHT+IHoLSdCkWu19KejIzAj9ebB1UjB1jFsSAh7Q6A3QmGzoWnqS5M8EdlRzFxSOGwTd+JW1FL8DA==
X-Received: by 2002:a05:6000:1563:b0:32c:837e:ef0 with SMTP id
 3-20020a056000156300b0032c837e0ef0mr5778467wrz.50.1700475655561; 
 Mon, 20 Nov 2023 02:20:55 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfda4c000000b003232380ffd7sm10679745wrl.102.2023.11.20.02.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 02:20:55 -0800 (PST)
Message-ID: <9282a606-794a-432c-8b56-fedf6af67768@linaro.org>
Date: Mon, 20 Nov 2023 11:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/i386: fix short-circuit logic with non-optimizing
 builds
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Dan Hoffman <dhoff749@gmail.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20231119203116.3027230-1-dhoff749@gmail.com>
 <3c44d5a5-818b-46b6-a07f-af655a060032@linaro.org>
 <CAFXChKJrXAop188pTFcU0YNPocn_KyiAXiqWoES2F0_==VyO+Q@mail.gmail.com>
 <20231120042116-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231120042116-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 20 Nov 2023 10:21:01 -0000

(Cc'ing Eric)

On 20/11/23 10:28, Michael S. Tsirkin wrote:
> On Sun, Nov 19, 2023 at 07:34:58PM -0600, Dan Hoffman wrote:
>> As far as I can tell, yes. Any optimization level above O0 does not have this
>> issue (on this version of Clang, at least)
> 
> Aha, this is with -O0. That makes sense.

But then, why the other cases aren't problematic?

$ git grep -E ' (&&|\|\|) !?kvm_enabled'
hw/arm/boot.c:1228:    assert(!(info->secure_board_setup && kvm_enabled()));
hw/i386/microvm.c:270:        (mms->rtc == ON_OFF_AUTO_AUTO && 
!kvm_enabled())) {
hw/i386/x86.c:135:    if (x86ms->apic_id_limit > 255 && kvm_enabled() &&
hw/mips/cps.c:62:    return is_mt && !kvm_enabled();
system/physmem.c:760:    assert(asidx == 0 || !kvm_enabled());
target/arm/cpu64.c:288:    if (value && kvm_enabled() && 
!kvm_arm_sve_supported()) {
target/i386/cpu.c:7264:    if (requested_lbr_fmt && kvm_enabled()) {
target/ppc/kvm.c:345:    if (!cpu->hash64_opts || !kvm_enabled()) {
target/s390x/cpu_models.c:574:    if (xcc->kvm_required && !kvm_enabled()) {
target/s390x/cpu_models_sysemu.c:124:    if 
(S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {

> We have:
>    ;;
>    --enable-debug)
>        # Enable debugging options that aren't excessively noisy
>        meson_option_parse --enable-debug-tcg ""
>        meson_option_parse --enable-debug-graph-lock ""
>        meson_option_parse --enable-debug-mutex ""
>        meson_option_add -Doptimization=0
>        default_cflags='-O0 -g'
> 
> 
>> On Sun, Nov 19, 2023 at 4:54 PM Philippe Mathieu-Daudé <philmd@linaro.org>
>> wrote:
>>
>>      Hi,
>>
>>      On 19/11/23 21:31, Daniel Hoffman wrote:
>>      > `kvm_enabled()` is compiled down to `0` and short-circuit logic is
>>      > used to remove references to undefined symbols at the compile stage.
>>      > Some build configurations with some compilers don't attempt to
>>      > simplify this logic down in some cases (the pattern appears to be
>>      > that the literal false must be the first term) and this was causing
>>      > some builds to emit references to undefined symbols.
>>      >
>>      > An example of such a configuration is clang 16.0.6 with the following
>>      > configure: ./configure --enable-debug --without-default-features
>>      > --target-list=x86_64-softmmu --enable-tcg-interpreter
>>
>>      Is the '--enable-debug' option triggering this?
>>
>>      I'm surprised the order of conditions matters for code elision...
>>
>>      > Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
>>      > ---
>>      >   hw/i386/x86.c | 15 ++++++++++++---
>>      >   1 file changed, 12 insertions(+), 3 deletions(-)
>>      >
>>      > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>      > index b3d054889bb..2b6291ad8d5 100644
>>      > --- a/hw/i386/x86.c
>>      > +++ b/hw/i386/x86.c
>>      > @@ -131,8 +131,12 @@ void x86_cpus_init(X86MachineState *x86ms, int
>>      default_cpu_version)
>>      >       /*
>>      >        * Can we support APIC ID 255 or higher?  With KVM, that requires
>>      >        * both in-kernel lapic and X2APIC userspace API.
>>      > +     *
>>      > +     * kvm_enabled() must go first to ensure that kvm_* references are
>>      > +     * not emitted for the linker to consume (kvm_enabled() is
>>      > +     * a literal `0` in configurations where kvm_* aren't defined)
>>      >        */
>>      > -    if (x86ms->apic_id_limit > 255 && kvm_enabled() &&
>>      > +    if (kvm_enabled() && x86ms->apic_id_limit > 255 &&
>>      >           (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
>>      >           error_report("current -smp configuration requires kernel "
>>      >                        "irqchip and X2APIC API support.");
>>      > @@ -418,8 +422,13 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>>      >       }
>>      >       cpu->thread_id = topo_ids.smt_id;
>>      >
>>      > -    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
>>      > -        kvm_enabled() && !kvm_hv_vpindex_settable()) {
>>      > +    /*
>>      > +    * kvm_enabled() must go first to ensure that kvm_* references are
>>      > +    * not emitted for the linker to consume (kvm_enabled() is
>>      > +    * a literal `0` in configurations where kvm_* aren't defined)
>>      > +    */
>>      > +    if (kvm_enabled() && hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &
>>      &
>>      > +        !kvm_hv_vpindex_settable()) {
>>      >           error_setg(errp, "kernel doesn't allow setting HyperV
>>      VP_INDEX");
>>      >           return;
>>      >       }
>>
>>
> 


