Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5KFF-0005h5-PO
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jan 2022 23:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5KFE-0005fX-7K
 for qemu-trivial@nongnu.org; Wed, 05 Jan 2022 23:19:20 -0500
Received: from [2607:f8b0:4864:20::22f] (port=34741
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5KFC-0004xQ-Kb
 for qemu-trivial@nongnu.org; Wed, 05 Jan 2022 23:19:19 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r131so2098983oig.1
 for <qemu-trivial@nongnu.org>; Wed, 05 Jan 2022 20:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uNhrhRhtl+SrE3MXJdAXRnN+eVUU2AnRRD1it2rSHRA=;
 b=E5Hqs1zBcZmsj5gNi7aSt1nlEC8VJFgwlrsOmkNdV3qbW2SklUNpgJaBYa/eQ8DCCS
 U7Ilso1g4q6gC3p4ca6Vf3C30GCjjUV5sOecQ5iRcP1RMgDrGa6O7l5+tYeo0HdZbEnv
 RIXk83XN1mqT7UY0jyHUu1fcOZaOv0VIv03eyQGpNf+EZaHxEbvmDERC3j4HJND7gNTS
 ++miS5rwDGnI8NliOqxUpBLJspVBJpG3jdsjmKuFBtMMvWN7EEZLeWphYEZMwL1jTonw
 RGIsBcBEQ8/ejtTwyTauiUXv9yDf5uj7+QP/O/fGCqmjySf1E9s87uoHwNo953PZmSmA
 l4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uNhrhRhtl+SrE3MXJdAXRnN+eVUU2AnRRD1it2rSHRA=;
 b=JIYMuYKmx7zPqTDjwXPSDp+TVU9ZlXoYgbazN4JCEPECoXmBVpefFDtq/esHv1j0oJ
 Q+FCpjrvy7fOYaZn0ew2ZCX6W1K9XGpt2eJROgnlTYn/S3sur2qbqAmXEh5lVvY6Iuw2
 hcOxF4wAUwecSXsW/zKH0W/EIQtr4mYh7EcJu/FBwuemRc3Jsp68fKCDBTlR5NArRnCr
 ekTzRAHtR0U0Ltv139EvJPuMoyOTi3cUhxR8dnx9whZQTVqe8BcNSpkPvJDJjde8CepX
 WnJI64+WFxgSVf8jB/pgajn0mCxOiZoc7iCMU16QPQHi2NF2OOQqHnHkSMXk9yGH5mTk
 LqmQ==
X-Gm-Message-State: AOAM533WzNiMJkBXk7R2YJNLeKIk4MLR6g1KIqOfJnCFi2Iz8HCB22aK
 bM8Z4xO4CQ+4MAO6jGWo7nQWh+mu6WlvyA==
X-Google-Smtp-Source: ABdhPJxbgj2FJb/xJaALCAeinqw3aLFszi+m3BAdL/CqBMVXGGSSAOVQ7sUdV52+bLAxiASk/lWsLQ==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr7872877pjb.129.1641442309593; 
 Wed, 05 Jan 2022 20:11:49 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d13sm564508pfj.135.2022.01.05.20.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 20:11:49 -0800 (PST)
Subject: Re: [PATCH] meson.build: Print gtk version in the summary info
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220105190804.649316-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac9319dd-d64a-0c12-d378-740642b57b48@linaro.org>
Date: Wed, 5 Jan 2022 20:11:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105190804.649316-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jan 2022 04:19:20 -0000

On 1/5/22 11:08 AM, Thomas Huth wrote:
> The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
> so there is just a "YES" in the summary info if gtk has been found.
> Let's use the info from the library detection instead so that the
> library version is printed in the summary instead.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

