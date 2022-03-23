Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWxYH-0005nL-SA
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2022 05:45:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWxYF-0005ms-N3
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWxYC-0004FC-Gu
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648028707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrJ9oeCNRuxFKyNn9QDK1yMz/t6w80PhHfKRVW/DJ4U=;
 b=BzTuFdEzmCtYt7OEuzWAnGcG51r39lf3jLsVQoLcs0XpdrrsdF2FWubewmFGNVxj2s5NZ3
 Su2rbtU+kj2/0l8tq3HT43OdGLJpKLPjMq5LwFvTl+4SxfXJE8hsyW/jRLEapbK+2tDDOU
 Cn81YhPXJg0RwpiENBTfmtxK6RsLHCQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-Ygb6DB_pPqC9NpyFKpI8NA-1; Wed, 23 Mar 2022 05:45:04 -0400
X-MC-Unique: Ygb6DB_pPqC9NpyFKpI8NA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h33-20020adf9024000000b00203fcba8aadso314174wrh.15
 for <qemu-trivial@nongnu.org>; Wed, 23 Mar 2022 02:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=qrJ9oeCNRuxFKyNn9QDK1yMz/t6w80PhHfKRVW/DJ4U=;
 b=P2PVcAevtbgZkxoeRRZlN1YItdQCARPgvkOaE34/RbBNCnVENZt2ML2Y69CAv4Aikc
 byjRMKgKmbu+hDaO49+pY5lXOFS5t5K4SFNO38W5b/e+xcA/UpvzP1ZONJiE6P9iIatK
 1N4ciQCxe6mdnMReud6YMRElr7Y0iFq665xbFqe85VcAGTLoQSQ8RoMYQrpiyJYTJIrQ
 lbnMU9FtbBBmj9T30U4egVG+tdcxo7GpSbf53T2lfwzNWZDCBkUH79gVHvyJ+SQ8toBM
 zxHGh5niZXWWxqgFDsXOazULLDlOX+nsHF774BaU97i5baVlgw32iDuifLsm9B1UOyAk
 Y8UQ==
X-Gm-Message-State: AOAM530iBLxykSKpVt0TCxXrX62c5d4YktlLSbS/am+D14kqTQ23jHQ5
 qzDkW6DiDrrHzBLAWJpNO+ZHaiUes7JcSuSPxi4gkUZJ5iZ3GYedbDJGNGAAY6W3biK0Q+6Yrs2
 GZgtfNUcEXAsbebHyFw==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr25848780wrp.299.1648028703402; 
 Wed, 23 Mar 2022 02:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyunWhmG6C2kdxHaAwn/jKR3L1yqgVFxLDKT0vQuBfZRMRbgIbGt61X2ZxkaIXDLGUF9y562g==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr25848760wrp.299.1648028703107; 
 Wed, 23 Mar 2022 02:45:03 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm3710839wmq.40.2022.03.23.02.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 02:45:02 -0700 (PDT)
Message-ID: <649c2c79-9d64-f44b-f801-492f47606794@redhat.com>
Date: Wed, 23 Mar 2022 10:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] build: disable fcf-protection on -march=486 -m16
To: christian.ehrhardt@canonical.com, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 23 Mar 2022 09:45:12 -0000

On 23/03/2022 10.07, christian.ehrhardt@canonical.com wrote:
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> 
> Some of the roms build with -march=i486 -m16 which is incompatible
> with -fcf-protection. That in turn is can be set by default, for
> example in Ubuntu [1].
> That causes:
>   cc1: error: ‘-fcf-protection’ is not compatible with this target
> 
> This won't work on -march=i486 -m16 and no matter if set or not we can
> override it to "none" if the option is known to the compiler to be
> able to build reliably.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889
> 
> [1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection
> 
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> ---
>   pc-bios/optionrom/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 5d55d25acc..f1ef898073 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -14,6 +14,10 @@ cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
>   
>   override CFLAGS += -march=i486 -Wall
>   
> +# If -fcf-protection is enabled in flags or compiler defaults that will
> +# conflict with -march=i486
> +override CFLAGS += $(call cc-option, -fcf-protection=none)
> +
>   # Flags for dependency generation
>   override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


