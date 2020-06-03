Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgWTP-0001o6-0Y
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 12:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgWTL-0001mb-I5
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:42:35 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgWTK-000274-46
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:42:35 -0400
Received: by mail-pf1-x444.google.com with SMTP id h185so1974681pfg.2
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2020 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yf+FwYGZzrj2oDOkOcE87gRGAj9CGikroKUdlU8+o9Y=;
 b=DXOpSbgT3PbtgBP5CyPrRE4ciMi1M0Izm5mwPLVy6CgVdaXQPO0VDd4t02f7M9JxvZ
 TiqdcO+4H5GprbdWxpB32t6FHpE3zWf4a9JFmpkFa6eNiI3w6KE8BXEEPfH9+Ob2QVgB
 an3n1mpsOlpnmMoi/geTc+1oDHbgtCn5TjKUrgnq4FAAEF3lGWn/ELuzcGFoFlPwUk7m
 WPNYNuz94GbtY0q9IM/xbc4ZkN22r965Zll4f+e3akarfAag4LaC8rjRINfRHg9QKIwE
 p54zHKGA2avqyDP7ma9DNmwe7mwH3uB867W9+J2k+vrgQEikDtpUbDXsJfHZC1umzHai
 Y6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yf+FwYGZzrj2oDOkOcE87gRGAj9CGikroKUdlU8+o9Y=;
 b=stPfd/hnk3JHsUJttRTC5uWfrs+NbpnDdhbqMuQPvVNbJzMfIxUlV597Ut7GKSR+FL
 wk78ED1sKQ01loKyLw5wkVb4Yz914e97bZxTiman5pdsfubL5Xvm2YjKZH/ofU6tpHAP
 rpzrvLA+wpOe29kxr/D78Ov/fEwLkxipZF0rcOtShOxvQcKpMsGhF73gfxFeeIfd1ZDq
 iJpFpPDiDk6p+X4Fh/wE990RK3i9CsxqXCB9NQj+OjgsdAjYxVGOD3im5fclRpMa3L5K
 B/4W0ZH7aM/UKK0mvw/QUP4RG2UksvTTRKyYRS81spHDaPIRZCSDHH1qTH9wa1pucplu
 UnjQ==
X-Gm-Message-State: AOAM531Yf86YScuiXIeucQLg00kCZQn8ZFOymmY+p/S/EISmjgg3r8Z9
 x3X7XO1Q5b+r5lVY2KSX1lLKbQ==
X-Google-Smtp-Source: ABdhPJxY6ptV0h3UnCwuQymzffpNNuBpa+0QTTa9q4XVGJNL0bohzjBRMU1x/Kaemre7sbfrKDA3lQ==
X-Received: by 2002:a17:90b:3005:: with SMTP id
 hg5mr658505pjb.215.1591202552307; 
 Wed, 03 Jun 2020 09:42:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p19sm2321258pff.116.2020.06.03.09.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 09:42:31 -0700 (PDT)
Subject: Re: [PATCH] hw/isa/apm: Convert debug printf()s to trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200524164806.12658-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd9ddaab-7d5a-4473-7103-de7ebcd369eb@linaro.org>
Date: Wed, 3 Jun 2020 09:42:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200524164806.12658-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 16:42:36 -0000

On 5/24/20 9:48 AM, Philippe Mathieu-Daudé wrote:
> Convert APM_DPRINTF() to trace events and remove ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/apm.c        | 15 +++++----------
>  hw/isa/trace-events |  4 ++++
>  2 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

