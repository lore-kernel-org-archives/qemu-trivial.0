Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nludC-0006ET-QW
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2022 11:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nludC-00068P-4g
 for qemu-trivial@nongnu.org; Tue, 03 May 2022 11:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlud6-0006Hv-33
 for qemu-trivial@nongnu.org; Tue, 03 May 2022 11:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651592397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=redIlLxwCOrB5/dphju8QCaOaA1Ld+FEdrIsR5+spV4=;
 b=F9QGL7G9ppjJTtVaEqWq+yjRbw+9mm5FCqJPofmV9nnTIrHelcWfV8jJP/+ibitlHgfIDe
 7gqcXrwavNy8Z2+pMzverRgeWKznLjVNTRu4yPDpaXbEF6+BFR8/u3L+aPNSb/bEgLGVxm
 nJnvxXjNUZnSuAcrgxXPhwTHc1MnT7s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-s6C6iEKSOF2BNxDKlhQeuA-1; Tue, 03 May 2022 11:39:50 -0400
X-MC-Unique: s6C6iEKSOF2BNxDKlhQeuA-1
Received: by mail-wr1-f71.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso1469474wro.23
 for <qemu-trivial@nongnu.org>; Tue, 03 May 2022 08:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=redIlLxwCOrB5/dphju8QCaOaA1Ld+FEdrIsR5+spV4=;
 b=CaAiCG38hmpz1t5jhpnEj7KqfXZg565KoS91lzRZ4YZsJNsmLkQ9Ix3fTOV495hqhk
 udN5HejR7fo8/4vneH7kt/nWTVhSS6fJTLsbuxDBI24xgfvvUW4Qwgx8CvcwSF4N/bqU
 erqrK5UZjmWq03uSCMdcSx1H1UmqmmlzqmdXUeyX4f1LJTbpci7Ngr7hKpkaDOK/JHtt
 /qgxqFJmZk1nZjz08LAGpdhHEkLDEl9ZNvudEI9k08n8yO3D0yFRPviLHYmMgs7bt1ei
 bfMi/wWTJGuctV/pquK6+wIGZYVVB80REKLiWj7Y4379iAR3JRHiNvkHWAhewNE4/kzJ
 CkRA==
X-Gm-Message-State: AOAM532AHOUcLZG2S+PrBXz0jgg1CCCX/Yr8/HvThbHUdQoQUa+RGBXU
 OFz62l7n3KdCyEIYlK8194Rf6Sz0CKPNVkl9IGXVUyBZ05iTpyW0ak/QiZQSmyglUWayU38cBYs
 9JifCCC71vNrq1eFwaQ==
X-Received: by 2002:a5d:52c9:0:b0:207:99d3:7b4d with SMTP id
 r9-20020a5d52c9000000b0020799d37b4dmr13674635wrv.77.1651592389436; 
 Tue, 03 May 2022 08:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNguUzO3f6pYvwbJuneLx1hpRyp+C0evMBPYlp7C/saiQLgVCBl73sOiMNsKJ+h54Vdwyvhw==
X-Received: by 2002:a5d:52c9:0:b0:207:99d3:7b4d with SMTP id
 r9-20020a5d52c9000000b0020799d37b4dmr13674612wrv.77.1651592389150; 
 Tue, 03 May 2022 08:39:49 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 m13-20020adfc58d000000b0020c5253d8cesm9520638wrg.26.2022.05.03.08.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:39:48 -0700 (PDT)
Message-ID: <1192fecb-a730-65e1-c3fe-1e89456e6981@redhat.com>
Date: Tue, 3 May 2022 17:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] vga: avoid crash if no default vga card
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 03 May 2022 15:40:06 -0000

On 03/05/2022 11.17, Guo Zhi wrote:
> QEMU in some arch will crash when executing -vga help command, because
> there is no default vga model.  Add check to this case and avoid crash.
> 
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>   softmmu/vl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index c2919579fd..a49e29312b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -977,7 +977,8 @@ static void select_vgahw(const MachineClass *machine_class, const char *p)
>   
>               if (vga_interface_available(t) && ti->opt_name) {
>                   printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
> -                       g_str_equal(ti->opt_name, def) ? " (default)" : "");
> +                        (def && g_str_equal(ti->opt_name, def)) ?
> +                        " (default)" : "");
>               }
>           }
>           exit(0);

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/978

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>


