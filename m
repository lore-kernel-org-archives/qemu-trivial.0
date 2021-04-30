Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNt2-0000jv-13
	for mharc-qemu-trivial@gnu.org; Fri, 30 Apr 2021 03:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNsz-0000jW-W4
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 03:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNsy-0004Z9-Gp
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 03:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619768907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG4OGcm0twqy73p2BJYX5RQhPNBs0cL3JDKxw/IFTDo=;
 b=PYoCQgtbrkR8YawvBxDU+atmFghyvIQS35HsGgJ9Xoz0Px13ZmoARzdrubEf3V0gycPFAV
 ivncQXR21RsdUJArIieqFXF6LZ7UHPHCGY2gci/ZfSbDsb7LJqjjfS6IrssqIgbxA23ugT
 RE08d31DJwweK2sAzcVwO2iqKp+eoHE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-VzkWv9uZPpGO4HxaBIzJnA-1; Fri, 30 Apr 2021 03:48:25 -0400
X-MC-Unique: VzkWv9uZPpGO4HxaBIzJnA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so7724980edr.0
 for <qemu-trivial@nongnu.org>; Fri, 30 Apr 2021 00:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GG4OGcm0twqy73p2BJYX5RQhPNBs0cL3JDKxw/IFTDo=;
 b=nyGVNo5uNDsEgxvWYkSwsj+G1tpwPeQZXEIrgnbGyRU2RAT0ApZWubSkqp9O6HQD1q
 JwtINRZWZCJJv3QqTwmt2UZpiYAezdrz6hUYDVELCF1xSgCB7yG3hfvbQx3a7rvIWy10
 3F1tEn9ZHDqHBFmwAmykC8cFW7qqKE/A5bsgMsalqGgmyTgYeBvbv8DKooI19ikGxWFw
 Z0630vZag1UYjfdx+EMzyHi3L95SKONAZbmYziv2L0b9VJ302j40XE0jkSwiNOW+OTMz
 cW3ZG49HUNtwvlpf/2+P3WBBul8dGeca1bD+bsm0/isKy1jNAoqpGuM7k2C3yOfZ/SkV
 3RnQ==
X-Gm-Message-State: AOAM53097d6lH3ZEENhnj6uct0slxzgPUTMJfs8ggxRF0RiSq5J66f/o
 YB9cvjQ/NC8wHLikt+uvL9EZbyhCeTXp9Jsn+/Al6qrKNXZEXZ/iH5+nzm0aF1hXBuQ9SdNFZhX
 OW142cJUIX0rUptxtwhVskCbxXhSmTv6SL/Kme7yRIXIDjsImDQ8vFtm/Hz233V6R/SVnQg==
X-Received: by 2002:a17:907:3589:: with SMTP id
 ao9mr2729245ejc.171.1619768904151; 
 Fri, 30 Apr 2021 00:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUL9tnP14ObMWIc7kU6Y1r5YpQpbZRirfCLkC/tlT7PaPSm9F2B3/ZJ/IKTpuOmAMUXi/2cQ==
X-Received: by 2002:a17:907:3589:: with SMTP id
 ao9mr2729226ejc.171.1619768903961; 
 Fri, 30 Apr 2021 00:48:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm656635edw.37.2021.04.30.00.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 00:48:23 -0700 (PDT)
Subject: Re: [PATCH] meson: Set implicit_include_directories to false
To: Katsuhiro Ueno <uenobk@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2571b8c3-3e2b-f90e-6077-05232a52c711@redhat.com>
Date: Fri, 30 Apr 2021 09:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 30 Apr 2021 07:48:30 -0000

On 29/04/21 04:43, Katsuhiro Ueno wrote:
> Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
> include file name conflict (usr/include/c++/v1/version conflicts with
> VERSION).
> 
> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e..d007bff8c3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2129,6 +2129,7 @@ common_all = common_ss.apply(config_all, strict: false)
>   common_all = static_library('common',
>                               build_by_default: false,
>                               sources: common_all.sources() + genh,
> +                            implicit_include_directories: false,
>                               dependencies: common_all.dependencies(),
>                               name_suffix: 'fa')
> 

Can you include the difference in the include paths (the -I and -iquote 
arguments)?  There are many cases in which we rely on having the current 
source directory in the build path, for example all inclusions of "trace.h".

Paolo


