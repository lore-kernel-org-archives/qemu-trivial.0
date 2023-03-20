Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peHwR-0000M0-LO
	for mharc-qemu-trivial@gnu.org; Mon, 20 Mar 2023 12:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHwQ-0000LY-N0
 for qemu-trivial@nongnu.org; Mon, 20 Mar 2023 12:00:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHwO-0008Qf-3j
 for qemu-trivial@nongnu.org; Mon, 20 Mar 2023 12:00:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id l12so10852683wrm.10
 for <qemu-trivial@nongnu.org>; Mon, 20 Mar 2023 09:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679328054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zIOz46OTW9kT5cLvOFiHzM8Jk5IDc5NLDdQjY+d2pg8=;
 b=M7gnBPJ4hGDOUN7418SuBoZMtgzKalxwKzWE9UXMpHKCb4V/0pWah/A5qXe7elgIqa
 L5hW7dJHtA4Wt4MX4j5pJSS2qWnntuTFzMGKQ85W6mAHvoLgikH1wu3W8G3EG8mRe1Uh
 7xsz/db/8asZYYFspyXQE1JxviS1z3VS+OqdwIaBkU39hyuZZO5OxkPkD85GAfEZP8c4
 elF7EYwQaykdMER36bSam9xGJXxEsE5LxA0n7adsUXZBdOBoxdalAG9lPvE/lQcL1/NC
 +elCMXcDAWrnKLz5F1rOCfu5A7JCAm0pQiSrRGv48ka2vUcp8l/eymHR900Twpa/b8CG
 Uo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIOz46OTW9kT5cLvOFiHzM8Jk5IDc5NLDdQjY+d2pg8=;
 b=39aDXvsUSaQjMH4cHl46sgwwBfEgaluVfBjFKLqr2Hvn8HL8uBVz3a6qkTtMo5Co8j
 6tYe1OEyGwiNt+Kusrjuk81V0/YhgEzOrSDIvzREjIeiVeUDroqwQZx3QqLA2MU6vevr
 2FHMytDF0hG//CbNomygJByo27ghKVfgWQ9UOCjwkLJ5PTDA3z0PC/XLK20ppmxS6zNX
 GC+Yl5Ph6zsQpQfgjlyNzVxioRpq4G6ZqOjpy/qdY7uLpb2ndu4buKOdqdf1pZODZEQB
 ky3ed3UxNKUE7g9tUODOriMBQjHGlxDLGEYuNMIXiB/p2VCWjqZ8gq2Ocpa151g5nXap
 IRow==
X-Gm-Message-State: AO0yUKXAlHSawD39FX48vnYyD11A7gsIufEJD5Ehl6Bn7qM5EYpW+aYU
 oTp9fDCw5weqUuh8WN1S91zFQRw6FiAo3j4nI9+0dg==
X-Google-Smtp-Source: AK7set8e3P0Jwsm6eVPNI3ygYpZuYX4Df4Vq1EgAAS5ltvhHOnvobyz2s0aCs7SsPSs0GKjPqxibQw==
X-Received: by 2002:a5d:40c4:0:b0:2cf:ecd0:d1ab with SMTP id
 b4-20020a5d40c4000000b002cfecd0d1abmr13472702wrq.49.1679328054471; 
 Mon, 20 Mar 2023 09:00:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6e12000000b002c70851bfcasm9235065wrz.28.2023.03.20.09.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:00:53 -0700 (PDT)
Message-ID: <68e849c7-e945-5330-20b2-840f002de2c0@linaro.org>
Date: Mon, 20 Mar 2023 17:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.1] block/dmg: Declare a type definition for DMG
 uncompress function
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230320152610.32052-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320152610.32052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 20 Mar 2023 16:00:59 -0000

On 20/3/23 16:26, Philippe Mathieu-Daudé wrote:
> Introduce the BdrvDmgUncompressFunc type defintion. To emphasis

Typo "definition".

> dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
> declare them using this new typedef.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   block/dmg.h | 8 ++++----
>   block/dmg.c | 7 ++-----
>   2 files changed, 6 insertions(+), 9 deletions(-)


