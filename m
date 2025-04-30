Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uA4Nz-0002ry-5b
	for mharc-qemu-trivial@gnu.org; Wed, 30 Apr 2025 06:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uA4Nd-0002mK-HL
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 06:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uA4Nb-0007tH-Iw
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 06:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746007765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nEXwRBGZ/dtdtNRGKgE/34N1gqkxrrK4jcQDdJQA3cA=;
 b=SoFqPorzH3RyEnI9nDnCl69kFkRVeVH30To/bssX+eHVdgP+snn3iX2EDWHbCJUM0F67JK
 40MsGTnSbHt7AKuMit4OqveKNBUS6uQkU7IONc+m+Yj2qi2wY3MBQ0egK9yx+JnJHrZ4Kh
 FWwhPDqeEFVysqzb7jmXe+Z+7jeMS9I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-lozw6bwEOcqIqiGjhOuy-g-1; Wed, 30 Apr 2025 06:09:24 -0400
X-MC-Unique: lozw6bwEOcqIqiGjhOuy-g-1
X-Mimecast-MFC-AGG-ID: lozw6bwEOcqIqiGjhOuy-g_1746007763
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43efa869b0aso43018805e9.3
 for <qemu-trivial@nongnu.org>; Wed, 30 Apr 2025 03:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746007763; x=1746612563;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nEXwRBGZ/dtdtNRGKgE/34N1gqkxrrK4jcQDdJQA3cA=;
 b=GtowWDM+G4IxVsBuoa0yKBqapEU4FODwKQhZjEFpi2trCUkrzyT9XabKAYxjw+biiR
 /YUa78VnbrAZwK4MC/hLSP+Rx5ujiUxuk2rlZna1GGdd7R1APXHo3BcVQmO5VkFLDL95
 OcZFiWovGb1rStMtHgYWbHnhy5wkgx1Lz4yLrMKLEaPfbb7asSDwoW0PAImL7tA2so1O
 o1MWMe2otgpxZHqhlAm+CCxCAuMbPdOs8dVJj/ByC40NsbBlevCY/54YXY4H9T25X/9x
 7IX4i51LAirCxKfWFyNWjmeisxNL+qllnwLW2kx4QiKUhXdQwJ7BAzgDMfqHstGA4PON
 JxlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK8nsHCcKZ2XO0Q6j7kjr4eMIltDRTQ3aJjEXIt/hC5g1mqp8G39kWXnG/KFcnKai7vxObpI2Kw2iFr7U=@nongnu.org
X-Gm-Message-State: AOJu0Yyar9E1Xy1TU2PREdtgsWDxb+JdiL1r3TvMl8DKSq9+tjFXU8IK
 2evXCKCVlRWfRu3waDvMBV/nDMzLle7sydH21yv1RStaS+ajFEAZs0j/2bptTssmMLFH9przs1F
 38d8kv3JSQ2PWx6ltkb8akKo9Q2C+U0gOGdTeme2YM/Uai7DUeVLRQs4=
X-Gm-Gg: ASbGnctYeqVITzIg956BQoa9EIRLhTrd+cAKLNsJaoMS1oYbXCvy1jAjmkKnY5yzWIX
 /lneEL0Ehty2UTCSJDPGeuEZdoIrAWq4UyGkXw+QCUxtt/1Yq4W050EjKchl5AHv+kk8RPmtSVn
 F6iiPH/bQ11XT57x5/T7NpWX2hg2ukecufPPepKmA4ORLkjx8Z3kIhk3Flg2S9QnregpoI/VMWX
 P+2yXi5nMxu5SFD9YGIK6Rz79aR8IjKzYqcKmYWaUQlRFlIO2/s6EwXNnacyKQp4YYBSQwTlptx
 1PKU94bOwFvsi7o3t/8N6czPIALKWR9KS+QM0JHo
X-Received: by 2002:a05:600c:1c21:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-441b1f3a3f2mr23743105e9.15.1746007763435; 
 Wed, 30 Apr 2025 03:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuMrhqSmqC6JYgThXx1apTBwLiTTehuBiMB+ySfVHxgOBwtKoqV2U4dxMRVlhGHNAfG7kPMw==
X-Received: by 2002:a05:600c:1c21:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-441b1f3a3f2mr23742805e9.15.1746007762990; 
 Wed, 30 Apr 2025 03:09:22 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-87.web.vodafone.de. [109.42.49.87])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b3ae0c19sm11942275e9.24.2025.04.30.03.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 03:09:22 -0700 (PDT)
Message-ID: <06666850-90a1-4b4a-b454-53df477de215@redhat.com>
Date: Wed, 30 Apr 2025 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/devel/build-environment: enhance MSYS2 instructions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250305213853.3685771-1-pierrick.bouvier@linaro.org>
 <b28bf347-aa8e-405e-8009-025aaf61a984@linaro.org>
 <88d6e264-4793-4095-8bb6-bc45621abeea@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <88d6e264-4793-4095-8bb6-bc45621abeea@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sRLaK99gCts9BtVbd1h1QJ6qcHfntfXJtNj6fydUzyA_1746007763
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 30 Apr 2025 10:09:31 -0000

On 28/04/2025 21.35, Pierrick Bouvier wrote:
> On 3/24/25 10:47 AM, Pierrick Bouvier wrote:
>> On 3/5/25 13:38, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    docs/devel/build-environment.rst | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/devel/build-environment.rst b/docs/devel/build- 
>>> environment.rst
>>> index f133ef2e012..661f6ea8504 100644
>>> --- a/docs/devel/build-environment.rst
>>> +++ b/docs/devel/build-environment.rst
>>> @@ -97,11 +97,11 @@ build QEMU in MSYS2 itself.
>>>    ::
>>> -    pacman -S wget
>>> +    pacman -S wget base-devel git
>>>        wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/ 
>>> heads/master/mingw-w64-qemu/PKGBUILD
>>>        # Some packages may be missing for your environment, installation 
>>> will still
>>>        # be done though.
>>> -    makepkg -s PKGBUILD || true
>>> +    makepkg --syncdeps --nobuild PKGBUILD || true
>>>    Build on windows-aarch64
>>>    ++++++++++++++++++++++++
>>
>> Gentle ping on this trivial change for doc.
>>
> 
> Another gentle ping on this trivial doc change.

Not really my turf, I don't have much clue about the MSYS2 environment, but 
since there were no objections, I can add it to my next PR.

  Thomas


