Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCmwU-0003is-Vp
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 18:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uCmwT-0003iW-PF
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 18:08:41 -0400
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uCmwO-0004lt-EO
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 18:08:37 -0400
Received: by mail-oa1-x42.google.com with SMTP id
 586e51a60fabf-2d060c62b61so488382fac.0
 for <qemu-trivial@nongnu.org>; Wed, 07 May 2025 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746655714; x=1747260514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C+TNR4R0QYLHFvrLzgiyHvbkryKHrE3SzQpDJQc54JM=;
 b=XSZKVgeB+ry/lKFFlBJ0r0pZA0ij3DuvvpLHXtbfkKG/lx+wAcazdJnlT+HzhNjH3S
 OFl6HO0NCyb4dv/HgW8A9v25inQG1IE9GfRUD1D/lo9MzfRXTm0BjmEcFHV6YCvVUZi7
 HvQhKjeUjqFhKmWwovbGTuWqpRt40HQ0x3gSl2msorVfXaG+hnwq2nIy6LvNQ5Mouuiq
 lfXX1hJHKLzs5K+0inCWKnZx3deOY/pjM0F2L/xDD83Y079nDQ/a2UCdY6HlQ/zC8Ios
 tzH7vkk19XOq9VgEj6QEO/FwQXbwMkyKxykrM7rJIR7RBwxV7Q18E7HBNZ4R63BPZSt7
 lnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746655714; x=1747260514;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C+TNR4R0QYLHFvrLzgiyHvbkryKHrE3SzQpDJQc54JM=;
 b=b/QoD8uaOznBHxYmlLJoC8/lHieRrruMOsC7vXxW8Ow0RGPjTsn0hMV+w2/IWzv7di
 IopXrhsSRsPBC4PH9dwUA59ZRbzj19G4+ok5h4M6cd4ryCpXHOPtEy7CJqlDMY5K+aCe
 Dk381onFOEOzyCcSkeRZQIagXkDD3trBj6IOl2ePmcavOffPbSbPhuaMitblC14ujcMY
 JOY/P8UNr+co9k+5i9ak9SA3WAJurDwoQXtNAZsX273Z9EbKm9okjwPrJBHVcs1Lvvra
 SPN0hbLT9H8pJKiXvB4refwOyp+yl+XZ3bNJfObJJFUDlBsSR6ZwgHHnEBh7YsPyu7Mb
 P2Kw==
X-Gm-Message-State: AOJu0YwXIHhiw1yledAbS+a12hHGZWzshtvM0h1cEJYLQPEokZs9HQSl
 9+dYyDny0mNr6AZ9fcHS7flhs162Wc7vfXeA/y2qRWEgJA+8uOtyWClBf4dKP8c=
X-Gm-Gg: ASbGnctieFLzdJGotC8mMDbpTdgkdn3Ua1aTf5/Vccj0qLdSeUU6uiIwnkqlZ/i0a7h
 l3IkX7ZyV1naxmvkNHY6rN+XaHxkZQwzoPmYO8Y1oannuGuiV30LMSxKYSc8acA8L5VeeQ5VjkC
 SXt+AV9wJhL1gbTSpzq2IHLrc64lEPfyxDKPiQy6wItfLSsTJr9evqz47CBUNp+U2/z16jHBRkD
 84Cpvnb6tYoQ3SM2LoNqdKkjPEjMFOogRW82QxwWzvjgydvUtiEh9qZpGaw6ZpLS9/8///xquUl
 C/81j8PoHLnIUiMXUjfqvYtHfe9BQIHSUiTxJAGg1dASnjBO13tAOFtQfhSsQLl8usDYcncpwiJ
 CfHheX3lg4JO5xfIwVOE=
X-Google-Smtp-Source: AGHT+IGrLnjBHEaqSwCsHbcvPP76FCKC0k7282ar74QUv/UxBDlKMkkW5+TLUp28omHjS5BCIqViMg==
X-Received: by 2002:a05:6870:898a:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2db5c089db3mr3279004fac.25.1746655714443; 
 Wed, 07 May 2025 15:08:34 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:e0a0:55fe:c223:5f69?
 ([2804:7f0:b400:8604:e0a0:55fe:c223:5f69])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2db5cd8ee8csm942706fac.25.2025.05.07.15.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 15:08:33 -0700 (PDT)
Message-ID: <7379dfef-01c8-4625-841f-dd1344e386a4@linaro.org>
Date: Wed, 7 May 2025 19:08:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix typo in comments
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
References: <20250507204626.139507-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250507204626.139507-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::42;
 envelope-from=gustavo.romero@linaro.org; helo=mail-oa1-x42.google.com
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
X-List-Received-Date: Wed, 07 May 2025 22:08:42 -0000

Michael fixed all these typos a couple of hours ago [0], so this series
can be ignored. Thanks.


Cheers,
Gustavo

[0] https://lists.nongnu.org/archive/html/qemu-trivial/2025-05/msg00022.html

On 5/7/25 17:46, Gustavo Romero wrote:
> Nothing exciting in this series, just typo fixes in comments.
> 
> 
> Cheers,
> Gustavo
> 
> Gustavo Romero (3):
>    linux-user: Fix typo in comment
>    Fix typo in comments
>    Fix typo in comments
> 
>   block.c                             | 4 ++--
>   hw/display/apple-gfx.m              | 2 +-
>   hw/xen/xen-hvm-common.c             | 2 +-
>   include/exec/cpu-common.h           | 2 +-
>   include/hw/xen/interface/io/blkif.h | 2 +-
>   linux-user/mmap.c                   | 2 +-
>   qapi/machine-target.json            | 2 +-
>   qapi/qom.json                       | 2 +-
>   8 files changed, 9 insertions(+), 9 deletions(-)
> 


