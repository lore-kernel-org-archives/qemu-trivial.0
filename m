Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP6k-00010a-4K
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP6h-0000zp-4P
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:20:19 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP6Z-0004so-Go
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:20:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4127011685dso2636875e9.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431609; x=1709036409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=en4M2z59ORJxnfwO0sqQooTGqZaI9mV3tBiE1WfXXyo=;
 b=BPTiifJQeWiqcmD7iWw51J1KZwv0encMuRmaN36SPHyiGt3wLL15hfa2mkGyBwYes6
 HmRB/H04igDv7YWaaQM0NoFsIfg+S8oFAgwZcGlulbSjHENwAuEBbfsf5W1s9b3D/i+v
 WjcNSC6biACGLfoAgFjhLaJijT4krqvlC5Jfbx6HKPy9GWcc/uD0rsrteKxdgThvY2x1
 Ab/3H2GPwQke8gFigr22UG42d/cOfb1vbpuYcZqADN0cKUPqHNXcmVbbjVuekm27T4yq
 YpsenUd7GReBRKtatSDrIz9atWbtwOXyaueVDCc//NoCqzx72oEeNabhX+yL2HhfuSQ/
 /4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431609; x=1709036409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=en4M2z59ORJxnfwO0sqQooTGqZaI9mV3tBiE1WfXXyo=;
 b=pHgCe085gV/INlJnZreK+iarG7yZKuRECuIpfAcxz898nFs0INx3agOJxQNBauz3SU
 QvYiKPv+vjcYbP7tpJmsXA0OskyhFz8Eh5KmjEsvKFJr4rqsV1iTRiIZDgXvQCENGDSf
 /prPqA7IYbW0qZsqarKCXu3Jq0P+uyvwchxNDzgD0ZmM5u+eBBhMUPGC1h9B02MgGMXx
 wOhLUwB+AjwzZ/KnN0TuFKm9iDNrKxjJv3hepWKQ5OmEeTtB9AVKXwPRk0N6muj/7FF1
 jslxqHpEtrnYdpkv//ApM1LYTRVs7oPN7NktREmqeP4A+MjsI6OaKN2HD+CuFrugxDDf
 dtbQ==
X-Gm-Message-State: AOJu0YzHt4g9QeZSWQJf+xP2b+5GZbt52yf9qWuhg2JS+zeMkUyYDGnb
 iMtleYJHrw/VnwJMEiqwR8Xt+Wvna8Q4zVPM9gsqJX1CPjeKkmr8dNPq0d60Age/1JvxUPeOM7v
 4
X-Google-Smtp-Source: AGHT+IHwzxjgKJ00sjIlYJBm3oz94NkdqV85y6tx2+TlFKI3jsI0GvUfjSUst1wFZUM7HhYhRKbOOQ==
X-Received: by 2002:a5d:4389:0:b0:33d:3b83:6ca3 with SMTP id
 i9-20020a5d4389000000b0033d3b836ca3mr4647585wrq.64.1708431609143; 
 Tue, 20 Feb 2024 04:20:09 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:20:08 -0800 (PST)
Message-ID: <3d446080-6be2-4a05-bc52-a2b131e84a4a@linaro.org>
Date: Tue, 20 Feb 2024 13:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/21] qapi/ui: correct typos
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <2b12236539211bfa887364cf7b621586addbb42e.1708419115.git.manos.pitsidianakis@linaro.org>
 <87a5nvcw0p.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87a5nvcw0p.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 20 Feb 2024 12:20:19 -0000

On 20/2/24 10:41, Markus Armbruster wrote:
> Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
> 
>> Correct typos automatically found with the `typos` tool
>> <https://crates.io/crates/typos>
>>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>   qapi/ui.json | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index b6d7e142b7..1448eaca73 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -63,7 +63,7 @@
>>   ##
>>   # @SetPasswordOptionsVnc:
>>   #
>> -# Options for set_password specific to the VNC procotol.
>> +# Options for set_password specific to the VNC protocol.
>>   #
>>   # @display: The id of the display where the password should be
>>   #     changed.  Defaults to the first.
>> @@ -125,7 +125,7 @@
>>   ##
>>   # @ExpirePasswordOptionsVnc:
>>   #
>> -# Options for expire_password specific to the VNC procotol.
>> +# Options for expire_password specific to the VNC protocol.

Too bad, I remember reading few times the procotol, it was
funny.

>>   #
>>   # @display: The id of the display where the expiration should be
>>   #     changed.  Defaults to the first.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> 


