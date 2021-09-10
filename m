Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOmHg-0004td-2z
	for mharc-qemu-trivial@gnu.org; Fri, 10 Sep 2021 15:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOmHe-0004tN-Jr
 for qemu-trivial@nongnu.org; Fri, 10 Sep 2021 15:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOmHa-0003bW-0o
 for qemu-trivial@nongnu.org; Fri, 10 Sep 2021 15:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631302432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slSXKJ7U9ML2UV7faA2E399tebxw1QwPjko8fh9996U=;
 b=A2HL/hQawJ2aqxhwDF2iufkhlFiJuLkzDDeTfU0SDmsf+YTyu2c2bUcaeYcOLgFXo9WibF
 1+gbq8xzgQmysVnhOwh8DobNKRgPHwkbrLJv2J6QgFkRBsuj8N9/hhFQ0SGzYm6+/eJ0qU
 7LwIQrHIlF/b1qKo/yfAyqa9Y7gEJW8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-kHrK5cX_NFipqt3JSr10Fg-1; Fri, 10 Sep 2021 15:33:51 -0400
X-MC-Unique: kHrK5cX_NFipqt3JSr10Fg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso868513wrw.13
 for <qemu-trivial@nongnu.org>; Fri, 10 Sep 2021 12:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=slSXKJ7U9ML2UV7faA2E399tebxw1QwPjko8fh9996U=;
 b=sWYnZhCtGl4vGBeRcQTwX/HdNZ7rIYlVSiYPmPNlT2oCJ5jobRy3i4BSXDDavtLfm+
 woJL0NBnZK4wwDvcMjqo0aVn6qtImq5cQZp/JNuHdzYSBoGEJKHFhWHJ5KTgoW2BGhJ0
 rm2A6T+gXqqElO2M8d8VVWc5krHBoqk3wBdvSeraOtmQ5aDnAvM1aajGNOsth5dXsmgK
 vkd10jYNLFLLC3kgzbMk63ZJ/AQzREVcnH6/8XlkLutzvvKRYNMTJrClyBHGGqnpdDEc
 0o6V4vr/DgClqreA/y0uk220eXI/+ENb3JtbAGDF5/boOgsMwuIZfGtV0IKr7NBwktj9
 W8Ig==
X-Gm-Message-State: AOAM530YURhHsmWCXfzSBsyf3Zl490Ve3+xud2AE2yvPw+B8msyVCVzK
 MsTZ2+cEskQv/m+1gc4TJ7QMfGTpPMVVw2MTJCCPakaV7LnHTuIK96SDMWTLWc7M+KSN68uFKcM
 StEAkFMCu6vDCyv6Gqg==
X-Received: by 2002:adf:e108:: with SMTP id t8mr11427775wrz.84.1631302430550; 
 Fri, 10 Sep 2021 12:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVldgQBme9X21NxOGC1240PEg0zs5viveDHkqA5TyZQSG8ecAt3FBgU29HG++AM5Av+Zyi3w==
X-Received: by 2002:adf:e108:: with SMTP id t8mr11427751wrz.84.1631302430301; 
 Fri, 10 Sep 2021 12:33:50 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm6393342wro.81.2021.09.10.12.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:33:49 -0700 (PDT)
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210908222157.2377282-1-philmd@redhat.com>
 <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
Date: Fri, 10 Sep 2021 21:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Sep 2021 19:33:58 -0000

On 9/10/21 8:54 PM, Volker Rümelin wrote:
>> Fix 'hotplugabble' -> 'hotpluggabble' typo.
> 
> I'm convinced that the correct spelling is hotpluggable. Only the
> consonant g is doubled.

Lol I missed this part, thanks :>


