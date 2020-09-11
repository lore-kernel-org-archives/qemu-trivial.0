Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGjLC-0001Ui-RX
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 09:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGjLA-0001QS-PT
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 09:43:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42328
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGjL9-0003DA-5K
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 09:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599831826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPRQEAguP9ZNLQqmtIG+Dfw3EoY53yGQQwlV0FI12Io=;
 b=H/D/xOqPoKQh0wMsSL5aDFMTN7stgQy9wplZd8XvQhaipgf7NZwASpGWhwV2mTcbzkI7xx
 kHq2vhNrbddChGTADJXovXSbM0pa0AtIqFM4iwEU0QH9KyD6l4QTu+BE8OF7rSX3OYTGF/
 0XZHbNBi3YkAsP2G3RKBD2zjmvqFvyw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ifGzBcsRMFy_MVLGSYzw7A-1; Fri, 11 Sep 2020 09:43:44 -0400
X-MC-Unique: ifGzBcsRMFy_MVLGSYzw7A-1
Received: by mail-ed1-f72.google.com with SMTP id l2so4345081ede.19
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 06:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPRQEAguP9ZNLQqmtIG+Dfw3EoY53yGQQwlV0FI12Io=;
 b=NAHTUZ96qQeQt1Ui2D2Wy00BHmcdRbpAIxE354qKcnMylTIjZAp/zhCOnFHV6Krq1P
 UqlINeKmaPHxXKwME+O5lyi1dVCCHkyXNHa//jJjwXyRUrh29Q0pk/eYCaW6xd0HVjei
 7TJhCZz/GAw4EWKKql/NfPWHFhFT5AXN2d5aPn9T2da9S4ebI/Cvu8E3kB1N37PWv10E
 v9jUNrKXA9UgwdKenpKV5p7qnGaGLJDcBVYX/KsetoAWM08ztXwwBnVoAUbUPCSR5b0L
 mzkhiFtXG7wWPBHg5f4LBhcsT3ZoBHsx8HKd50rl1OTbmzpx5mL4HEGdScm20/jcQ6Rt
 ACqw==
X-Gm-Message-State: AOAM531f9EL5a5RU1pamBWwYyD16glYa/awUkztmf01FdIVYcuPAJ2qb
 Vbqgr1VRuaOjxFlo1t/UTvD9ML/PHE8LnZmvb64+HK7B6qnN1FExdmdpQHaM//7yWi+WG2d88QP
 dPjoxDZOy5LxU+NwFdg==
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr2092819ejq.372.1599831823408; 
 Fri, 11 Sep 2020 06:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6IoIXDjnjWN+BJj1NB5vpXkR1M/FnTlpPoaOj2W9DHz9nFAzWBwP7+3tqYw+H1QWEoLuxeQ==
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr2092802ejq.372.1599831823192; 
 Fri, 11 Sep 2020 06:43:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5568:7f99:4893:a5b6?
 ([2001:b07:6468:f312:5568:7f99:4893:a5b6])
 by smtp.gmail.com with ESMTPSA id gh21sm1630169ejb.32.2020.09.11.06.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:43:42 -0700 (PDT)
Subject: Re: [PATCH] target/i386/kvm: Add missing fallthrough comment
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Richard Henderson
 <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org
References: <20200911125301.413081-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <db773405-e9da-e98b-8da5-d13fef8b596b@redhat.com>
Date: Fri, 11 Sep 2020 15:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200911125301.413081-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 09:43:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 11 Sep 2020 13:43:49 -0000

On 11/09/20 14:53, Thomas Huth wrote:
> Let's make this file compilable with -Werror=implicit-fallthrough :
> Looking at the code, it seems like the fallthrough is intended here,
> so we should add the corresponding "/* fallthrough */" comment here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/i386/kvm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 205b68bc0c..283d3305d5 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1568,6 +1568,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>              if (env->nr_dies < 2) {
>                  break;
>              }
> +            /* fallthrough */
>          case 4:
>          case 0xb:
>          case 0xd:
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


