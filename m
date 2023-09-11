Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qfipN-0005ir-NZ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2023 11:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfipM-0005iT-I9
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:27:52 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfipI-0000Td-F9
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:27:52 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50098cc8967so7316557e87.1
 for <qemu-trivial@nongnu.org>; Mon, 11 Sep 2023 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694446065; x=1695050865; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9+2YE007+wC2u0xxh7DJ73XyeWm14R9tv5OegqhxoYs=;
 b=a9DDsDfrGJo8fkhX2qZ6j52U5Meaqf0e5hld6+a77mcK2ecBFFXYpOjHfyEGfofqn6
 RHOacVqvmxfbf+bwi0BBrXjtV51Nj1S/H2ZD7QXs1EhAVmd+nOrEreWeotH915/7TbXF
 ol909qHn0O7RKtibozmps9cywJgBPpWpTMgw5lQzGkyrrYi8bi54ko95IQWHqtWt43Ya
 zan8x7gmwwj1pV6IWXrIyTcKBaAg/rrF4BhtMoFONSpVrNNNfwG6YjEXVO4cUNyIyCnh
 P7lcYlzk1C9wxJX1+9LKwD2pqgUfkJZS2emuMXtguwzxhNzCi/d25isAByOqLkyUndCw
 nM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694446065; x=1695050865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+2YE007+wC2u0xxh7DJ73XyeWm14R9tv5OegqhxoYs=;
 b=h0yr2uyp8hHm94TtgHGVQkOZ5CFO73tqCVUcImNdk5PZP+iYO2IUmAVTD/6XkSJA5E
 o70rjlfeBu50w/HbM4LH8tXenXvIxCF69SIxWLDfHEQY4db2GOFLJi8TMHhM5kxpbyGE
 zYc4XrlzKRgLyT6dtfIR1FTUSv2tEYHDH4HlTR/P2KfDPPVGfaP3SJ32E8jpW6ZG6MTy
 BO9m6dSM1bSiQ00s06V0kuisubV4Gujd3YR1W8ytmThO1XvDX1mvUFqrvpTNTe2TFh4u
 eO0OZuDCawiDuadUfmXM/A5SyVsBgV7O8yI9Sc6pGSu4c7gxBuVkQhYsnsfoBcnNrOBP
 zxpQ==
X-Gm-Message-State: AOJu0Yw58I28FGLdP7hfn7f45yTff8Nsqw7qELW4f9Hgv934lx1zafbl
 2wiscIxyhTVJP2mJBsTZ4sCI0zVMzw9CjFJvX1igDSzZdx+0XdHK
X-Google-Smtp-Source: AGHT+IFSjc3rF756Md1buY33VNwgL+BIutt2Jo/N0PPJrNIQSwCfzhA88IZJAsMzbhKuP5i6HapSIItCwtdbnJvsCR4=
X-Received: by 2002:a19:381c:0:b0:500:b3f2:73e2 with SMTP id
 f28-20020a19381c000000b00500b3f273e2mr7207546lfa.50.1694446065226; Mon, 11
 Sep 2023 08:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-3-mjt@tls.msk.ru>
In-Reply-To: <20230909131258.354675-3-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2023 16:27:34 +0100
Message-ID: <CAFEAcA9P-=rh1yj=i_s86Efj+3r1K3OJJ5BR24zio8KHRMarPQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] i386: spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Sep 2023 15:27:52 -0000

On Sat, 9 Sept 2023 at 14:17, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  host/include/i386/host/cpuinfo.h | 2 +-
>  hw/i386/acpi-build.c             | 4 ++--
>  hw/i386/amd_iommu.c              | 4 ++--
>  hw/i386/intel_iommu.c            | 4 ++--
>  hw/i386/kvm/xen_xenstore.c       | 2 +-
>  hw/i386/kvm/xenstore_impl.c      | 2 +-
>  hw/i386/pc.c                     | 4 ++--
>  include/hw/i386/topology.h       | 2 +-
>  target/i386/cpu.c                | 4 ++--
>  target/i386/cpu.h                | 4 ++--
>  target/i386/kvm/kvm.c            | 4 ++--
>  target/i386/kvm/xen-emu.c        | 2 +-
>  target/i386/machine.c            | 4 ++--
>  target/i386/tcg/translate.c      | 8 ++++----
>  tests/tcg/i386/system/boot.S     | 2 +-
>  tests/tcg/i386/x86.csv           | 2 +-
>  16 files changed, 27 insertions(+), 27 deletions(-)

> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index bb12b0ad43..1afcef5937 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -779,7 +779,7 @@ static Aml *initialize_route(Aml *route, const char *link_name,
>   *
>   * Returns an array of 128 routes, one for each device,
>   * based on device location.
> - * The main goal is to equaly distribute the interrupts
> + * The main goal is to equally distribute the interrupts
>   * over the 4 existing ACPI links (works only for i440fx).
>   * The hash function is  (slot + pin) & 3 -> "LNK[D|A|B|C]".
>   *
> @@ -2079,7 +2079,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>  }
>
>  /*
> - * Insert DMAR scope for PCI bridges and endpoint devcie
> + * Insert DMAR scope for PCI bridges and endpoint device

I suspect this should be "devices" plural.

>   */
>  static void
>  insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)

>  static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
>                             unsigned size)
>  {

> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4729,7 +4729,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
>      /*
>       * Put MSR_IA32_FEATURE_CONTROL first, this ensures the VM gets out of VMX
>       * root operation upon vCPU reset. kvm_put_msr_feature_control() should also
> -     * preceed kvm_put_nested_state() when 'real' nested state is set.
> +     * proceed kvm_put_nested_state() when 'real' nested state is set.

Should be "precede".

>       */
>      if (level >= KVM_PUT_RESET_STATE) {
>          ret = kvm_put_msr_feature_control(x86_cpu);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

