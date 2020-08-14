Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6d55-0000N3-UE
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 13:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d53-0000Ji-4L
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:01:25 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d50-00058X-P0
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:01:24 -0400
Received: by mail-pj1-x1044.google.com with SMTP id c6so4691992pje.1
 for <qemu-trivial@nongnu.org>; Fri, 14 Aug 2020 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dK/Jbv6Z1WN5kglGdcCFivMd6XzzLV9h7t+tyagGMR0=;
 b=T6LMDAMPIO7Ltfjt3vihOjHqC9pE1E5DRt08ziwvkD8QvHpidjvpKOIm4wopKCau6p
 qdR6e/dJptJv6qcBf6XBH9lZ+HkMUNaou7/1POVNTCQ7tRveyHsDmycP0j4hnp38Heyi
 0qSoMyrhYvPfd77Q8jSQSS5JySdc4hqoIgTW1yLkVEAlGDSf0R2FIjVEjRlJ19l1fjLN
 B3xl9YBV6Gx1u9NWma+16jCEULxgct1z8XL+j1gsPGipw+hHfL+XlHgufa95dq+ZkREN
 s738jCfYPCRLa/sJ7OWsQB50nWXBlpPaBTuI2lnKn21JudWL4hvVXO4oDQk7o7J2LB30
 fa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dK/Jbv6Z1WN5kglGdcCFivMd6XzzLV9h7t+tyagGMR0=;
 b=VCQ13CSeIPAZ+a6HmPtdUh30X1HjaRjfTxGv3jIJl1RmYaeiVMIEYW1nvDa8G+14m0
 o6gEMa3jveHaMYbWsbrvMklQYYODRbQOcBI72Bz7m9+QF0oZPdHb1B35xylGoTHrAxdj
 YVDlcBLBaXnN2NMd/sXOzxvZuClBoJTHqm4ChcqkVjFe16IKc6ibYDggAVOj+L0bhoVb
 2tARIzShT1uJ3HO5nIEdksKnY2XzhXyj2MeF04y5kOGuoczci3piuptCAbjLAE0QgZzO
 NZkP7kjVLayNwIYxS/ZpZxn7hnfB1zGUybarq2LXC1kqph1xrNqQSg60aU88oKc0g3fk
 Zivg==
X-Gm-Message-State: AOAM531Zy8TwcIU4fnHCZULyTv5btS90mqPsDniv2WEiLlIvIskA/aCd
 n/RuRcqdB+NxzgkJ4NkmxRsRnm+kFv8XrQ==
X-Google-Smtp-Source: ABdhPJxORJNNOSM3xn774JDD/8GRVjsPhTs/EH61gHDRZbCT/yEK2skCb4rwuIANSCFa8K79zJn6uw==
X-Received: by 2002:a17:902:ea8c:: with SMTP id
 x12mr2751922plb.60.1597424481321; 
 Fri, 14 Aug 2020 10:01:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j13sm9835783pfa.149.2020.08.14.10.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:01:20 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/scsi/scsi-disk: Replace magic '512' value by
 BDRV_SECTOR_SIZE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a14b897-4e1d-368b-a559-f54f53bc1e96@linaro.org>
Date: Fri, 14 Aug 2020 10:01:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-8-f4bug@amsat.org>
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
X-List-Received-Date: Fri, 14 Aug 2020 17:01:25 -0000

On 8/14/20 1:28 AM, Philippe Mathieu-Daudé wrote:
> Use self-explicit definitions instead of magic '512' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/scsi-disk.c | 44 +++++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


