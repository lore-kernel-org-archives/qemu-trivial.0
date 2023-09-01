Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qc1XE-0006vD-D0
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2023 06:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1qbyhC-0006zo-8b
 for qemu-trivial@nongnu.org; Fri, 01 Sep 2023 03:35:58 -0400
Received: from out-238.mta0.migadu.com ([2001:41d0:1004:224b::ee])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1qbyh8-0000Mk-KO
 for qemu-trivial@nongnu.org; Fri, 01 Sep 2023 03:35:57 -0400
Date: Fri, 1 Sep 2023 09:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693553749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uSTkpiBeyJOSrDyBqH5u+QE0xVO5xgn5RZNE7JKVcac=;
 b=YunA2qSYy4vcIkBJ5DQbT7RYLD/OWgVFsES3gy7S0S3TpjGK/GdAZrCZgktwl4SABbAmV4
 v8IwiGnGXpVDM/6UsvuPyoH+He74lAdYDdEYiIWvqsGO/7CEIAE9D5BfBWG1uCUjeyVAco
 dRtzNx/jHIO+Bak/lzkbHN1MJvP+T0A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Message-ID: <20230901-16232ff17690fc32a0feb5df@orel>
References: <20230831190052.129045-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::ee;
 envelope-from=andrew.jones@linux.dev; helo=out-238.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Sep 2023 06:37:47 -0400
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
X-List-Received-Date: Fri, 01 Sep 2023 07:35:58 -0000

On Thu, Aug 31, 2023 at 07:00:52PM +0000, Colton Lewis wrote:
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

The link can be shorter with

https://lore.kernel.org/all/20230823200408.1214332-1-coltonlewis@google.com/

> for additional context.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

Thanks for the testing and posting, Colton. Please add your s-o-b and a
Tested-by tag as well.

Thanks,
drew

> ---
>  target/arm/kvm64.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 4d904a1d11..2dd46e0a99 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
>   */
>  static const CPRegStateLevel non_runtime_cpregs[] = {
>      { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
>  };
>  
>  int kvm_arm_cpreg_level(uint64_t regidx)
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 

