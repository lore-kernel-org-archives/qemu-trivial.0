Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uA8Wg-0008OU-Mw
	for mharc-qemu-trivial@gnu.org; Wed, 30 Apr 2025 10:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uA8Wb-0008F5-RP
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 10:35:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uA8WZ-0008Bp-J8
 for qemu-trivial@nongnu.org; Wed, 30 Apr 2025 10:35:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-736a72220edso7525680b3a.3
 for <qemu-trivial@nongnu.org>; Wed, 30 Apr 2025 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746023692; x=1746628492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NBgzcavwdDjclrrC+CCUvPhUAmfW5aJ/3QAHhQXFjgU=;
 b=oFN45bhanPLqMW5BtmAKhuUviFO/V1ieumtPjcPUZSGxPQ9PY/ndAhcuMskyPhst68
 EfFr+N9FnQo3LUlqnpZ69YRhfY18rlKPv3jbdzagkeu/9eDZzTwqswRK893c17w3zM+f
 iUvBoy4HBbcR0/ih2nWbT5kdm0ItMJi59mOxg2SVux58We/8aAfNr6ILjN2w8AEXIktd
 wV1hsBmpMkoyp0dL2EG9mlfwllmRvEuEH3jCki2zmDlbrbIYETn3ND351IwTgG1Xhy1u
 thlL/rteDCTsExqn9FjbQ1min2mO6QP0/HGHX8GPFM6KSzL8c/tVTzdBRqeTtWQtVdI7
 ALYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746023692; x=1746628492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NBgzcavwdDjclrrC+CCUvPhUAmfW5aJ/3QAHhQXFjgU=;
 b=JWiZB7Yllibs/8Hzd37tIE/+53dqc4+5E6ab9c6PhRA9GFw+d1oJys0L1ckwpR/TTg
 9V/NJi4hs8M1ImqWetY+JkC093gM+0FxtPvFxXGOgCFcrQuToNi90x9S4XopFmZ9vH1N
 PPLBQ5L6IJ8mAuUm+gL7O8tTGMtqzspYUNkRdUjOtoizyYGzKc1BrYCJbwwPziofJjm1
 mKwjYTJnCrq58rqohAUp7qDjtKb9Zz+OT1GJv3LZqx2vbqz+FA1v77PX49ntFv9S5aoJ
 025WdiL2e4uDzF2rJb10lYEvdZvVxpyNv3c4Bp9UqbVt7icgzqzZFnV0E9U3ur0NEs/D
 SBSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWattmJkQyi5hv5fnF9s7CeRIoD1U6K10mm+pVjuHAhRar0wnpb8VCJIgPNbZy3MCkxXVJt16Ri3fNgizI=@nongnu.org
X-Gm-Message-State: AOJu0YxmXAJ/BncCRvIymERHUvz2JTO7MK1NHI6kMyJNAoHsnxl4J8TN
 BqCLJZvJG4waDBr0hs6NBryAA/G/Vn5lbw/bHA3s1qnskI5TpfIl0CJg+WGC0eM=
X-Gm-Gg: ASbGnctgudsRQD6JeOKxix1YP3Y0K2Y4TZM30IReD30Hg5aE+9wzOuteMHnBsbmccc9
 1doibRXm7/86wz8hKHkNWql0jGvAKAafwp4mjIPRSjIxjI6ad/qajoGk9pFn+HWatOIDVT+uxoI
 fOgrwD1giXgdlN//E3XK/slhCJB6YyPggOrItYV1h3pIUNNni0h/cp98lhkbI9uZZLNXT1FSRpo
 g+8rvx9MKBqizP9TlWsmJ5CQJzMDabH9H1Gw5PwCfyLXhqFFJYNRtYZ8F4CF/SXZStLI45jwbPW
 WNp92olHE5inROMdQrBMspKl49PZed6sfy6Q0fdfkmOqKkooZno/fQ==
X-Google-Smtp-Source: AGHT+IHvBVpRYFKLJXtKnLPwgMRqq9OO1ls+IKJ06waHSKQ4+di0DdW5FEyt9larc0d2mQ3X/ldptQ==
X-Received: by 2002:a05:6a00:139b:b0:736:bfc4:ef2c with SMTP id
 d2e1a72fcca58-74038793f8dmr4830837b3a.0.1746023692235; 
 Wed, 30 Apr 2025 07:34:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f770302csm10850448a12.12.2025.04.30.07.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 07:34:51 -0700 (PDT)
Message-ID: <42a0987f-4f51-4d36-a3f5-1daf267c3e0d@linaro.org>
Date: Wed, 30 Apr 2025 07:34:51 -0700
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <06666850-90a1-4b4a-b454-53df477de215@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Wed, 30 Apr 2025 14:35:03 -0000

On 4/30/25 3:09 AM, Thomas Huth wrote:
> On 28/04/2025 21.35, Pierrick Bouvier wrote:
>> On 3/24/25 10:47 AM, Pierrick Bouvier wrote:
>>> On 3/5/25 13:38, Pierrick Bouvier wrote:
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>     docs/devel/build-environment.rst | 4 ++--
>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/docs/devel/build-environment.rst b/docs/devel/build-
>>>> environment.rst
>>>> index f133ef2e012..661f6ea8504 100644
>>>> --- a/docs/devel/build-environment.rst
>>>> +++ b/docs/devel/build-environment.rst
>>>> @@ -97,11 +97,11 @@ build QEMU in MSYS2 itself.
>>>>     ::
>>>> -    pacman -S wget
>>>> +    pacman -S wget base-devel git
>>>>         wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/
>>>> heads/master/mingw-w64-qemu/PKGBUILD
>>>>         # Some packages may be missing for your environment, installation
>>>> will still
>>>>         # be done though.
>>>> -    makepkg -s PKGBUILD || true
>>>> +    makepkg --syncdeps --nobuild PKGBUILD || true
>>>>     Build on windows-aarch64
>>>>     ++++++++++++++++++++++++
>>>
>>> Gentle ping on this trivial change for doc.
>>>
>>
>> Another gentle ping on this trivial doc change.
> 
> Not really my turf, I don't have much clue about the MSYS2 environment, but
> since there were no objections, I can add it to my next PR.
>

Thank you, that's appreciated.

>    Thomas
> 


