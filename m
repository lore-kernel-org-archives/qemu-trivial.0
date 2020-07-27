Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k06tb-00031A-WF
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2020 13:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k06tZ-0002za-W2
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 13:26:38 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k06tX-0003rf-Q1
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 13:26:37 -0400
Received: by mail-pl1-x641.google.com with SMTP id o1so8446901plk.1
 for <qemu-trivial@nongnu.org>; Mon, 27 Jul 2020 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VT/MdQtKEYPw/xmFzjWR/AX2vWtx0VmdAKjsh/004wY=;
 b=J9RGv9RSnVOX/Qm8rR0cKPrcLXTW7obLN6m2yYYcS6TS2QvYbKKR7TVA6UJxmgdBxc
 6/mRNsqduqGPtPmBgOyvfPghRoU4g/OZ4KGH81jITJrLu0QdZ7Rcqr/vwZPjKg3N8vq+
 l3IpL5PtD0ejICI9wyabLqlRFfy5YQWTv5ycyI6I1g+mgeRsjabJpJUIyLBfaJ7ovsXg
 yaDbLjaRKXzPx9FcARbGvUvRBtlZA6m2Ghcljeu9tm46NDD/e/CvCoUI2nGT45yPdSgY
 q1t74NVhbBNNBxOc5PZ8LJJVsRtgip8v5dcrvGLQ9rPNHgWNdPOxc7VmAdZjEVcRHu4n
 wMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VT/MdQtKEYPw/xmFzjWR/AX2vWtx0VmdAKjsh/004wY=;
 b=FwiI3IAPDrhSXDFhVBzIixBEN9GFMfCYMCuki8bPb1Ng3CmFQSoPoEAqrZcUQnglRp
 /MIbr4XTS3c8j97/N8gAHj2FQeRNqyBRNVzAR3Y76hLjE8KXxikPM9FunAC3sTMn1+Bn
 F3P7Py4JAVvHsiyjIPGgH8s5RgfvkBALLmh6WTTV1B8kiZ6Gki+MW6YmyV9VkVxYzF/y
 1YaVIO6vcKAQZowTvsNW4OUjNQBoNZHHysxFJk28mYuicU+vO6qJim4VnyzZib7EyDTN
 vS4j31aFMw2k2M7bc1h72efQ9YbsnpFSw1a4JQEFeIEabF4mAvYad7OtQeowUGCAUSfy
 B3DA==
X-Gm-Message-State: AOAM5338iKLfdWRoMMFWw0BAz+UEL8BDKTbIt0fTsM0H7Y/9VuEqYsw4
 JEh4zmRR8G785qwI0iqNZMrKxQ==
X-Google-Smtp-Source: ABdhPJySGrfhwWsxCIWz6XlSXfy6PyVUHG65v+IhFwdR/xaU0np8CfBVtIgHOTd7Rc+WxULKSpJsGw==
X-Received: by 2002:a17:90a:6b02:: with SMTP id
 v2mr293498pjj.163.1595870794168; 
 Mon, 27 Jul 2020 10:26:34 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 s4sm1909247pfh.128.2020.07.27.10.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 10:26:33 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Fix TCG leak with the evmwsmiaa instruction
To: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Cc: david@gibson.dropbear.id.au
References: <20200727172114.31415-1-matthieu.bucchianeri@leostella.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <524ad0cb-0d91-70b1-9e14-55a070ca8270@linaro.org>
Date: Mon, 27 Jul 2020 10:26:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727172114.31415-1-matthieu.bucchianeri@leostella.com>
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
X-List-Received-Date: Mon, 27 Jul 2020 17:26:38 -0000

On 7/27/20 10:21 AM, Matthieu Bucchianeri wrote:
> Fix double-call to tcg_temp_new_i64(), where a temp is allocated both at
> declaration time and further down the implementation of gen_evmwsmiaa().
> 
> Note that gen_evmwsmia() and gen_evmwsmiaa() are still not implemented
> correctly, as they invoke gen_evmwsmi() which may return early, but the
> return is not propagated. This will be fixed in my patch for bug #1888918.
> 
> Signed-off-by: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
> ---
>  target/ppc/translate/spe-impl.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

