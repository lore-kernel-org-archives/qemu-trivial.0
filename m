Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTIGq-0006H3-1F
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2024 05:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIGo-00061V-LW
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:45:22 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIGl-0005gZ-7Z
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:45:20 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so20500731fa.2
 for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2024 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721036716; x=1721641516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a//mJPbnFwiilWEMy8qsTHnOig/DBpBaAeFKZiMZFzA=;
 b=yN8AcUUW4/4yKdzIp650pVtptJvdpU5U6MukcZAH9ySmzd2/z5vM1w5xFRgJgINnbv
 GXWqhoVp2Hgc69TEjfjTXb67IqMB+H0QTgMlnJ5qAAlzdvymwsTrB1pzRYwdO1Kty+H7
 ttDhmAqvvsUcRoaPCmpBGr5KdwwEqS9O8Wg6IhHg2tK6pMpLOTdGE8jl+zQu6n+kb/Iu
 loEqvCZv/BTH4vKX1ufUYY+MkJhZ531z3QLhKTGjhsT7pdQfP2Pr7+C475/gaHanEZ/a
 arXJIH24gLcOPobew/Eyn6zJ9jSc/0uIcsyfFjGtd4aDBqt9oMvCL1Y0gIoAMZnb7S9x
 kyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721036716; x=1721641516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a//mJPbnFwiilWEMy8qsTHnOig/DBpBaAeFKZiMZFzA=;
 b=T0ZZ8IBAIEz4Ch5BGIg/pxGTIOR/EEpXKZR1TfPV2nvOCnEu7z4GAS01KF3jvr+5QF
 v8SrZSdFsPt7SRltArouk45nXZH2lC7CCFksNUZ9K1lDY2Mwl6yIJ9m+FvO8DkCVR3Vf
 1eGlkEQ0GoKnTaP/5s3F1gi/3uLMj3stD0jF2kWop3NlfMe/DnYwKlHcCX+xq9i7IkmF
 EbWuNw7d30/yEf9yi2uF0mcA4+RNRjqLM4RrnkfL+uGjMwgqKoOmI2oeZem0nobImGCN
 n79qiMoqJ1E3acO6kNXSa485/QUS5nlJbYVsa5IV9qAp3F9S+R+0DMGDetPDTEusCnQl
 dE0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7xN6TQxSPb660EctH48ngOaE5MYjRVVRmaCwS3+mYMXTq7ppWsxvOrOC5UiMyQf8TefxKy7ce8zHCCT1mmACdQze5qAD6Hw==
X-Gm-Message-State: AOJu0YxnY3aqMQbBTT7JKoOGfcWYnsuPZz7jS9U+d8pTyWKLRyOxwG/s
 IPuA6Q39ez1plWh1gu5Y2+pg8wpamBTqCoVBbsRcuxtwrHsvWvkRr+mDfD6FeYs=
X-Google-Smtp-Source: AGHT+IEmGRFsbDYOB8eIAOJLbucWkYaSVGq5DqOyoqveB8u+UAmtnOhk1qYkQAKf5+U+O0my0JS43A==
X-Received: by 2002:a2e:9583:0:b0:2ea:91cf:a5f0 with SMTP id
 38308e7fff4ca-2eeb30dbe58mr117780041fa.19.1721036716237; 
 Mon, 15 Jul 2024 02:45:16 -0700 (PDT)
Received: from [192.168.121.175] (91.red-95-127-43.staticip.rima-tde.net.
 [95.127.43.91]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb478sm79597375e9.33.2024.07.15.02.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:45:14 -0700 (PDT)
Message-ID: <c2e194f0-d774-47a7-ae53-f0a11f00fd1a@linaro.org>
Date: Mon, 15 Jul 2024 11:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] backends/iommufd: Get rid of qemu_open_old()
To: Zhao Liu <zhao1.liu@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20240715082155.28771-1-zhao1.liu@intel.com>
 <20240715082155.28771-7-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240715082155.28771-7-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Jul 2024 09:45:23 -0000

On 15/7/24 10:21, Zhao Liu wrote:
> For qemu_open_old(), osdep.h said:
> 
>> Don't introduce new usage of this function, prefer the following
>> qemu_open/qemu_create that take an "Error **errp".
> 
> So replace qemu_open_old() with qemu_open().
> 
> Cc: Yi Liu <yi.l.liu@intel.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   backends/iommufd.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


