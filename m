Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mXZZG-0003es-7o
	for mharc-qemu-trivial@gnu.org; Mon, 04 Oct 2021 21:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZZF-0003dZ-FW
 for qemu-trivial@nongnu.org; Mon, 04 Oct 2021 21:48:29 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZZD-00040N-V3
 for qemu-trivial@nongnu.org; Mon, 04 Oct 2021 21:48:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id q201so5655398pgq.12
 for <qemu-trivial@nongnu.org>; Mon, 04 Oct 2021 18:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulxpuwtg7S+C2HYzsN5YBmJIdMl/oBEWgKD5UnBaibg=;
 b=OX7xfJS+1beqMu6vdvjpYDMwMPFQ+TRL2kNlRpvPOgzh2ew+ib8X8pH3EJgNbthv0x
 G5KvnsEaS3jPXaCPyidzhtJataMSD/fQhkJvR8SS4VNwEffvf0A2ed3gO8X627JeY9/h
 xbMl5M8p3R0UZvpmhjKAXiwV/metgdqAHLCitbqA8Eg7ZHTiSt5dthsLI3ac8AF0ftot
 ILJ5++zEoLDwHeIGQGjKQW5yLWmrlNLGbfJasTCjQhvYzjRmRk8iZMmwtPGhSTNNFdqX
 MpZ5eWhv3dvS+2+fN/otDCQPV+Qm+MIucE4TTCuqB6npCvILjxDQAum3bhPTRK1McJuC
 ELcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulxpuwtg7S+C2HYzsN5YBmJIdMl/oBEWgKD5UnBaibg=;
 b=OOlY+6KjcIUxs2iv5bJcwyPzifK/injVzEbQFB4dE2aJ2DrVaOtBe/gPVuizSp8vvl
 5YprTWCcm+lbnYsrP0MRsf4bKpnq5hBIENH3nsvwZlUxPA1ysBj+cpagqV+g0haoz2cz
 V7DL0sSFKdXPNBL7ZUNIhOTwlvRMRe4upXwRTV1tdCrXh3+OWGg8c2XDWIsrZPhbbqWH
 jJSGw/cbFSRQsYTvVKjRab7cEwCNEH7FiQct8K9l9RkhRdcclsy6bX9SV8i2o6iENf28
 b0KGDdBPkvRB2CrlD8T+7Ry6w9PvMGddpEoKg90uhGsUhtutL+eqElFypl7EFXqMaqAd
 6KKw==
X-Gm-Message-State: AOAM533KbxfX+dD+hsYfw+j10q0I295UNxdQS0r/rHrTVouM9r4F7Uw9
 uULUeWxh5a3bBtpBXIrzyb+OM591OOASww==
X-Google-Smtp-Source: ABdhPJxJSPihhh2Gi/R8+4oIX4dKSr+MPAOstFA48JQNe01bfiZSz3++aCifYAhgq+YZtgg3aiBLhQ==
X-Received: by 2002:a63:cc08:: with SMTP id x8mr13587565pgf.166.1633398505129; 
 Mon, 04 Oct 2021 18:48:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b21sm16850451pfv.96.2021.10.04.18.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 18:48:24 -0700 (PDT)
Subject: Re: [PULL 0/5] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20211004083055.3288583-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <707091a0-ea3f-2c8f-b061-e636820aa3c5@linaro.org>
Date: Mon, 4 Oct 2021 18:48:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Oct 2021 01:48:29 -0000

On 10/4/21 1:30 AM, Laurent Vivier wrote:
> The following changes since commit 30bd1db58b09c12b68c35f041f919014b885482d:
> 
>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-10-03 08:45:19 -0400)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to daf0db06308b55c518312abc39a4bf74413ac007:
> 
>    hw/remote/proxy: Categorize Wireless devices as 'Network' ones (2021-10-04 09:47:26 +0200)
> 
> ----------------------------------------------------------------
> Pull request trivial-patches 2021104

Applied, thanks.

r~

