Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOyL4-0000Yo-2P
	for mharc-qemu-trivial@gnu.org; Sat, 11 Sep 2021 04:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyL2-0000Wa-KE
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 04:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyL0-0002qf-3s
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 04:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631348772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQa0dTJXjPEfhq9hM9e116jUtWANY3funAfc4PKbtm0=;
 b=Me8EYQL4TpK5a7a7p2czQ9rNEnz6UJCb7LeWsG1aIPok2UnJyPDhazxzxIVoBDlbeNfzDy
 M20o2Oy+pYABv/3VgtmkY5Srvo4grtIQPDjWb5GA1ouGIarWdE0kUr4ElT+pu75MATE77T
 gM+WnE0IjbNU9L+6dgr6DfctBXACqCE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-PwCFPmgZMFapvg5WwSShGw-1; Sat, 11 Sep 2021 04:26:11 -0400
X-MC-Unique: PwCFPmgZMFapvg5WwSShGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b00304b489f2d8so187853wma.6
 for <qemu-trivial@nongnu.org>; Sat, 11 Sep 2021 01:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQa0dTJXjPEfhq9hM9e116jUtWANY3funAfc4PKbtm0=;
 b=4Rk2B3TfyryGc8ldbHuGcAwrQeti1W2nRJ5RWQ/Xq+9e/bIL+l1W/znrzso0ESpxI1
 qJ+SCzpHPz1qQ7ZuxElt++bD0zDveFzIRa15qWT3W5JLmXhK3LDbPr/IEt8w+5oKTVBv
 5o9YalEB1H5lClaMjRBGqYJnq2OmgEX7K+nsjj7ENbGEvMYRUBAOTpMa2ZNUWRi4GtJG
 hjCoAWHzG0z268BLjtlun+8cU1NyXue/x9dCVm6FbzP3bel3wfeO1fn5tspdX7AnqTQK
 MqhVW2hylAVg5IgUXoU+k0/IkPCiZTmRrDNiNpDptqzgBJ0T/nOm7RsaePCcVQ5M6COB
 EDdg==
X-Gm-Message-State: AOAM530DjoH8B+ajvmhmW7/IpKJ79TtVEnfH+X4ySdcdTvDX1I4vuPc3
 Q2Veyb7JSVJugpdaxX4+Vx41ewycrwOOK7gnTHCcB3oSbM2hB57rBLkswSVtqbTyGjgwp/p6gQg
 IJeKW+slRgWybSy8YF0N8u2qeLsoVgZR+zGLx8ik5jRTOllebmihw0/sITdbJb/H7QU8=
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr1623728wmc.75.1631348769781; 
 Sat, 11 Sep 2021 01:26:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYuLmPkUH12jkHSZtkFTc89Gkt59k5bcHkNP7yyxiRGy/j1Uo7Dz9b++qTYXfGCSD8jLRaWw==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr1623696wmc.75.1631348769377; 
 Sat, 11 Sep 2021 01:26:09 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g9sm992099wmg.21.2021.09.11.01.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 01:26:08 -0700 (PDT)
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: Ani Sinha <ani@anisinha.ca>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20210908222157.2377282-1-philmd@redhat.com>
 <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
 <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
 <CAARzgwzr=mKp6nxsy6STs5Sy9NKCkA53pCLY7CoxhbdN4=4U3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc0cebd1-43a3-17c7-f52a-db4db0161855@redhat.com>
Date: Sat, 11 Sep 2021 10:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAARzgwzr=mKp6nxsy6STs5Sy9NKCkA53pCLY7CoxhbdN4=4U3g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 11 Sep 2021 08:26:16 -0000

On 9/11/21 3:33 AM, Ani Sinha wrote:
> On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daudé
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> 
>     On 9/10/21 8:54 PM, Volker Rümelin wrote:
>     >> Fix 'hotplugabble' -> 'hotpluggabble' typo.
>     >
>     > I'm convinced that the correct spelling is hotpluggable. Only the
>     > consonant g is doubled.
> 
>     Lol I missed this part, thanks :>
> 
> 
> Oops my apologies. I also did not notice the double b.

Typoglycemia++


