Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pexLM-0005qj-O0
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2023 08:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pexLK-0005qO-Ue
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 08:13:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pexLJ-000172-2K
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 08:13:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e18so5253152wra.9
 for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2023 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679487203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyLOa6yogVL1IKw+smlVp0/gFg552tVUeOx43r9KKi8=;
 b=mYRlL9ER+gx09qhtLxUpEo7BgBlwOls8CbUzZkrmw33s9Gquq3xc+yqzss2Y5e8UK7
 wnBg57+N7s/NGodW8f4jVlQn2d1UO5OgPpbIUpHvurMo2B3Y4H3i2UgYQ8Vd3i69VEqJ
 7ZbBw4ckmVFxTkPn1z6C0bd6K7KQbH7vosYvPMlva9BKb7bmMJTNvtxC2jZSNPJi+kvB
 Uzd/CL95modD5jQgqPFNbVwMgurgBOst0kCPvKD9fF9vlkE8+cGMPojvG6gyJPTAPemF
 CTZYDdqkWaobpRq1plBy+wt3KQSrAZme0+sexZwtWtthXtfytDFP37Dw/NEeiK0RXPkj
 vHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679487203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyLOa6yogVL1IKw+smlVp0/gFg552tVUeOx43r9KKi8=;
 b=Au3T/cAxmx0aVbR0yp602t0ox2oVdNAW5MM7bDD/hvLXrIUeBQMRjf5O7j7vx6bc7t
 z6C4SDQRN2zr60AXytZ4M+51pPIZYySBM5+n9F7f6ZCuRgQSOb/qASTPpfHeNmA4Ixun
 B315hLD9Q0I0sV7ZArrqYcLucsmkVpOUXPPmPC3an3mw1EthTjIbLrpVip9y3ZZ6V0No
 0c9vroJVEZfhZRGkiWlDmHXE6qIGSGsoAlhwh+C9FJq9ItF2RvgTQXKmq1av9bMFyl99
 IvRnDVSfAdCnaHj4vriEqdA2PTPwNedG0CeRwAK2Y+8+mlnTJKNgQO2u1KMA1kFlyZbJ
 n+dg==
X-Gm-Message-State: AO0yUKWz0A1w4Fp0ymhRDnScHnM0msw2hS4n4Qipzup5fZrHgnpu7lLl
 oJaQeR6kGM9hvAbAoOZMp25PUg==
X-Google-Smtp-Source: AK7set/37xHzzgD1qxUpKJrpjeOFQbjCwEiFKdnlrZllqxpWA9g1VIDrvQ52C7aQ5vLGSWhbdka47g==
X-Received: by 2002:a5d:4d48:0:b0:2ce:a9b5:37d4 with SMTP id
 a8-20020a5d4d48000000b002cea9b537d4mr1296488wru.21.1679487203084; 
 Wed, 22 Mar 2023 05:13:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020adffe10000000b002cfe63ded49sm13725350wrr.26.2023.03.22.05.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:13:22 -0700 (PDT)
Message-ID: <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
Date: Wed, 22 Mar 2023 13:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322110521.59949-1-philmd@linaro.org>
 <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 12:13:27 -0000

On 22/3/23 12:30, Thomas Huth wrote:
> On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
>> Include the mingw-w64-x86_64-spice package so SPICE is covered:
>>
>>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc 
>> (Rev10, Built by MSYS2 project) 12.2.0")
>>    ...
>>    Run-time dependency spice-protocol found: YES 0.14.4
>>    Run-time dependency spice-server found: YES 0.15.1
>>
>> In particular this would have helped catching the build issue
>> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
> 
> Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
> patch here likely would not have prevented the merging of this bug... 
> for that, you rather have to add it to .gitlab-ci.d/windows.yml instead.

It seems we have 2 jobs doing the same testing (even same version,
msys2-base-x86_64-20220603.sfx.exe). Does it make sense to maintain
both? At least with GitLab we notice a failure.

