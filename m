Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rSEqJ-0003yS-Vv
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 06:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSEqH-0003y9-0Q
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 06:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSEqF-0006DF-3L
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 06:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706008876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4nZhitQLeFYxxRw8NyfF7kvPbdMURdfGwDqHF+01gSw=;
 b=GkoeppM8hmTfd4sek3VW7u8ZbpUr9RtvN2QMB4AaLDkXKwZULna19d46u7zBTR7WWrHmDe
 Q0arRP1jmVA6C7ZLUGZWIfbD4wBilmZocH+3CYavYaMr8VMolnNV9c0tTke8b2v3gHqcPF
 lqoz+JKI010GEdtTWwCIRpCn0NZ/LzI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-Hw6W4B4hPwSHarkLo1gJqw-1; Tue, 23 Jan 2024 06:21:15 -0500
X-MC-Unique: Hw6W4B4hPwSHarkLo1gJqw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-42a3e4e9155so35827721cf.1
 for <qemu-trivial@nongnu.org>; Tue, 23 Jan 2024 03:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706008875; x=1706613675;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4nZhitQLeFYxxRw8NyfF7kvPbdMURdfGwDqHF+01gSw=;
 b=XJTEn+muH9RKrkHN2XWoZ0KSF0Cbu5/V39WaF1pxGKXZSR9B/jmV5nC41Bzm4tjh/L
 Vyo+UFyqdSnQq+bOPCrS2PLqSA3Pd6i7sNSNEQgGZdoD84YpZ5ib/izkYL6IaANi7GNa
 sCBiN/yth/Zl2QbKdCPZero3Y7ORG9SDJydT6MMqoz6gBKLyu+cyXXumHakHj/y2i+K+
 fUGCfWOSeAq4dtGbCmH6nvm+Nu5e/7xYnFIwrJg/3ogJHvqTy1+eLIHRaOInBqvHU/7D
 h4T9lgTNVHgvyjWjGc9Dgw9gVZmb6UZnF3roZZVpt/ZfAqT31ziKxG+CvOSlMP38mBPv
 AFXg==
X-Gm-Message-State: AOJu0YxoPPtkbMmDsvK16GkJJrB21d6IMYzluzkbbAysD+fgkRiktBIN
 JqyTPdumdXT0I7REdmzxjpfzcjIrsETy789DGTwT9fhBLB3QBEtH1kut77O8RVkGWvafP1O5+Gn
 iUnQwr06nrAM6HMfpAqLmAiIuHNTtasl+LF8si5eg5OYLUw2Nz+GVLmg=
X-Received: by 2002:ac8:4cdc:0:b0:42a:525b:b658 with SMTP id
 l28-20020ac84cdc000000b0042a525bb658mr334889qtv.18.1706008875084; 
 Tue, 23 Jan 2024 03:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHNDkytr+Vv8dL7mWjQRhIjl6/4vX2/5OKViXg/cyFFOjTmeU08tSR0K7CtIG7cp0nEeniiQ==
X-Received: by 2002:ac8:4cdc:0:b0:42a:525b:b658 with SMTP id
 l28-20020ac84cdc000000b0042a525bb658mr334885qtv.18.1706008874909; 
 Tue, 23 Jan 2024 03:21:14 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 cf12-20020a05622a400c00b00427f375c329sm3367878qtb.26.2024.01.23.03.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:21:14 -0800 (PST)
Message-ID: <36d84165-4ade-402a-ab8e-5f7623675eeb@redhat.com>
Date: Tue, 23 Jan 2024 12:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] util/uri: Simplify uri_string_unescape()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-trivial <qemu-trivial@nongnu.org>
References: <20240122191753.103118-1-thuth@redhat.com>
 <20240122191753.103118-3-thuth@redhat.com>
 <CABgObfZRmavOuv-1iXEyjfcMnKYBGwytYTY7cATpNA14QtHM=g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CABgObfZRmavOuv-1iXEyjfcMnKYBGwytYTY7cATpNA14QtHM=g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 23 Jan 2024 11:21:22 -0000

On 23/01/2024 11.25, Paolo Bonzini wrote:
> 
> 
> Il lun 22 gen 2024, 20:18 Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> ha scritto:
> 
>     uri_string_unescape() basically does the same as the glib function
>     g_uri_unescape_string(), with just an additional length parameter.
> 
> 
> You can replace it altogether with g_uri_unescape_segment.

Oh, nice, I indeed missed that while looking at the glib docs! Thanks, I'll 
give it a try...

  Thomas


