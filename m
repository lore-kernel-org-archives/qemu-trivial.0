Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi72B-00061M-Ei
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi726-0005uN-Rd
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:33:50 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi71z-00069m-EE
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:33:48 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id s9so1383617qvk.12
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4XgbTWcu8tV3eWnpSGX2UU7M18TFEwpLwmaorcMMMGM=;
 b=Ay9TWLXRGyVlWKM8TvNjp4uhBffAAvSXYHHzPW2z/r2qKA79IIKG7a8SSNJHn0tWOb
 HDnrT482UME/IBqfv8mlLzedeSvP9dExwvYaKHnmsxJvVAAM+r1Ui+gS0l3a6rPNWtaC
 KSCwyGz1hcvcWg4MblQcWCwFFg2swTduCKWQoGUWd2sKbPyrnWYt+jdZjbOrWpJHf9UJ
 KSN7QY6ZU6/Zb290jovM0x4VENA97ZLzN+2cJiaaK0L+aDEwMfnKVI+gU+LhPfq6MirL
 MR6fUmdoQDo/rfn9RSs5bv6mXKiLFcy44I6NhK6br3bqANprurGPyw1XycEBXq2XfvVi
 nCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4XgbTWcu8tV3eWnpSGX2UU7M18TFEwpLwmaorcMMMGM=;
 b=Ctj/GQPjoemi2S6BLoyUit2kLRjEKh/4u6Dn5KUFZLmJ67xnlOlK/eiyLpl1QBYGJt
 k+cC5RFBgdCV3uXCBVJknEq3VHW5x1bjl1pn7+671+I7mUoqjcAnDpzDfUJRxnngSfsc
 UseDIbyYMOfmPUC5LQae2KIeIPrWmLuGH06Ku5CVq0B0M83f6YBgBYj+1rBzXe3DM1ue
 UP/C3q9l/SA7cUxGeZnev0fWiWG3NhwYP8VbCxUirGLUHVH6Dsgpy42auWe0jGMrzJjB
 cv/P9NsyBZcUR5Y0sVerGtweFdB6TEnVm0V+DlO5NIEspMJMWhW110eifssCqTsrXuJV
 Sc3A==
X-Gm-Message-State: AOAM530xApIj8EZnf8/zxQOZlRZWcLG05HIcFGA0UkYh0WufOUoXJtGz
 Z1ZdkclMjVVejU7DNByhNaJRNA==
X-Google-Smtp-Source: ABdhPJyUUKAFXguSNY3l+ZBFYI9A1khdeVFpmNtDNso4V+sKyOmjy1Y9zaKMganXs5opYsqutn/LuQ==
X-Received: by 2002:a05:6214:5195:: with SMTP id
 kl21mr13820775qvb.42.1635910422406; 
 Tue, 02 Nov 2021 20:33:42 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h17sm714301qtx.64.2021.11.02.20.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:33:42 -0700 (PDT)
Subject: Re: [PATCH v2 20/30] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <268e46e1-3023-7214-abc3-46bb3d195152@linaro.org>
Date: Tue, 2 Nov 2021 23:33:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Nov 2021 03:33:51 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

