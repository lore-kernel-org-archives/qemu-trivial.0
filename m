Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCPis-0007Oz-O6
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 07:44:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPip-0007N3-Tx
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPij-0007g1-Tt
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:44:47 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:48806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPij-0007fk-Nz; Wed, 08 Nov 2017 07:44:41 -0500
Received: by mail-qk0-x241.google.com with SMTP id a142so3095292qkb.5;
	Wed, 08 Nov 2017 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xD1xn26hFhWMadPlkO2Zf7pkQnGJilDsZsFGppSKqf0=;
	b=s4vTUyGNO3Ms+HAjR/dYfP3RQ27jJa+iLU5aDgTECNNoSsEld3s5KD8sS3ELtLQukb
	J7BwwTM3xbV6o60CVhAcxaA+Q08vvv+7jJ4H1/QSNQWYnP5kj6XzUmKTI4drshtdDxES
	CoPdCq8NpSmT8CfNQIvXxJLiz2ZBb3Rj2DbooWeUr3IIQohxyupDbtAfh4Z9xZ2QbMgk
	3x6wobziZeBy+aVX6YG7OL1ooV8Hsen3cKsl30TXz+DKdSE0xKPim+MmETCdWHDuQACD
	xOwKreRP5pj8GSzFWehBj6tpxSHkRCpYlI9VCHrsp6kd/5rDvK0Gitz7Cu3/lS37eOwr
	v/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xD1xn26hFhWMadPlkO2Zf7pkQnGJilDsZsFGppSKqf0=;
	b=UeiVhJWy09CjxeczP6w6LF2+iJ3rAzSfTXs5BFfenWfAhvDsQwpLdWJO1mGcYd7hbT
	Hzc4sHbuzgJ3u+MIeqa2aAHq6ZFVqXgcKGJ0YL9ReSZN9ueJW1GAR5mBSpEb5BVoZgqE
	U6OwgZUJLXnAavnP/gMDnYt2cv2RahNoWROyCM+Fd+0Wum59/Hn3ctc7witQlEmrB0Ai
	oiPKxyGdTLLT+A4VTUjkxl50kGTMSRIFvQDgrHZJngZkjkFty6doMJMCvFK5YA9t3+od
	/88mxqcHiJQB/OrLaiIpN7D954RMOwyvOOuK9EwHKKUFUgDzPUpG9DCy0q7cQuZvqhDI
	y3CQ==
X-Gm-Message-State: AJaThX7jB/LwDrOgcxKwUrwNOncomjdBrcho0/E2l5DtHsQkG05i2fGv
	224rG7t0T2IXR6IMCZTn7mTZhi13oF0=
X-Google-Smtp-Source: ABhQp+S9mzob81yu4fjHZC1lk3R0iyDUvhJykJu/dPeqlAyw8+0LZqrpIttHXFFsVXsDD6uYmJCkYA==
X-Received: by 10.55.222.14 with SMTP id h14mr508719qkj.181.1510145080857;
	Wed, 08 Nov 2017 04:44:40 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	m127sm268475qkc.48.2017.11.08.04.44.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:44:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Stanislav Lanci <pixo@polepetko.eu>,
	Andre Przywara <andre.przywara@amd.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	"Longpeng(Mike)" <longpeng2@huawei.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?Q?Beno=c3=aet_Canet?= <benoit@irqsave.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171103173037.17012-1-pixo@polepetko.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <111e80b1-025c-aa6c-1df8-27ded2258371@amsat.org>
Date: Wed, 8 Nov 2017 09:44:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103173037.17012-1-pixo@polepetko.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] AMD Processor Topology
 Information
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 12:44:49 -0000

Hi Stanislav,

This does not seem so trivial ;)

Cc'ing more reviewers.

On 11/03/2017 02:30 PM, Stanislav Lanci wrote:
> V2:
> Adds information about cache size and topology on leaf 0x8000001D for family 17h
> Without the added cache topology guest with SMT suffers latency problems
> 
> Add CPUID 0x8000001E for describing AMD Processor Topology Information
> Disables warning about smt for 17h family of AMD CPUs
> 
> Signed-off-by: Stanislav Lanci <pixo@polepetko.eu>
> ---
>  target/i386/cpu.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  target/i386/kvm.c | 28 +++++++++++++++--
>  2 files changed, 117 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ddc45abd70..1545e3fe31 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -113,7 +113,9 @@
>  /* L1 instruction cache: */
>  #define L1I_LINE_SIZE         64
>  #define L1I_ASSOCIATIVITY      8
> +#define L1I_ASSOC_AMD_ZEN      4
>  #define L1I_SETS              64
> +#define L1I_SETS_AMD_ZEN     256
>  #define L1I_PARTITIONS         1
>  /* Size = LINE_SIZE*ASSOCIATIVITY*SETS*PARTITIONS = 32KiB */
>  #define L1I_DESCRIPTOR CPUID_2_L1I_32KB_8WAY_64B
> @@ -125,7 +127,9 @@
>  /* Level 2 unified cache: */
>  #define L2_LINE_SIZE          64
>  #define L2_ASSOCIATIVITY      16
> +#define L2_ASSOC_AMD_ZEN       8
>  #define L2_SETS             4096
> +#define L2_SETS_AMD_ZEN     1024
>  #define L2_PARTITIONS          1
>  /* Size = LINE_SIZE*ASSOCIATIVITY*SETS*PARTITIONS = 4MiB */
>  /*FIXME: CPUID leaf 2 descriptor is inconsistent with CPUID leaf 4 */
> @@ -142,6 +146,7 @@
>  #define L3_N_LINE_SIZE         64
>  #define L3_N_ASSOCIATIVITY     16
>  #define L3_N_SETS           16384
> +#define L3_N_SETS_AMD_ZEN    4096
>  #define L3_N_PARTITIONS         1
>  #define L3_N_DESCRIPTOR CPUID_2_L3_16MB_16WAY_64B
>  #define L3_N_LINES_PER_TAG      1
> @@ -3072,6 +3077,91 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>              *edx = 0;
>          }
>          break;
> +    case 0x8000001D: /* AMD TOPOEXT cache info for ZEN */
> +        if (cpu->cache_info_passthrough) {
> +            host_cpuid(index, count, eax, ebx, ecx, edx);
> +            break;
> +        } else if ((env->cpuid_version & 0xFF00F00) == 0x800F00) {
> +            *eax = 0;
> +            switch (count) {
> +            case 0: /* L1 dcache info */
> +                *eax |= CPUID_4_TYPE_DCACHE | \
> +                        CPUID_4_LEVEL(1) | \
> +                        CPUID_4_SELF_INIT_LEVEL | \
> +                        ((cs->nr_threads - 1) << 14);
> +                *ebx = (L1D_LINE_SIZE - 1) | \
> +                       ((L1D_PARTITIONS - 1) << 12) | \
> +                       ((L1D_ASSOCIATIVITY - 1) << 22);
> +                *ecx = L1D_SETS - 1;
> +                *edx = 0;
> +                break;
> +            case 1: /* L1 icache info */
> +                *eax |= CPUID_4_TYPE_ICACHE | \
> +                        CPUID_4_LEVEL(1) | \
> +                        CPUID_4_SELF_INIT_LEVEL | \
> +                        ((cs->nr_threads - 1) << 14);
> +                *ebx = (L1I_LINE_SIZE - 1) | \
> +                       ((L1I_PARTITIONS - 1) << 12) | \
> +                       ((L1I_ASSOC_AMD_ZEN - 1) << 22);
> +                *ecx = L1I_SETS_AMD_ZEN - 1;
> +                *edx = 0;
> +                break;
> +            case 2: /* L2 cache info */
> +                *eax |= CPUID_4_TYPE_UNIFIED | \
> +                        CPUID_4_LEVEL(2) | \
> +                        CPUID_4_SELF_INIT_LEVEL | \
> +                        ((cs->nr_threads - 1) << 14);
> +                *ebx = (L2_LINE_SIZE - 1) | \
> +                       ((L2_PARTITIONS - 1) << 12) | \
> +                       ((L2_ASSOC_AMD_ZEN - 1) << 22);
> +                *ecx = L2_SETS_AMD_ZEN - 1;
> +                *edx = CPUID_4_INCLUSIVE;
> +                break;
> +            case 3: /* L3 cache info */
> +                if (!cpu->enable_l3_cache) {
> +                    *eax = 0;
> +                    *ebx = 0;
> +                    *ecx = 0;
> +                    *edx = 0;
> +                    break;
> +                }
> +                *eax |= CPUID_4_TYPE_UNIFIED | \
> +                        CPUID_4_LEVEL(3) | \
> +                        CPUID_4_SELF_INIT_LEVEL | \
> +                        ((cs->nr_cores * cs->nr_threads - 1) << 14);
> +                *ebx = (L3_N_LINE_SIZE - 1) | \
> +                       ((L3_N_PARTITIONS - 1) << 12) | \
> +                       ((L3_N_ASSOCIATIVITY - 1) << 22);
> +                *ecx = L3_N_SETS_AMD_ZEN - 1;
> +                *edx = CPUID_4_NO_INVD_SHARING;
> +                break;
> +            default: /* end of info */
> +                *eax = 0;
> +                *ebx = 0;
> +                *ecx = 0;
> +                *edx = 0;
> +                break;
> +            }
> +        } else {
> +            *eax = 0;
> +            *ebx = 0;
> +            *ecx = 0;
> +            *edx = 0;
> +        }
> +        break;
> +    case 0x8000001E: /* AMD TOPOEXT cpu topology info for ZEN */
> +        if ((env->cpuid_version & 0xFF00F00) == 0x800F00) {
> +            *eax = cpu->apic_id;
> +            *ebx = (cs->nr_threads - 1) << 8 | cpu->core_id;
> +            *ecx = cpu->socket_id;
> +            *edx = 0;
> +        } else {
> +            *eax = 0;
> +            *ebx = 0;
> +            *ecx = 0;
> +            *edx = 0;
> +        }
> +        break;
>      case 0xC0000000:
>          *eax = env->cpuid_xlevel2;
>          *ebx = 0;
> @@ -3742,7 +3832,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>       * NOTE: the following code has to follow qemu_init_vcpu(). Otherwise
>       * cs->nr_threads hasn't be populated yet and the checking is incorrect.
>       */
> -    if (!IS_INTEL_CPU(env) && cs->nr_threads > 1 && !ht_warned) {
> +    if (!IS_INTEL_CPU(env) && cs->nr_threads > 1 && !ht_warned && \
> +       (env->cpuid_version & 0xFF00F00) != 0x800F00) {
>          error_report("AMD CPU doesn't support hyperthreading. Please configure"
>                       " -smp options properly.");
>          ht_warned = true;
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 6db7783edc..d6b4e1ae74 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -869,9 +869,31 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          }
>          c = &cpuid_data.entries[cpuid_i++];
>  
> -        c->function = i;
> -        c->flags = 0;
> -        cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
> +        switch (i) {
> +        case 0x8000001d:
> +            for (j = 0; ; j++) {
> +                c->function = i;
> +                c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> +                c->index = j;
> +                cpu_x86_cpuid(env, i, j, &c->eax, &c->ebx, &c->ecx, &c->edx);
> +
> +                if (c->eax == 0) {
> +                    break;
> +                }
> +                if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
> +                    fprintf(stderr, "cpuid_data is full, no space for "
> +                            "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
> +                    abort();
> +                }
> +                c = &cpuid_data.entries[cpuid_i++];
> +            }
> +            break;
> +        default:
> +            c->function = i;
> +            c->flags = 0;
> +            cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
> +            break;
> +        }
>      }
>  
>      /* Call Centaur's CPUID instructions they are supported. */
> 

