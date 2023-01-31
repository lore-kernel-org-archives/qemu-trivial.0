Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMr9N-0005f2-NA
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 08:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr9M-0005ec-I1
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr9K-00014X-Br
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=456xjmqocIvNrmlzuhjNLfoVOc2d70px+xPDRgFYxTQ=;
 b=SkNA9phw2iGGffszG1M9PYY2JfKBJNGmmv63N7NnYjhcePetn6UvQXKQlvjcpSL2vh79C+
 YtYOvDbKF3XZovQkbVdGMcf31uve8XBSDOdRle4kSsEIyEHIHEUrulo8vTvtZNYsiPTaPY
 BJrQPmggHr/fRif+sgqCVw4MbJ38THw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-Zm1tq0KXM-a2lLyqKwXfew-1; Tue, 31 Jan 2023 08:58:11 -0500
X-MC-Unique: Zm1tq0KXM-a2lLyqKwXfew-1
Received: by mail-qt1-f200.google.com with SMTP id
 a13-20020ac8108d000000b003b7ea9814a2so6548999qtj.2
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 05:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=456xjmqocIvNrmlzuhjNLfoVOc2d70px+xPDRgFYxTQ=;
 b=sE1oKOTsM/JbBGrGnktb6myO7G62D9bYo8GPomHrpZMBAjaH8uPv/622sPivmKgOCj
 o2tH4RwJqi03vpk2g8J452WFaBUVgMnwQWnOZMUtbrWA2msLB4PkjeDjjqdq8DfikdZn
 ynHUIdtaayo666VU8dK3i/3+Hd/LoHlF5URLgV2956bwEuPbZtgcS+riR9xwjtd7W74h
 IlYcDoL9S6157/QALMt2YFK0JXvtgPDemTWvQQ6LlG7lAbYNfDYhKVxji+gysKQJqYJN
 jtAxsllxSXd2X1RJSi0WDAjRvsgrialjPI+8cmtLuzCCeremC9BtKea3bLvcLyRrbMpe
 YNGw==
X-Gm-Message-State: AO0yUKXfKewyw51B6AZpz2IfjyNyvW2tQIGKCJP8vxGunWtEDv7hkpPn
 83PGMWsZaJ9qMBSOIoyxO1YqNBY64ooK8TWKGLDe0XKaqW30ibgywHcaAmxTnig1zTF4yLB6tRo
 Uebvu7Ij3eZsh7meAnQ==
X-Received: by 2002:a05:6214:8e3:b0:537:8125:b537 with SMTP id
 dr3-20020a05621408e300b005378125b537mr24025676qvb.11.1675173491015; 
 Tue, 31 Jan 2023 05:58:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+3PPgH3EDqSh43P3mvz3WF3IxriWPHAVWi/UKZG6n0XDA/FWwwv46j/hU2nwwuElFmOm02pg==
X-Received: by 2002:a05:6214:8e3:b0:537:8125:b537 with SMTP id
 dr3-20020a05621408e300b005378125b537mr24025650qvb.11.1675173490795; 
 Tue, 31 Jan 2023 05:58:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b4-20020a378004000000b0070736988c10sm9995286qkd.110.2023.01.31.05.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:58:10 -0800 (PST)
Message-ID: <c4cf1d51-5cf8-ab87-6def-38a45e5861b5@redhat.com>
Date: Tue, 31 Jan 2023 14:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/20] hw/i386/pc_{q35,piix}: Minimize usage of
 get_system_memory()
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-7-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-7-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 13:58:16 -0000

On 31/01/2023 12.53, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


