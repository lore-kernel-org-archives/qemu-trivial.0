Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sHhO7-0002Sk-MV
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2024 06:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sHhO5-0002SJ-LB
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 06:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sHhO4-0005dw-4O
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 06:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718273335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yF50Fu3YW72re3nJRKMaUbmikUDhQUEzENCafUaSfXg=;
 b=hXu3mnNRyV8Hxse+9RuJAczV9cHOXHOq8YAKQ4Pp9lxJodQpdra29RCv9mMbD4BDxf4S3J
 yzQ7E6DaP+i/RvkAgxUlLjsfDqU+cnKnb/FKVMITzoZbBGObf14Qqy3Uv2F9aNL/xXnoCu
 xtvRf/YzHYsnFdcOe6xQKH2/nmae0cM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-EDuGXHw_Pv-3VMz_W7msew-1; Thu, 13 Jun 2024 06:08:53 -0400
X-MC-Unique: EDuGXHw_Pv-3VMz_W7msew-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6f2662d050so37409166b.3
 for <qemu-trivial@nongnu.org>; Thu, 13 Jun 2024 03:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718273332; x=1718878132;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yF50Fu3YW72re3nJRKMaUbmikUDhQUEzENCafUaSfXg=;
 b=bbV1g4UW9sDo9wCADKoIgqe2pZFP1a+nwjbJ01QgEYI59LGrHA7txVi0GBbHXcUhD7
 f/NVfTgIYeI8P2ewwy698Mgl1AKnwwuC4nSrHacFY5YpZ0V79zpeagkhzZ0yQM2zbZ+x
 tpenwOZIZxN66yVC4JNhHwM/x7Qzu0V5THIF3FNnky+gyuKQl23oOQF2nX2ZaiccvHh+
 Lmgnai04qAroxwo2kYZoz+vHRnQfFNc9BkJSJZToXeb2t2meKw7jnL4YKFNv9oIYLS87
 MRTcgRpT01TfF9InpXRUcfdeGi6E8VlyFe2hrv1DL1mMGXtdJl0oSiRP6YsMgGJJoaUV
 JXYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEFc/ik2JFMmd45/c7NgVLgk0LhBR+8bc0nl4IGLyGY7aAvhIVSLtalTiQhKfnZZ9EAzLhOI4RWgrmOcNEvYQ+RAGi7//Dvg==
X-Gm-Message-State: AOJu0YzGy/E+09qO+Uw2g3r3hvCYNqlBASwRF7HvNXIRp1VoHlBslzIs
 lFax4llLpb2FMWBFyYo7TgK4/Vc5PiITyaz52H5YkKDwgvOgEtgRU8u8Bb0kaV6ScQ4z1A+73ex
 VT4n4z3DMEByf8GP/toN0ukynZsjsS9vUioWYrC5CWR86RiyeGdqoKCk=
X-Received: by 2002:a50:8d17:0:b0:57c:6861:d72a with SMTP id
 4fb4d7f45d1cf-57ca97497e6mr2886501a12.4.1718273332434; 
 Thu, 13 Jun 2024 03:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtW+G4HfUOCtzBJ053uLUwtCcsYMCvKc2oqwmsKkgeoqoAZuJ5weROSnAQTSeWP6B18QPGRQ==
X-Received: by 2002:a50:8d17:0:b0:57c:6861:d72a with SMTP id
 4fb4d7f45d1cf-57ca97497e6mr2886488a12.4.1718273332012; 
 Thu, 13 Jun 2024 03:08:52 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-242-210.web.vodafone.de.
 [109.43.242.210]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdff1sm722883a12.3.2024.06.13.03.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 03:08:51 -0700 (PDT)
Message-ID: <2982b9c8-1325-4ca7-9e91-b1a94178c9d9@redhat.com>
Date: Thu, 13 Jun 2024 12:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/fuzz/virtio_net_fuzz.c: fix
 virtio_net_fuzz_multi
To: qemu-devel@nongnu.org, Dmitry Frolov <frolov@swemel.ru>
References: <20240523102813.396750-2-frolov@swemel.ru>
From: Thomas Huth <thuth@redhat.com>
Cc: alxndr@bu.edu, sdl.qemu@linuxtesting.org,
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240523102813.396750-2-frolov@swemel.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
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
X-List-Received-Date: Thu, 13 Jun 2024 10:08:57 -0000

On 23/05/2024 12.28, Dmitry Frolov wrote:
> If QTestState was already CLOSED due to error, calling qtest_clock_step()
> afterwards makes no sense and only raises false-crash with message:
> "assertion timer != NULL failed".
> 
> Signed-off-by: Dmitry Frolov <frolov@swemel.ru>
> ---
>   tests/qtest/fuzz/virtio_net_fuzz.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
> index e239875e3b..2f57a8ddd8 100644
> --- a/tests/qtest/fuzz/virtio_net_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_net_fuzz.c
> @@ -81,6 +81,9 @@ static void virtio_net_fuzz_multi(QTestState *s,
>           /* Run the main loop */
>           qtest_clock_step(s, 100);
>           flush_events(s);
> +        if (!qtest_probe_child(s)) {
> +            return;
> +        }

According to your patch description, it rather sounds like the check should 
be done before the qtest_clock_step() ? ... or where does the QTestState get 
closed? During flush_events() ?

  Thomas


