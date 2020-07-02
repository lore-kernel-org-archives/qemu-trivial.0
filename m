Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr3hc-00071G-GO
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 14:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3hb-00070K-Vf
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:12:51 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3ha-0006ZV-1x
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:12:51 -0400
Received: by mail-pf1-x443.google.com with SMTP id q17so12862446pfu.8
 for <qemu-trivial@nongnu.org>; Thu, 02 Jul 2020 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=52SjRpelGDDZQz+t//MCqquF09vSsud6vEySKialctw=;
 b=Nr8KaqPgERw/vNWZbbe9qxT4T1QunDqtLc6tlE/gJBGahjHpWqMPm39FWrwK5o4ZX6
 OOqLDcJiuxG+zPSqoqwENNaNS2zD89GJZ0Ykz86BoX6Th0jZYwWPe7aLYyBDl+rhw+/J
 BY8Tn1PCFv6jd7Vca8YGEbs1wM9vvk2pUaPUZo9RsjPOABfhMEYJgdWUDM7Wr2M/UUj9
 wROfPXHttOVWPFMj1hCQxhr/FNZ7Vy4yxzugxMHTXun5zwA0NdcIrn3vdrKqkTjoH9BW
 O+H9qBmbyOv2u6s8E7ZOBlGHFmEyaV9BidgpnhO7FCeL2rY37oqhprkvhLckXL/0VBrw
 ZHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=52SjRpelGDDZQz+t//MCqquF09vSsud6vEySKialctw=;
 b=AMZG2u6WIEs+tHxZ9XHVv/IBNSjcActp/IcmbXkxz3nCu4qy7L2koUQp90+c7wgksH
 PgRVmgSrpIt8DztbET19EaLhrTspHkQEAThQLup5xArY/TJBao5HMsGmh0VYayg+z6oz
 ZFukrSWC7gLeEt6jjEhudwfQYfdvLSqZsNtZ50Jwm+24cjBwnkfIKu2Zur58zyjiAMMN
 PLVRzwpDXIabkFtSUxZkYZXy+D0AWfWIGqITY1izEPYPgT6ijzArUoxp0y7bdS5XfBHl
 FFOeDtDvZE0C5XOpNL4X3Qmx27I0L0xhA7Cw8t9uz3O4b8QTHQEH5p/8reJbWAkAvm4X
 M2wg==
X-Gm-Message-State: AOAM530Hpb909DoJBOKFEDeF+ADqaPwlVCoQm0Po0834EZUgLaaYPp/f
 4XV3t09MjqB055SWE2JiuPFY7Q==
X-Google-Smtp-Source: ABdhPJyasbKQat8LmyNeONfDOvDwCxj2fDsPpvSVFWxC9DvCQa5xf3349F5X1X/6oe5arJIwsTPuxQ==
X-Received: by 2002:a63:2241:: with SMTP id t1mr25233366pgm.440.1593713568323; 
 Thu, 02 Jul 2020 11:12:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a17sm8386940pjh.31.2020.07.02.11.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 11:12:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/nios2: add DISAS_NORETURN case for nothing
 more to generate
To: Wentong Wu <wentong.wu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marex@denx.de, crwulff@gmail.com,
 peter.maydell@linaro.org
References: <20200629160535.3910-1-wentong.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a87dfee-add3-dda0-829b-87d97a4c3bdd@linaro.org>
Date: Thu, 2 Jul 2020 11:12:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629160535.3910-1-wentong.wu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 18:12:52 -0000

On 6/29/20 9:05 AM, Wentong Wu wrote:
> Add DISAS_NORETURN case for nothing more to generate because at runtime
> execution will never return from some helper call. And at the same time
> replace DISAS_UPDATE in t_gen_helper_raise_exception and gen_exception
> with the newly added DISAS_NORETURN.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  target/nios2/translate.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

