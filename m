Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxbf8-0006dj-Pa
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2020 15:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxbf6-0006by-9L
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 15:41:20 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxbf4-000678-K7
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 15:41:19 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p3so10796418pgh.3
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2020 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r4sGXluqaQYpHz2gJjWcC8JR1QPkpaZ+jeOR6K+cGJE=;
 b=JJZVDo4Qd6agZQUomlVsTZvHv9Cq8eZz1tr853twMMzoZj8SjsebQ/rq44GHObEcqC
 CDoZ5QejU6j7psxFZDoQfXLxrBAeMnSa9rFIBgar7z4DszUKYFQHkm7sWq5m3nYPQgXu
 00dTPOHlM0fHgEKMvnZVDTgS1qNFYPaaBAxL6pDVWhenWAZxAG13Grd9/4ddS044jipj
 5ZHv9uKdmxm9EVAohQMfRIqIip36e62zhYd3zU6XrxAhGM07DPCbXT2qymvgoN3EJJbw
 jBFESCCZwd12eNCE9owINMkRvK+TUDC9PUjLUJwHEp329q79luO6LgBbOzjf8M0cxqQa
 kQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4sGXluqaQYpHz2gJjWcC8JR1QPkpaZ+jeOR6K+cGJE=;
 b=swzOishcIZeOmrWZhvpefzEs0J6t3rJbDjfGtdgFsLyeOStVWAGKsuFjF6Jrj/HUQ8
 PtXCCrR9cFj2+zo4c2HkUD+5u9dyDflx3HPRSgbqxqQDpGdAqfGJX4wOGRasiML9qZPW
 OzCMN55JsrivKk/6ZcGO7WiMQudQTeidSdt3YrYqK6wZ5GxnfmPbfeEx9V0VC1VKn3mX
 d0wYI6eKzKdjuNLeu39fsntRBWhPjb0ltxO4c4+w4q4+BhdWUFL+u2PZht6RAJakuizo
 oUps+RQdTxnhG1226OtACJ8H8TNM/cJPN23VzZlzZRUSp1fmkvYoniuWOyKUOZawuQPK
 acYQ==
X-Gm-Message-State: AOAM530d4O3fvVvrDSHElghJx5Z0EXzZQlCCGGZ/PGqbv1t1XswxPv1A
 O0f+Gv9XTM48rAfFe5HInJDcuA==
X-Google-Smtp-Source: ABdhPJx62rwAP40lM8vcRXnDNdmuoC7Qtyayn5vSLnWPVJB4bY2dGZQsThWIYmoSebKu66GCqikIVg==
X-Received: by 2002:a62:fcca:: with SMTP id
 e193mr21532902pfh.307.1595274076862; 
 Mon, 20 Jul 2020 12:41:16 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 17sm377442pjl.30.2020.07.20.12.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 12:41:16 -0700 (PDT)
Subject: Re: [PATCH-for-5.1] hw/isa/isa-superio: Fix IDE controller realization
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200720172348.23465-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28b40409-5094-137e-a1e3-60dd502633e3@linaro.org>
Date: Mon, 20 Jul 2020 12:41:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720172348.23465-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 20 Jul 2020 19:41:21 -0000

On 7/20/20 10:23 AM, Philippe Mathieu-Daudé wrote:
> When realizing a Super I/O with IDE controller [*], we get:
> 
>   qom/object.c:1684: object_property_try_add_child: Assertion `!child->parent' failed.
>   Aborted (core dumped)
> 
> This is because the device is already realized when we try to
> add the QOM property to the parent. Fix by realizing *after*
> adding the QOM relationship.
> 
> [*] Set ISASuperIOClass::ide.count = N with N not zero
> 
> Fixes: e508430619 ("hw/isa/superio: Make the components QOM children")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/isa-superio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

