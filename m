Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCmFi-0004Yx-6Q
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 17:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCmFg-0004YZ-9u
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 17:24:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCmFa-0007rN-PS
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 17:24:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-227d6b530d8so3821585ad.3
 for <qemu-trivial@nongnu.org>; Wed, 07 May 2025 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746653060; x=1747257860; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W9wSbNtcYIATn3/CCIOmNLAP+ZutI6QPzA05RlF2E58=;
 b=eInO1H8xZjbC9ju+Ljdb8gD+yR735FAOGwbB0CIqJQd9C96riOwwJH5jj1wFOIpEj8
 mRbqg/mFTQzxJrPYuJm8JdrLiP70s8nawwA6k83nOztS20pf8IAlYhK+yWfkdAN4n2gL
 PZ0uS2m3e+qqImWGq66w/HvUqadZHKSweMaculYEiZDOd24F/3zN/eru8z45cse7u4if
 MQDNE/uEKGY2kXfR1FaCKvZTczvdafGp/URrsSSFZwnOqfTImb+XX23IQBTUZliiy+L/
 gTPgQRmU0wCoXw365FZ3pi15KdW+DP/SBbs1M+lpzv25Ih816baAqhwRGOqqTMoHcfnY
 b9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746653060; x=1747257860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W9wSbNtcYIATn3/CCIOmNLAP+ZutI6QPzA05RlF2E58=;
 b=YtAy0V8kGlAv1o9L9RjaB8qbmDanFMYzM9K6INruXBGAbrXFfcHRftZi1npZl0IiGR
 qydvIt8A/7L/yPuj7iEd1cJC2Y8qLlkmOP7WGpShtt5q4bQqliPBIQX13nUJ2DfqMGAx
 09ZIk0NUaAO2QUrD474L9SkO8i7JtwypOXWBLgMSoEU0HoE7e205ZJjV5KDPnNOiare5
 hXW0Okg1gMd8tgie5/BhUjqiaQQiD5JZrExZjx/TVXdb2yKowvGnum7z61FR9ffXFwYF
 zdcqOO/JwyJ7xzMP9ztCSCi9iWpXQAd7fyzNIe1J7n/fpo4xWR6YySQ3ME7f7MpS8mIO
 +Nhw==
X-Gm-Message-State: AOJu0YxaOesgQxc5k9XBRyUw4PEunMykm+7py85bgzJyu/R+quzPGePn
 3Zbpm7jWZTUA3NEn76z7u/FtJhEZwDeNhNThUDPEOos7n1r/t1N3WpsU3MXYJjM=
X-Gm-Gg: ASbGnctj1hz2DAxwPrzNyOXZHf1P31/4fvj8eKUWiRR8uGOsU7R7tp1M0jAVsjeU5P0
 6062UOCy/88qRdFwbOHJe0TrOE9mmXBGNYwK/kntRPhcpcr5Eidc3rpBr424l78HHs1ekDVu1IW
 Oq+1SnbNyJ02bhCAgtANJU3+0rsVfGthY5iK2jEb+KVOF2fwu9MDnNyvcpof5ijiuCBmBJtLKuT
 UkrS6n1q6cpwS6uX/xNsfuh/JAoolEvwhh1xFPi0xUu2NFzI2L5/NHsHH7SWRfjrMJTwWG9d59j
 lwfmG4UJovfRQLBY1evEFNI3WMaUIGaZjEdI8u5jbprZGkpwBgN404BR7KbH2YdPIZgaOTyaj5f
 sPNVJtbRD
X-Google-Smtp-Source: AGHT+IG9OQYyismC+aPpyYezSYCrHN9IBBy4qVV/tHH2qSvwJsqlgCVSU/dfUo7PBK9S+6t5GbFuAg==
X-Received: by 2002:a17:90b:4c4f:b0:30a:3dde:6af4 with SMTP id
 98e67ed59e1d1-30aac29c154mr6321209a91.31.1746653060386; 
 Wed, 07 May 2025 14:24:20 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4ffb545sm781114a91.45.2025.05.07.14.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 14:24:19 -0700 (PDT)
Message-ID: <e91774b1-b950-4930-9b85-1fe52b1b6cd8@linaro.org>
Date: Wed, 7 May 2025 23:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] linux-user: Fix typo in comment
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
References: <20250507204626.139507-1-gustavo.romero@linaro.org>
 <20250507204626.139507-2-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250507204626.139507-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 07 May 2025 21:24:28 -0000

On 7/5/25 22:46, Gustavo Romero wrote:
> Fix the duplicate "of" preposition in a comment.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


