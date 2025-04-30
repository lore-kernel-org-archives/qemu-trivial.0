Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uABvB-0001uC-A1
	for mharc-qemu-trivial@gnu.org; Wed, 30 Apr 2025 14:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uABv7-0001rD-Mm
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 14:12:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uABv5-0004fV-3B
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 14:12:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2255003f4c6so2154365ad.0
 for <qemu-trivial@nongnu.org>; Wed, 30 Apr 2025 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746036749; x=1746641549; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oo5VAC6FFiaiCNIRU7t1i8OeYPVGZfcVM9VeES1ffjw=;
 b=Zs63d1rXdUNVoEavZXoaeEuoQ58vdt/g5NBjpRgrjrzTfLLKqe2QvEjzvVVhvfiIK8
 SsBZYhzjxZHs615WuXn3fZpUdEqjt9L2KfVSsDmhsITaIXh+3McbmqkRKtmNU9tf+g/y
 fBzxQyHl7ADAypgInoFDsk9nKYaXNFtQ3Z+pGI0+wOI8Wslz2yW4Hkty/N0VUuLfdW/6
 KdowQPYYSQ19jCdrtjEER+OQTRPemeL1SVhtPCak4gX/usy3bJEo60J4H+PxlJnJ6MSc
 +4UsuzGn6482ZKNbJ//TV9x8afyC8x01fTwljawHyS0C/PETveO2mc3MPNLbyslx563+
 nJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746036749; x=1746641549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo5VAC6FFiaiCNIRU7t1i8OeYPVGZfcVM9VeES1ffjw=;
 b=NOrJQB3k5yF6GvoNX+RvZk9UKHuMIzuh+J1I1v3PM7Dghxvr+amjUGfZWaRO5mEh0Y
 TVeWrOW6Lc1BdmR0foZUwuhGUI2l8hT+vJsA1U9s3dy3s0l0hN+p+P7pz3lixtk+thh2
 ncTq8oUGvBAP2T+rhTdIAiF1yVsmlxNEDXay+AlUVbUUpMkYbuRBYX8dHMhVyCrvU6l+
 A0kyHV2kuVxhFShMt31CO4LM0is4NZKdJ+RAc2/giJZiE6+1jsTQfKjFGAPzfio5PaNd
 /CNoDZnJYlFoLCbqgxWTIGnH1ui0tV1LZbNsMqr9+38FWAQqTXDfciz8Y63ZL96Dzg9A
 IvoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN8TkDnCy6epbHUNA3x1eY3Kyu+5hmcg0znYlUGqAt33MC8HZTepFtKcLVXJwJwBcf1ApKSQ/H0sKaF/4=@nongnu.org
X-Gm-Message-State: AOJu0Yw3N2m451qDxZkLVYuXXpDLDBDcPegxaLWNWeAiLlFxe7F94h3J
 KnjrM5AoKUnSgB6qhHL48kr4O/ePxjpupa7FT5EsOaCF5sWveh0g7bcppqjKekE=
X-Gm-Gg: ASbGncs4+aXTglgev4xoi3nZ8NgJN23HvgJEw1cDtegIhwPg/z5KX1b4PbRt8Xp/L1i
 s7DgG0AqoL750lYKw05TQd05abn0MxmtYq5NuRZ7ecHky/bgSn6RbTT6p13vawDqJQ0hzxNQgxr
 nftX1a1KW4oAbtREaL5o4bG8UioEybX9AOAlOzEcmHCYG5Y8i9TB7lhahxzUJQz6GCCXAGm7iU5
 0EN9bqkFUnjC8dORTWkJwYKWGRzR9Kk/AWvEnsnfV5qzEuG08xerjCb9rYDUcc2Soeun+rxJ6HK
 ZzpfoJw5puzPVJUjPkMdc2uRCFdpyp93iQ4bHWRoqFud5t5HvcGk/Q==
X-Google-Smtp-Source: AGHT+IGP+MnWTHimHJjTymYBKXMZ4Qzk3l4ccFmv0XPl9j5klcCO560yxO9CYx3CLEU0CQ445Hs1+g==
X-Received: by 2002:a17:903:144f:b0:220:fce7:d3a6 with SMTP id
 d9443c01a7336-22df3508d30mr68259535ad.23.1746036749533; 
 Wed, 30 Apr 2025 11:12:29 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76f4bsm125670985ad.49.2025.04.30.11.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 11:12:29 -0700 (PDT)
Message-ID: <c5bd354b-15e9-4f44-b768-8d2ded4d0e5a@linaro.org>
Date: Wed, 30 Apr 2025 11:12:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/devel/build-environment: enhance MSYS2 instructions
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250305213853.3685771-1-pierrick.bouvier@linaro.org>
 <b28bf347-aa8e-405e-8009-025aaf61a984@linaro.org>
 <88d6e264-4793-4095-8bb6-bc45621abeea@linaro.org>
 <06666850-90a1-4b4a-b454-53df477de215@redhat.com>
 <42a0987f-4f51-4d36-a3f5-1daf267c3e0d@linaro.org>
 <82b79386-ee34-4f06-8e61-76f47b4aaad7@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <82b79386-ee34-4f06-8e61-76f47b4aaad7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Apr 2025 18:12:34 -0000

On 4/30/25 10:54 AM, Thomas Huth wrote:
> On 30/04/2025 16.34, Pierrick Bouvier wrote:
>> On 4/30/25 3:09 AM, Thomas Huth wrote:
>>> On 28/04/2025 21.35, Pierrick Bouvier wrote:
>>>> On 3/24/25 10:47 AM, Pierrick Bouvier wrote:
>>>>> On 3/5/25 13:38, Pierrick Bouvier wrote:
>>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>> ---
>>>>>>      docs/devel/build-environment.rst | 4 ++--
>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/docs/devel/build-environment.rst b/docs/devel/build-
>>>>>> environment.rst
>>>>>> index f133ef2e012..661f6ea8504 100644
>>>>>> --- a/docs/devel/build-environment.rst
>>>>>> +++ b/docs/devel/build-environment.rst
>>>>>> @@ -97,11 +97,11 @@ build QEMU in MSYS2 itself.
>>>>>>      ::
>>>>>> -    pacman -S wget
>>>>>> +    pacman -S wget base-devel git
>>>>>>          wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/
>>>>>> heads/master/mingw-w64-qemu/PKGBUILD
>>>>>>          # Some packages may be missing for your environment, installation
>>>>>> will still
>>>>>>          # be done though.
>>>>>> -    makepkg -s PKGBUILD || true
>>>>>> +    makepkg --syncdeps --nobuild PKGBUILD || true
>>>>>>      Build on windows-aarch64
>>>>>>      ++++++++++++++++++++++++
>>>>>
>>>>> Gentle ping on this trivial change for doc.
>>>>>
>>>>
>>>> Another gentle ping on this trivial doc change.
>>>
>>> Not really my turf, I don't have much clue about the MSYS2 environment, but
>>> since there were no objections, I can add it to my next PR.
>>>
>>
>> Thank you, that's appreciated.
> 
> Could you still please provide a proper patch description, as Daniel suggested?
>

Sure.
I just sent v2: 20250430181047.2043492-1-pierrick.bouvier@linaro.org

>    Thanks,
>     Thomas
> 

Thanks,
Pierrick

