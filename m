Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sdpdv-0000jX-SA
	for mharc-qemu-trivial@gnu.org; Tue, 13 Aug 2024 07:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sdpdt-0000dI-DU
 for qemu-trivial@nongnu.org; Tue, 13 Aug 2024 07:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sdpdr-0000wJ-IX
 for qemu-trivial@nongnu.org; Tue, 13 Aug 2024 07:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723548281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AsZYwO1LtSDc+CfljpW0rMMOKuX0wGVBuUx0HtruIno=;
 b=Op2V7GkgG58I6jefqvWJhzLh69V+hYdiihM/8C6yohOwHF1gFxY2woCvwo/xrAX4o9HRkJ
 YWAYQ1VR3LLTznnqLwVr2q/niET6iDzD09WmqwlDTDve1UOAqk9wxod7lbkLKBrl//9Nx3
 CspXT0Bbt1lek+Ste/CTcZD5V2fMSkk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-MNgWXFvNNcO7KvXNgAJy6Q-1; Tue, 13 Aug 2024 07:24:40 -0400
X-MC-Unique: MNgWXFvNNcO7KvXNgAJy6Q-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ef1ba2a5e6so56372681fa.1
 for <qemu-trivial@nongnu.org>; Tue, 13 Aug 2024 04:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723548279; x=1724153079;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AsZYwO1LtSDc+CfljpW0rMMOKuX0wGVBuUx0HtruIno=;
 b=JdOcqvV4kzfu+/zey8mMjHt11h0MXYW/jtTo7e/Uzun32oBRsPzEvGBKWu4rdnlnnu
 8lxC2Gwi2zsmhPwWVxsRy9W7Lj3YBuXT3WkbGsKTTRHFeK2EE5IDBzmOcukg9564Nmd+
 HeKoMMsIfuEPleU62tCW88rIJDiPnltm+QBSS/UqFdblp+/lPFWrosCYNCO9Ik5+2bVc
 LoKSB5JY946uu4RYm889z2aoL56EE7z7HLo0xUIuGgJV7vRYHmBxddMGGuyPiol9hUk7
 9diMUVdSbnDKcoybre9g3XZoKi/MbKfHhp4r4uqg1JzkiItpGlF3jCe2EvVeFTBzNkJ5
 tY3A==
X-Gm-Message-State: AOJu0Yz8DNHALA3ogxvpZvhtvjDisCsQN8FUvrVvoyiiQ58mWtW6KfKS
 m7EiXMao8gnEdX6nfdWVJro3sPZEKtZeiC5w2PFEA6C/NsgmWGgK3g3OJETp8a85kBzdUg8qWHN
 2I2mUYBTMPrPzOF1pGKkpefHKkjt44XEe5w4nZObXYz+AQbNJ17NvEIk=
X-Received: by 2002:a05:6512:1195:b0:530:ea60:7e07 with SMTP id
 2adb3069b0e04-5321369b3e1mr1967471e87.58.1723548278966; 
 Tue, 13 Aug 2024 04:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEoDh34JthIKjlpfTLObObyy0NLNPAaAq1nJ2AzXdI/MqTefu42JibeRbfBXEgiBaLeNtng==
X-Received: by 2002:a05:6512:1195:b0:530:ea60:7e07 with SMTP id
 2adb3069b0e04-5321369b3e1mr1967459e87.58.1723548278446; 
 Tue, 13 Aug 2024 04:24:38 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.101.29])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a80f3fa7d26sm62160766b.67.2024.08.13.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 04:24:38 -0700 (PDT)
Message-ID: <9e09f20d-1ab0-44bd-9f0e-71d29fb90191@redhat.com>
Date: Tue, 13 Aug 2024 13:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/pc: Add a description for the i8042 property
To: =?UTF-8?Q?Kamil_Szcz=C4=99k?= <kamil@szczek.dev>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <15fhXFY6x78KW8P5gw0eKTW8kc17zejrJFxqnOyoBy6vw4W9rCmgDhoxssWosWFs_dbFtfsyjn9wpPrV3x8Nlzhy8mTJSEnXCr4qyHAhXSw=@szczek.dev>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <15fhXFY6x78KW8P5gw0eKTW8kc17zejrJFxqnOyoBy6vw4W9rCmgDhoxssWosWFs_dbFtfsyjn9wpPrV3x8Nlzhy8mTJSEnXCr4qyHAhXSw=@szczek.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Aug 2024 11:24:45 -0000

On 8/12/24 19:23, Kamil Szczęk wrote:
> While working on exposing the i8042 property in libvirt I noticed that
> the property is missing a description. This adds a simple description
> so that QEMU users don't have to dig in the source code to figure out
> what this option does.
> 
> Signed-off-by: Kamil Szczęk <kamil@szczek.dev>

Queued, thanks.

Paolo

> ---
>   hw/i386/pc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c74931d577..defbc33125 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1807,6 +1807,8 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>   
>       object_class_property_add_bool(oc, PC_MACHINE_I8042,
>           pc_machine_get_i8042, pc_machine_set_i8042);
> +    object_class_property_set_description(oc, PC_MACHINE_I8042,
> +        "Enable/disable Intel 8042 PS/2 controller emulation");
>   
>       object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>           pc_machine_get_default_bus_bypass_iommu,


