Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pesL3-0003uf-Vg
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2023 02:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesL1-0003u2-6g
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 02:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesKx-0005K3-KP
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 02:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679467963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlOVum3zlrby9qgk981B76YKheswNkAcgjOj8q+L4tA=;
 b=MUPF+STOEzwfCC45xYM5XaEszhqlWMkzjwG2fi4cvW4byyuJGmQgJVk4QGJSaIfjjLSa/J
 Tdo1hP8iE2aCWAKtgkyesXy/xB+/WWZK3FsOxaEZheSq77emX+81uKMZM1JiG8hRK3WpCF
 m87C66uGwJDeK9mtYAkIxaVK/8HHsro=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-5xnnmsZiNdSwmtSj1o8HWg-1; Wed, 22 Mar 2023 02:52:41 -0400
X-MC-Unique: 5xnnmsZiNdSwmtSj1o8HWg-1
Received: by mail-qv1-f70.google.com with SMTP id
 pr2-20020a056214140200b005b3ed9328a3so8867216qvb.10
 for <qemu-trivial@nongnu.org>; Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679467961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HlOVum3zlrby9qgk981B76YKheswNkAcgjOj8q+L4tA=;
 b=JlKtQguUCAED8IgYJJfvHK3e6uT2liPLaJK71MpA5lLZtSuEny+KGy6DEabS6Xp4Nu
 pYt6dv7dPBlDgZC/8cZDKzLJHn2yXPYK+MrW4n7idkdpE3phFrEuZEdCQDj10n3V7XUl
 Xp0wKqSvbwNJKajEz4bWODv0LH2CHqXVJSuH9iNM0KzIz5G7PTsvlfyHXGIh1NEvqJ9/
 1Gxe4jVlmwc49NZgVgLW5RcahTUN1OA2LOCn3wxY8uOdOozwyclT/Em9wqxK6ldABRWE
 3DEAQLyJaN1NlHr4AaQV6w8qU1Ou4KgRdPxYf1Ins8F3MMnKOhUN6T9+iu/oiMB7nsV7
 pmbg==
X-Gm-Message-State: AO0yUKWKQ4uBcDiOSr7DhBHlvADBCvHGZilWtdyc+xOtoEi8Whf4ux8N
 sUo4+MdbqlZ9xnDRTM7O8Y0eGIdIHHvCPswPVuc6e1WwkBKm3m0Fe/FK3aff/FlxAitMHRL4IXJ
 ZJdv7aeHNun1PGyDAdQ==
X-Received: by 2002:ac8:588c:0:b0:3bf:cff2:2c2f with SMTP id
 t12-20020ac8588c000000b003bfcff22c2fmr4037710qta.44.1679467961362; 
 Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/guqhh3luA+mWyl0HAmbo18fmHg21YevV0Ldnzp2FMDAxvb7d8qkkS5T0CF0HOwi2aA6nZg==
X-Received: by 2002:ac8:588c:0:b0:3bf:cff2:2c2f with SMTP id
 t12-20020ac8588c000000b003bfcff22c2fmr4037701qta.44.1679467961140; 
 Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 t21-20020ac87615000000b003e0945575dasm5599388qtq.1.2023.03.21.23.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 23:52:40 -0700 (PDT)
Message-ID: <e549a0d6-77f2-6b1a-3dc4-46df1b8c9b42@redhat.com>
Date: Wed, 22 Mar 2023 07:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0 v2 2/3] target/s390x: Fix float_comp_to_cc()
 prototype
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-3-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230321161609.716474-3-clg@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Mar 2023 06:52:48 -0000

On 21/03/2023 17.16, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]
> 
>    123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
>        |     ^~~~~~~~~~~~~~~~
> In file included from ../target/s390x/tcg/fpu_helper.c:23:
> ../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
>    302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
>        |     ^~~~~~~~~~~~~~~~
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/s390x-internal.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
> index 5d4361d35b..825252d728 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -11,6 +11,7 @@
>   #define S390X_INTERNAL_H
>   
>   #include "cpu.h"
> +#include "fpu/softfloat.h"
>   
>   #ifndef CONFIG_USER_ONLY
>   typedef struct LowCore {
> @@ -299,7 +300,7 @@ uint32_t set_cc_nz_f128(float128 v);
>   uint8_t s390_softfloat_exc_to_ieee(unsigned int exc);
>   int s390_swap_bfp_rounding_mode(CPUS390XState *env, int m3);
>   void s390_restore_bfp_rounding_mode(CPUS390XState *env, int old_mode);
> -int float_comp_to_cc(CPUS390XState *env, int float_compare);
> +int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare);
>   
>   #define DCMASK_ZERO             0x0c00
>   #define DCMASK_NORMAL           0x0300

Better to respond to v2:
Reviewed-by: Thomas Huth <thuth@redhat.com>


