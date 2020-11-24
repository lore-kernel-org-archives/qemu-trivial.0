Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khb93-0002JL-Ai
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2020 11:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khb8t-0002Hc-C3
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 11:26:12 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khb8n-0002Al-75
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 11:26:11 -0500
Received: by mail-pg1-x541.google.com with SMTP id 34so17909135pgp.10
 for <qemu-trivial@nongnu.org>; Tue, 24 Nov 2020 08:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8FaLW1r7PGezow7XscMqmpz+lCQEypCZlUAqmAEAEkk=;
 b=tmQ2QM1PdSVQeQkHXmPpNGQX/aoDrwPX7xF41GzXAaiHsYqaY7pzh+YzGIpQF8fkeq
 Q3o1w91v1znaMs4S8N6kFAROO2SrjCGKD4O3TN2TCRyeUGjv3MsFFSYMFPonpd2o5j3m
 1Nq674hueIhg6uv4X2d3pe6Khhf0+eY4n+276qsc+mM+ryPue9J0KM6u/eAhiZceqiiw
 Jldc1wX2lqZ46FtTanOy2tXuxyuCQhQLNUbth6ndXbo5gDGxekKSAb6yW1aWYeZOXHrt
 2SQXHNOL5rvL8fNJ7cUO8EXyziKzIfd7IhWLWNCwg0BH7MKBDkCMdRM7Z6kkDVNAfhcS
 fyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8FaLW1r7PGezow7XscMqmpz+lCQEypCZlUAqmAEAEkk=;
 b=fkiGfkDRTMT3b2EXVC7fA1efnvcNEobFEVg2iDTX/M5uXnR+S4XsLZ8/wedvmVv4UR
 gsE8motDzHRLA7XUdS7kB6wO3nuR/FP98NbDcaShTKLd21kRV85o48HhjU+XpNk5IXXH
 KYhLlrbS+tEnRNtte1tb2AYBHhaqoCz/K+ILUgNfBMMBdR/f0ChB8sa5c+lZVX2oXd/l
 ky1k7UyXzOAoVNmQ79z68h8Q3nIxJ3wAbYMBlF4ubRlWRYyX7Fo+D6XB+U01A4LzgfeW
 BESQMYHQnw60YqoJGzr21xwOETBJto38P1Ye+XkoSh6MaabDEV8SMfOu6n2UhW4dCxPq
 gYTg==
X-Gm-Message-State: AOAM5321zXcb1d+H3L5VUKi9ahDxoDKJuN1C7tsvVWTu77mHrlznRvTC
 AL1DVdvI7sR6qxkuIxOUfI6X7GYqDBcSug==
X-Google-Smtp-Source: ABdhPJyL21SPsO6qhIukmZc28J6WfWRL9lvV4xlMHNqYC1NgNuTWx41oOtG1GlaiN6yJlBp1MdEexg==
X-Received: by 2002:a05:6a00:2302:b029:198:4459:e6c9 with SMTP id
 h2-20020a056a002302b02901984459e6c9mr1888718pfh.33.1606235162020; 
 Tue, 24 Nov 2020 08:26:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u6sm12880452pgp.57.2020.11.24.08.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:26:01 -0800 (PST)
Subject: Re: [PATCH] qemu-options.hx: Fix minor issues in icount documentation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201121213506.15599-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a23db2b5-485a-9c88-a4ca-307cff1a9eba@linaro.org>
Date: Tue, 24 Nov 2020 08:25:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201121213506.15599-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 24 Nov 2020 16:26:12 -0000

On 11/21/20 1:35 PM, Peter Maydell wrote:
> The documentation for the icount documentation has some minor issues:
>  * in a couple of places it says "sleep=on|off" when in the context of the
>    sentence it means specifically "sleep=on"
>  * the synopsis line for the documentation has drifted out of sync
>    with the synopsis line in the DEF() macro (used for "-help" output)
>  * the synopsis line in the DEF() macro is missing a "][" between
>    the sleep= part and the rr= part
>  * the synopsis line doesn't indicate that rrsnapshot is an optional
>    part of the rr=mode,rrfile=filename subgrouping
>  * we don't document that sleep=on can't be used with shift=auto
>    or align=on
>  * the rr option description had some minor grammar and formatting
>    errors and was a bit terse
>  * in commit f1f4b57e88ff in 2015 the documentation of the sleep=
>    suboption got added between the two paragraphs defining general
>    behaviour of the icount option. This meant that the second
>    paragraph talking about the behaviour of "this option" reads as
>    if it's talking about sleep=on, when it's really describing -icount
>    as a whole. The paragraph is better moved back up to above the
>    sleep= section.
>  * the summary text displayed in "-help" output didn't mention
>    the record-and-replay part
> 
> Fix these errors.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1774412
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-options.hx | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

