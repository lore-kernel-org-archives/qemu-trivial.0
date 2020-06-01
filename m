Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfu0I-0003db-Ni
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu0G-0003aU-Vc
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:38:00 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu0F-0006hK-LO
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:38:00 -0400
Received: by mail-pj1-x1044.google.com with SMTP id i12so492516pju.3
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=D6RFiyd3vhs4PAjso9chbZyN90KGj+KGNss4NJQQ8ZtfXqYr8rob/58LqdkivyQ18S
 l8MM5DCaRgDBwmpNMqKrdYLfNRH4UDuLUbWD+FrxdZlCs7oRa7NWFLsPTWt+x02Cg+Y8
 cq/LBMagSbGn+1O9fmyA2upRrb1DRGWB3KkOBS4QZLb8bwrISwNs2qMqtQ5CMDZRh+fI
 HSymYViN4Vz251sbBkoz7+QKOmlsXmmdPwlsLYqWFEzzYkaFl1BQKctLNlp4pOMzWc6H
 lAQS+t6tOCAJf70J2cbezgmakkny+l09OEdidLQyiADzbfoocJWYEiW1gmFcQPbIpryA
 8FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=JxOMPOrgMvfPSB6acV4oxeDfU2C8uKK66rA+JRH5W8CWpxLy7LIFfMQdHBzV1OFsq7
 lFwv235EzkSZNmDnu4GqIpKZSrfi8ePgB5cBY7dco7Ih6KkGTmkIhOIMEhiePrija5kf
 2Q5W2qJlKxLr14cFLkW9pn/bfxNDPudN/RrzeS1mbwD/0ICx4Y4i5+KFJdElnVLQHDHl
 K8phqoGXeY+rAmTeLEKs6YC8epy8SLI/X6l0jGkQ0DRVfzB30hq+1VE+K7b/qwsdmx4r
 Vq2fHm8PyGzeF5UJbWIoPStY95hD0TUq1nlXbv1QFuFETnuvChYpRgcvfowdZLhNRgDq
 J7VA==
X-Gm-Message-State: AOAM532lwDRJivBr+UC4jv+vVSxgLrECbmg0zb9lyVIOE+CgkbrphwTX
 HNnatv9jeJwsTC2rZFDzObHP4Q==
X-Google-Smtp-Source: ABdhPJwQbu/car7bKu2JAjkABhB4S+ApIJr/aipBL4QQbfu0LhpD4XGgfdkXxwi8pkIXezTuXqaYwg==
X-Received: by 2002:a17:902:bf43:: with SMTP id
 u3mr21921053pls.240.1591054677830; 
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h13sm444790pfk.25.2020.06.01.16.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] target/i386/cpu: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc1a89c0-c631-505d-f901-6a7821c74c2b@linaro.org>
Date: Mon, 1 Jun 2020 16:37:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 23:38:01 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


