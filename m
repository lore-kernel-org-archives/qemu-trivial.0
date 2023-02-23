Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVEo9-0004LG-6l
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2023 11:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pVEo2-00046u-AD
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 11:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pVEnm-0005jM-0p
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 11:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677171035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/2gWH/S72gDdN2u5PaLZkKIqmYndnLVCKBPjVK/9h2U=;
 b=IngEZu4he6Y+ZZdcyORRWg5CWwLTtov1SQsNS+ku2DnoZd/FhPj90+UtfMA9UBcaehg+Mw
 IitD9J1wqB01EiPKzy/SMh6pUaZ+3PyUW75okf3O/WLfoDP4CFw2PyhY48sdOE8BLpDgcZ
 ebVO7G/8f9kv+7dCLuS6svupOloCjJ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-hPD8-RQTOW-uiLuuiKGtmw-1; Thu, 23 Feb 2023 11:50:34 -0500
X-MC-Unique: hPD8-RQTOW-uiLuuiKGtmw-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so5377120wma.7
 for <qemu-trivial@nongnu.org>; Thu, 23 Feb 2023 08:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2gWH/S72gDdN2u5PaLZkKIqmYndnLVCKBPjVK/9h2U=;
 b=O1dQQpPl4/9Q2JTY1sqvPIIFnBcgevg80wd1Koko86zjEThEEz1Xzl4O/sBaQAWhkn
 QPDr0RYGguzi/shj+x5CtDmpwvGDjQNKpo3bw3l+OjDrJ6wdbfzexwNLqUIb+9heetiG
 DhH0HCkSPQfzA51fF3S3tuhvSEF6UyDI6uebSkk7H1X7KD4WPrTaG3hY278Sj/Gro5x4
 FiGXxX4D3+3guixK9LK173qECq/9zFqKF6+Kd6hYMLhvAcywgxHQM3KleArYsj8+19z0
 Rdnc3wteF7/OaA21EWmBbDF8Ji6soXTjA7fKIDkPahxsfpZVr4ipZA0snyC8IVl3Rjt5
 ZjMA==
X-Gm-Message-State: AO0yUKXdoN/yreUdOd6zXwCqE5NDeD7sREwIl1xZJ0EoEaU4Bog/InHU
 Sk7SGoiRtX4ql1Q4RJFDF/TeDV6diE+rOCAyeAw5ELNvjJa4j6M0Vcud7GDJgkWwjapHOVqxhtp
 2LFHTzfaOVbK7o6+tvA==
X-Received: by 2002:adf:f34f:0:b0:2c7:fcc:2501 with SMTP id
 e15-20020adff34f000000b002c70fcc2501mr2714009wrp.28.1677171033185; 
 Thu, 23 Feb 2023 08:50:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/2LXqumxbhzHznFAVZe6/GQJsc2TZtuNDmnndggqRzy29OKkcbNqlezMUfsP64iZfvezG8Jg==
X-Received: by 2002:adf:f34f:0:b0:2c7:fcc:2501 with SMTP id
 e15-20020adff34f000000b002c70fcc2501mr2713995wrp.28.1677171032871; 
 Thu, 23 Feb 2023 08:50:32 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm11563735wmn.14.2023.02.23.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:50:32 -0800 (PST)
Date: Thu, 23 Feb 2023 16:50:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Huanyu ZHAI <huanyu.zhai@outlook.com>, pbonzini@redhat.com,
 mtosatti@redhat.com
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] cpu/i386: update xsave components after CPUID filtering
Message-ID: <Y/eZVh9Xvmolx4Wh@work-vm>
References: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Feb 2023 16:50:58 -0000


* Huanyu ZHAI (huanyu.zhai@outlook.com) wrote:
> Subject: [PATCH] cpu/i386: update xsave components after CPUID filtering
> 
> On i386 platform, CPUID data are setup through three consecutive steps: CPU model definition, expansion and filtering.
> XSAVE components are enabled during the expansion stage, by checking if they are enabled in CPUID. However, it is still
> probable that some XSAVE features will be enabled/disabled during the filtering stage and the XSAVE components left unchanged.
> Inconsistency between XSAVE features and enabled XSAVE components can lead to problems on some Linux guests in the absence of
> the following patch in the kernel:
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1452368.html
> 
> A simple case to reproduce this problem is to start a SUSE 12 SP3 guest with cpu model set to Skylake-Server:
> $ qemu-system-x86_64 -cpu Skylake-Server ...
> 
> In the SUSE 12 SP3 guest, one can observe that PKRU will be enabled without Intel PKU's presence.
> That's because on platform with Skylake-Server cpus, Intel PKU is disabled during x86_cpu_filter_features(),
> but the XSAVE PKRU bit was enabled by x86_cpu_expand_features().

I just spotted this when trying to clear out my mail folder;
this isn't a 'trivial'!

I'm not sure if it's right or not, but I've cc'd in Paolo and Marcelo as
x86 maintainers.

Dave

> Signed-off-by: Huanyu ZHAI zhaihuanyu@huawei.com<mailto:zhaihuanyu@huawei.com>
> Signed-off-by: Xin Wang wangxinxin.wang@huawei.com<mailto:wangxinxin.wang@huawei.com>
> ---
> target/i386/cpu.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 22b681ca37..2ee574cf05 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6362,6 +6362,9 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>              mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
>          }
>      }
> +
> +    /* Update XSAVE components again based on the filtered CPU feature flags */
> +    x86_cpu_enable_xsave_components(cpu);
> }
> 
> static void x86_cpu_hyperv_realize(X86CPU *cpu)
> --
> 2.27.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


