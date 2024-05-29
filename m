Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCL6L-0000Vi-Sw
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 11:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sCL6K-0000S6-0U
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 11:20:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sCL6F-0001TA-ET
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 11:20:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2bfdae7997aso1891897a91.2
 for <qemu-trivial@nongnu.org>; Wed, 29 May 2024 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716996021; x=1717600821; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hb+RAronmVWcQOHs+i7Y4Kg1cIIZ8hlMnnhzrGnzp0o=;
 b=HqNjQNV7zd3O8otK/MPCNwQuCh/t1U+qet+UZo55pYILoFrFY/K9n/OnZ/AB5iyCLa
 AkAoFAZjglzdxQzdc8uNdPutu6ucpwEW6Tscpc6CqHUfOf8MEUfMqSk2hgrY9hTfU5br
 ropNh0EiLs7l1vgOCCN6eBk8yWmd85IX5uGYQdDxC+iSBQA/EYpcjUsuT4ur7QIdHtrm
 /vXvhqJsG6uL+syUTlnqhJLy9A+Tt7dbd0OCi/zgnfCFYsMlao8e/lPt8gIlzMUQKKTc
 1+fEL+cfo0P6Hr/YEq9g535EcziThpgdoJj0u5dD8VuA/lz/Oh9CSjlbaPMAWOxv/tqc
 Hmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716996021; x=1717600821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hb+RAronmVWcQOHs+i7Y4Kg1cIIZ8hlMnnhzrGnzp0o=;
 b=lVixkSuQQ5djwpHGLtW6yvCUDohIroE8nt5Dlbjy8lHjVVXqkYUluh6V0zNHE8rzWC
 1NFK7C/IvtDotlstlrZxHBRsJa+7Mt42Fu7em70JEFRTMd9AsTsmMEldhmZN/5pkwaNS
 rMxyimBJpz9reAlVDHn21LclNZY2b04lQLVr7LEzp9o2tdp/LI1lsPkrILT0n6c/Le+e
 pRSMPiV1UT7kE9plmC48VQGp9Coi/9dc/nl+4LwQp1tyF6wKrQqIe03RtWY1+8TKDFHP
 Q6xcVpCpG0HqsP9P9GDOxxrq8W9p8kFr7N/Cjbn7a7AK9RG3SbA/i1ateK5nfUdMzg0n
 NbEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrkyivwwy13enHpBOt55x8u+rFjaHlOiJJc4lHJ6gRbwOOFaTGSfxUeH49ylc+5n5t0txfqwpEfnsrN5YVjwJUX2Fi2KFlZg==
X-Gm-Message-State: AOJu0YzWBNfLQNLHY61MQC9tGxbrWQIUqfZVfzW+EJzicEyziYKkPfsx
 ifhSi0GXk9ZgHOkVAUgjRHp4XoVjb7XdlkjUszayy8ngd3DvcNsOKbQFwsmmr/w=
X-Google-Smtp-Source: AGHT+IG+xBlpQQoJVHp7DgsksS2dwHwcRK6COCtBb3E5RC/9kxKryFQa1je6ePcemXxcFgAaVMfpDw==
X-Received: by 2002:a17:90a:ea05:b0:2b6:226a:c910 with SMTP id
 98e67ed59e1d1-2bf5f518656mr14591483a91.36.1716996019045; 
 Wed, 29 May 2024 08:20:19 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bdd9f4dffcsm11613007a91.38.2024.05.29.08.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 08:20:18 -0700 (PDT)
Message-ID: <0ded3230-3b56-45ed-afe7-a4bd7d99dc76@linaro.org>
Date: Wed, 29 May 2024 08:20:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-user: Add ioctl for BLKBSZSET
To: Michael Vogt <michael.vogt@gmail.com>, qemu-devel@nongnu.org
Cc: Michael Vogt <mvogt@redhat.com>, qemu-trivial@nongnu.org
References: <20240423152438.19841-2-mvogt@redhat.com>
 <CAPOxN2FyxFp+BJzgFa=EkxDkrctBg5TZWWW1x7r0tKONLHJ7Jg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAPOxN2FyxFp+BJzgFa=EkxDkrctBg5TZWWW1x7r0tKONLHJ7Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 29 May 2024 15:20:28 -0000

On 5/29/24 00:56, Michael Vogt wrote:
> Friendly ping
> 
> I tested the patch as part of cross architecture build (using qemu-user) with 
> bootc-image-builder in https://github.com/osbuild/bootc-image-builder/pull/342 
> <https://github.com/osbuild/bootc-image-builder/pull/342> (not sure that is relevant, but 
> I wanted to mention that it is working for my test-case).
> 
> On Tue, Apr 23, 2024 at 5:25 PM Michael Vogt <michael.vogt@gmail.com 
> <mailto:michael.vogt@gmail.com>> wrote:
> 
>     Tiny patch to add the ioctl wrapper definition for BLKBSZSET.
> 
>     Signed-off-by: Michael Vogt <mvogt@redhat.com <mailto:mvogt@redhat.com>>
>     ---
>       linux-user/ioctls.h | 1 +
>       1 file changed, 1 insertion(+)
> 
>     diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
>     index d508d0c04a..3b41128fd7 100644
>     --- a/linux-user/ioctls.h
>     +++ b/linux-user/ioctls.h
>     @@ -102,6 +102,7 @@
>            IOCTL(BLKRAGET, IOC_R, MK_PTR(TYPE_LONG))
>            IOCTL(BLKSSZGET, IOC_R, MK_PTR(TYPE_INT))
>            IOCTL(BLKBSZGET, IOC_R, MK_PTR(TYPE_INT))
>     +     IOCTL(BLKBSZSET, IOC_W, MK_PTR(TYPE_INT))
>            IOCTL_SPECIAL(BLKPG, IOC_W, do_ioctl_blkpg,
>                          MK_PTR(MK_STRUCT(STRUCT_blkpg_ioctl_arg)))
> 
>     -- 
>     2.43.0
> 

Queued, thanks.


r~

