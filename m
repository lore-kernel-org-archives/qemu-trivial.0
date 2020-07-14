Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLIy-0002o1-Ij
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLIx-0002nm-AS
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:49:07 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLIv-0002JN-RB
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:49:07 -0400
Received: by mail-pl1-x643.google.com with SMTP id w17so7041282ply.11
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jg/D1KeTkUPZaYtuyV+8WgeIArn8o31gf3qjjXyMHwY=;
 b=rSysSiIP8h9928Yi7oGt2LjS4fNoGezqDNRG9KLO7l9Yu2ge2TZJgVpqACQb+TBCFS
 OOFSTJOUNT8XKf7C+8sxN+uatoU0zj+1cvgGUCQmIVuUz0R/bMvUhZ2VyUTe7HWHgo2Q
 4K6OJMvgsNseBs6CoB14wyXSvNatebUP6OoH6srviycJcDeW9a+ImWs1lQb3WOpBSL/A
 RPLjb7MAwtxvtJrPjWj6Rjde3xMH6Rlg3O4eYCU68qLMeSnw6G8TMDTwrVaj/JJrAT7h
 GGpHx7BLmWmRcAdl3JGBwM77xX28F9zsm7JBe9U0i+2v9b+JWB42qjU6/0AURrkwHQ6/
 5U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jg/D1KeTkUPZaYtuyV+8WgeIArn8o31gf3qjjXyMHwY=;
 b=opUMbfJv3bFg1V/U9rUOjvC10hV4BN7nUq+Mb/itSDvSu87BusD+Zlh40d5MJPJAHL
 lWepGoEqrrpgZuFKvCnVMsxv9NCQNvnh0DNSPwQp5O2+WF+AOMBisSo0fIJ163TpvWRf
 BNQEXJCk2lJK7us8u6yww0kK6qfo8I81785STei4e2gmS/gVOTQSiurNh5ziZiuhyRkR
 Dg5pgni7iWY5bnmdNKHKnf7vk9uvJ8MjEp+rT7Dbnb2mJ+DoHLGkVzIlPmxv74d9rE2K
 WC478FBAJdsngaQv2zmsxiy7jQdQD5OLVzZfMCd7Q/mfOYL3w7VWUZIaKR/jchxCfHUf
 DtBA==
X-Gm-Message-State: AOAM532EG7UBbRQpwP12Jf8NpLf78mpRP/zI/QnfA6yQjVq/Db0trvb2
 hSD7ElV0i2UmN7ONgvocJ018q9PNAdU=
X-Google-Smtp-Source: ABdhPJxusqjMqMVnvXab5oE9IvJ25TctpU4diOYO4Mq5iQPsT37ph+3pSdccfbSt2vYFg9DvJiks3Q==
X-Received: by 2002:a17:902:728c:: with SMTP id
 d12mr4030973pll.155.1594734544242; 
 Tue, 14 Jul 2020 06:49:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t1sm2875030pje.55.2020.07.14.06.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:49:03 -0700 (PDT)
Subject: Re: [PATCH] vnc: Remove the superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600436-23162-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2482366c-19eb-001e-47f9-0dd313b016c5@linaro.org>
Date: Tue, 14 Jul 2020 06:49:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600436-23162-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 14 Jul 2020 13:49:07 -0000

On 7/12/20 5:33 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove the superfluous break, as there is a "return" before.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  ui/vnc-enc-tight.c | 1 -
>  1 file changed, 1 deletion(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

