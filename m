Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q65sk-0001ku-ML
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2023 04:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q65sd-0001dZ-UU
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q65sc-0002Wh-A2
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685954877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eidoc9mFsqsFxYE2EDnR1lrudoxa0bnY8vwoFSWeWqI=;
 b=jCHoZd4vUo5PHg94Mq6sq+plwy9CqFtFRVjiwb1gfvEwkwfSj7fQTFxt2rXZpHoWyzQIvl
 gISt0RN2w/KfiSir6/WV44XIBhWXKcdPTihpKYYgAGiGOPMAm8PtBYvwQJM0YpiP7LDmUi
 DDB3zY/x5uQRp8Cu+v9A5XKIH0gSj0M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-AgFgGKyYMk-a4iNjyTWLpg-1; Mon, 05 Jun 2023 04:47:55 -0400
X-MC-Unique: AgFgGKyYMk-a4iNjyTWLpg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30af3835de5so1907177f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 05 Jun 2023 01:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685954875; x=1688546875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eidoc9mFsqsFxYE2EDnR1lrudoxa0bnY8vwoFSWeWqI=;
 b=AygxO6OAm/pG0xT5O5Z3J/1Tlxohnbz+UuMyMKMopGWSPxI1p04aouxzf7NHD4pL9R
 Mp/hA+8uM381hO4N+gqUB6R62zPV/uqqFg1eW7ohkjsjkP70N39lVrevoDzLjhdY8p2I
 fKFZrYeQNtoWEBdtREfHfVZaOmQjPEsUx68UGeinM8zoVXtCdxOq3InxVWbtKUSDibW/
 OZDdfypxtL3vqIYeX3sRO0XmWaWw5rAApkWPzth9Ib0dAOWs6XYNb//8BLv1ejjxNAiG
 cvZg0QtjHokwqmXsKIeMSPKtwAbyCmTSwFThj8csNFwgSFzw/9bAd2S/q0nqWxIcC0ZW
 8gmg==
X-Gm-Message-State: AC+VfDySmgSedQNtU0RfFBdMuFBSno7iD4DewtHI4Q4wBFfkd3kS8AhB
 9ioOhktM9CZIhHOGBn4InwBFDIODshSGbGCPXqigiYqJrkFIC3DL5ZQsUV3KCO2wZfcjw598ERg
 nly24Xs7/J7WvZH3IxQ==
X-Received: by 2002:a5d:4884:0:b0:306:b3f9:e2c9 with SMTP id
 g4-20020a5d4884000000b00306b3f9e2c9mr3979982wrq.6.1685954874910; 
 Mon, 05 Jun 2023 01:47:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4j3sA24mYy10c2nPj4Fvc8ZmbmkVryezSSpENhf1+ndPzpxDZmP9rQwAjeG4It5zp65APJSw==
X-Received: by 2002:a5d:4884:0:b0:306:b3f9:e2c9 with SMTP id
 g4-20020a5d4884000000b00306b3f9e2c9mr3979969wrq.6.1685954874664; 
 Mon, 05 Jun 2023 01:47:54 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-143.web.vodafone.de.
 [109.42.115.143]) by smtp.gmail.com with ESMTPSA id
 x11-20020a5d650b000000b00307972e46fasm9020161wru.107.2023.06.05.01.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 01:47:54 -0700 (PDT)
Message-ID: <4352552f-67ba-b964-7a7e-b13c9b19a27c@redhat.com>
Date: Mon, 5 Jun 2023 10:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] meson.build: Use -Wno-undef only for SDL2 versions
 that need it
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-trivial@nongnu.org
References: <20230605082748.53989-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230605082748.53989-1-pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Jun 2023 08:48:01 -0000

On 05/06/2023 10.27, Paolo Bonzini wrote:
> Queued, thanks.

Please unqueue it again, I'm still seeing some issues with the patch (not 
sure why yet):

  https://gitlab.com/thuth/qemu/-/jobs/4411089009

  Thomas


