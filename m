Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLCa-0006Rr-9D
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLCZ-0006Pz-20
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:42:31 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLCX-0001MX-KF
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:42:30 -0400
Received: by mail-pl1-x641.google.com with SMTP id m16so5844987pls.5
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oNRvZqnotmfgiTQwVx2eaB/jGXOxlLMDWnznhPdG1TY=;
 b=Nc/y1LmQFgjqwIiY2bki5oWcFn9odzLaLc2QL4xfGEKMMxAE9DcGYTDm5FM/QW49kg
 Fc8gr0r4rfwtloOZ/nq6ZFTh0bx3N1H30L3dVf0m1JMKoO9I9LD6Kz84mG4hcoPAW1ie
 8kPB4/wrYv0111jIhPIMEmhm3npC+C9nKxYT81twjQbxp+T8ML4ePB73OqpS9a6qJIG+
 ySDtEEtVcyQwDQy8rooTuUdH63mGWiLpsfRmagCDE5KNOt6jes7F2TtEdOEOJ+UGHJw2
 5H3JQLZBsGbmrJWKQ5oF/4AWqJa+Z8vI86yMehBc+kB8vea+K7fU2AsTFxBjGhLtfmoU
 Yakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNRvZqnotmfgiTQwVx2eaB/jGXOxlLMDWnznhPdG1TY=;
 b=kJuY9DRQgkwikfHgbe6uLF0fEZtUWm2wUNIEzKrv08LGy/BuRASJe1nQwc8z7hCFiE
 2OhTHt508diBCFjAfV/nYpzpiRYqwKWjAKMI5QBsBnJCU/J2HmAp4gctaUw0dyvDc57C
 bJfumzYC8m+FtYtDvd99rv6kl06+ePnizxhdK8V5HATOMyRq/4yFCkyfFbE5EYCB55ys
 Pnkp71GMrCYGDD2OcPasfFg0mpnoaLJnlQrv2x118AS9KjmtKHUomsu6/Hk/6SZxLugu
 SGBWah9kYG572fzvsRakph1qUolpygqwo4l0tGruS6yQi2g94Vhv4gcARq/ycKyYbi2v
 rHnA==
X-Gm-Message-State: AOAM532aP/Bqo4BT/il+i7K+1IELkwVT9OfQkDATnL1BIP7mNj3wEeoW
 lmEYrxvgiOKT5aCoYcXJuL60EyjHDdI=
X-Google-Smtp-Source: ABdhPJxk1GqHvL9SiCzGxjzQHQxEmIgSEH7Gp4kownvzdR5kOnyP+mK0ZdfBTlXQov39bgnYOosCPQ==
X-Received: by 2002:a17:90a:1fcb:: with SMTP id z11mr637498pjz.1.1594734147790; 
 Tue, 14 Jul 2020 06:42:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z62sm16846063pfb.47.2020.07.14.06.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:42:26 -0700 (PDT)
Subject: Re: [PATCH] scsi: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600425-22997-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b349c14d-f4f2-8653-6b3f-51754c7bc35f@linaro.org>
Date: Tue, 14 Jul 2020 06:42:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600425-22997-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Tue, 14 Jul 2020 13:42:31 -0000

On 7/12/20 5:33 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  scsi/utils.c | 4 ----
>  1 file changed, 4 deletions(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

