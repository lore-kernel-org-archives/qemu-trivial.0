Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6V8Y-0007Z8-K1
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2021 04:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8W-0007Wu-MT
 for qemu-trivial@nongnu.org; Mon, 01 Feb 2021 04:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8N-0001uW-IR
 for qemu-trivial@nongnu.org; Mon, 01 Feb 2021 04:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612170274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=LHBh9Z1ZRSJazHLfYEXrDpslhbSYMdbMLlG1LYyVVBQCvnVfOIv1/o/39RaQVfFeYTjG2A
 W5Y5uWfyULlJEe0ijwUcOrQQvQnprqU9z88SMCMe8h+HDzjqsScXU+0n/TJWYPivfCmsnB
 HdxxXqQUPhW5XLwP9mzW4EOLDl4F2vw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-xzHZH17UPrSEU59EnHXfjg-1; Mon, 01 Feb 2021 04:04:31 -0500
X-MC-Unique: xzHZH17UPrSEU59EnHXfjg-1
Received: by mail-ej1-f72.google.com with SMTP id ia14so214540ejc.8
 for <qemu-trivial@nongnu.org>; Mon, 01 Feb 2021 01:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=TZOYxUTL2kFtL+dJ3cvPhw03kwB2MEeY2NyjWIwahGmkTkBdKjVniS7zoaJD9954j4
 tjIQXp7jZQz2HsRRV2jT7T2NDb3/m5G0GOPpaT6ip3hBE/3RLTxs8JSh4crxcs9qoY1L
 AB5Xzl9RzV+R5Qmi1KTPU1E0qjvxRr+TFTAIVrg99fMiP9HGeKv0v6rZ/DnV2kTuWQm3
 K00HLDECWGxpEId1lQtAenHApaxxHkgpknQEokQphd990n5dAiRqMvKAHtmo/TEAYx2a
 3bfzFGyJYDm9tn0DGY7PAOXSnDLlMcAlbaM7SXMxZ9UfYHYE4bGRyjsc6eUbu0uSs1/Q
 vX6Q==
X-Gm-Message-State: AOAM533f7FxtBgg0KQKyp0YlqzDFyzN4pSdULqMd+7MdyU+RF/r302Ct
 2qvyJtiVskJWMVpm2bkjs+exlsONH8X0ZGwhLgK39gw/PUKlScx8bhFIlXLZpZ7FEqN77iZcOj+
 avRTwocnSR4RLRiZS/Q==
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672204eje.1.1612170269825; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqCXEmg1ZoGdWyAMxWRH0h+ys6RVqCzPEqFaq5IKFs2JUihx2DDYvJaSlamEf+9VSxwvZ9Dw==
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672146eje.1.1612170269483; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm2sm607291ejb.87.2021.02.01.01.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:04:28 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e21d938-20e3-1595-b1aa-6fc2eff087e8@redhat.com>
Date: Mon, 1 Feb 2021 10:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 01 Feb 2021 09:04:45 -0000

On 01/02/21 09:46, Philippe Mathieu-Daudé wrote:
>>> +#ifdef CONFIG_TCG
>> I'm not sure it's enough. TCG and KVM can be enabled in the same
>> binary. You'll have to perform a runtime check here I think.
> If TCG is enabled, all SoC are built in (regardless of KVM enabled).
> If only KVM is enabled, the TCG part is not built in (only ARMv8
> based SoC left).
> 
> The problem is when QOM types are registered, we can not know
> yet if the accelerator is enabled, because accelerators are also
> QOM types and are realized later. So at this point runtime check
> is not possible. See this post:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777761.html
> 

The check should be done on the CPU type, not on the accelerator.

On top of that you could add a "depends on TCG" to the hw/arm/Kconfig 
file, but Luc is correct that it would be just a nice-to-have and not 
the real fix.

Paolo


