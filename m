Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLJc-0003ro-8P
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLJa-0003oJ-Gd
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:49:46 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLJZ-0002MJ-2W
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:49:46 -0400
Received: by mail-pg1-x543.google.com with SMTP id e8so7618954pgc.5
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i8LWR1pvbpANLnx8fLYmjiZmvBs5RouawXyYu7q2q9E=;
 b=fOFoFsfe/w0DrH2vLbtxrGx+B9slqYdJwDz95L5Josau+MDGYuRTH89ggw4ydRp5nK
 it5zM/dKmCX1q8mnf5JdaQCrqXtfTmXUE2Po2umDkVLBIqc7+BUO622x13aj3WjKb2GM
 xpcI8rHQAmeWrGgYetxzZqO2Zn2mbrPcp77ScIgsdU/AHuPepGd5is1BL46eYrq3Rabp
 8TKdSSm8oitdG0tENtdtBraB9mdy2MGIqMrBgD0X4+K1tbMtFY1pC5TpcMAKTtpwvhPS
 qGMXhOtyRLOsAjI2KsC6Chk2m9Xfxy2teKe1W2rckFI+1XE6rvg6pEEeshdj0KwJzZdm
 5UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i8LWR1pvbpANLnx8fLYmjiZmvBs5RouawXyYu7q2q9E=;
 b=dKM+x/+Tzf/VTg5UwBOqmbFL+vbeCd/4sA1QyGPygIBXi6YCsJppPrmYA+vDl7B7g2
 sP4RhERHIWP1MTHcF39ZmEmeOXzJ/mLwfQIUolT8R6QZOLYUzV01BvaFgTjx/tVCZ2ub
 t+vcprSGNjI3DWVbkMKnWB9Cy/V7aiDUNsn35n6QckYyV0ISim1ugDlUgH8MnTJBC8TC
 6ZsIEtLo/6wDADPNkV/BQPBBZPrAAzbEID3WwNd1XAgYr9+Lowyl+ah23ji8fwXUhHeN
 XvExXv2+0DA9tZNqkHSEzRbyFaU/HqZLnRGCiIWiozW0n/vBRjQ+ylS3p1xnJwyeA8bY
 61WQ==
X-Gm-Message-State: AOAM531woX3rnUye5JgtBq5LLPbv978cOdY2uoUQx2DeVEQwtnv7PXyF
 TQNlK2zRkaBHMW3oXlwLHBo8l8eNK1o=
X-Google-Smtp-Source: ABdhPJywDEOebyPOCQjUjeDOJr/hMoJiE5sClxVBpvn2dQqTP6QYTtJvtNlstBgO3Y1drHu0eALUFA==
X-Received: by 2002:a05:6a00:5c:: with SMTP id
 i28mr4528807pfk.274.1594734583415; 
 Tue, 14 Jul 2020 06:49:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s89sm2800115pjj.28.2020.07.14.06.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:49:42 -0700 (PDT)
Subject: Re: [PATCH] block/vmdk: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600440-23217-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2de80c9-7b18-cf1a-6526-490bf595261d@linaro.org>
Date: Tue, 14 Jul 2020 06:49:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600440-23217-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jul 2020 13:49:46 -0000

On 7/12/20 5:34 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  block/vmdk.c | 3 ---
>  1 file changed, 3 deletions(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

