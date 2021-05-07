Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf9pn-0007jn-6p
	for mharc-qemu-trivial@gnu.org; Fri, 07 May 2021 19:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf9pl-0007j0-UA
 for qemu-trivial@nongnu.org; Fri, 07 May 2021 19:24:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf9pj-00053k-Bf
 for qemu-trivial@nongnu.org; Fri, 07 May 2021 19:24:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6416307pjv.1
 for <qemu-trivial@nongnu.org>; Fri, 07 May 2021 16:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xhFQIBPZ0mRG9+1aWL5Nht7pW/htDX8x/00VxhXpWmg=;
 b=efa2BQ68++KOfibMp417BuLDf/gp79ETW3O+fpBp/N1BE8pwgUTSd1wVuSgq9HH0KA
 IG6RmcwxzKjbDZ3axi1n0NFm0aQNO3Q+nysBmqYHxO/+xBQ986sfTNMIS1kfBO4tTz6L
 AQESxXTfcXbBrbFMbf+/KqJ2pCf9vjr2AkPPaNMqn/s9ke2/SQrHRAyfWwTeEo+PvPZ+
 TB5qhz3QLNaqY/Y03mANP6FRTz1GiVyfKkpOriRzPWLxKfQekP3VxFnWCoqXVZNZ1HIU
 3TXo0yDqDKpcMqs0nBtIWxIZ4fkKCi6eNHkL9o/y4U5JIB7tnhXq+34fjWDKEXseUn7i
 oeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhFQIBPZ0mRG9+1aWL5Nht7pW/htDX8x/00VxhXpWmg=;
 b=oRrjaBMmzz0k1zFgMaE8cAqJlIyssqvwxoEeR7QQwbyhAEsAoaiowbldQ88fgM83yj
 2s9TvSMzUuh0w8X5G18t3gN/7VbZ9EK3a4H6tVPOAlkkXbpBmc7POk+8tTo2d0vAH1OC
 /a4mnAe9VUU/EqBwCz9cdN8+NI5kBWSRYc785MveCUZs9zTOxzk5e6jNuvbn6c+MQCAE
 4GvXt08WXA0szVFsz9Ayeh5ckA8BKS8TAIUT9ETAJrZuDiSfaGUZqhBU2+rSZixOUzPc
 CzPh1wcvELIJ3TYRQyAy9HSsb7E897lfGzrl/PxgmLA67dNoTRIAetaOETxqZs03DEKS
 Yihg==
X-Gm-Message-State: AOAM53102JOYLexVvqywCk12HghICHAA6gcYJN8LB1q3zZWPGnzf2GvK
 HoF6qBIQvSDaT4RVEyvVH7bNuHBe81WNvA==
X-Google-Smtp-Source: ABdhPJzrMQimvxaEBvpii5d5tzRHGYDU+pQcTtlLZ+H3HPtqLTJu5SFEK2GUWegqfu+mJaPGXLZttw==
X-Received: by 2002:a17:902:6b46:b029:ee:f84e:8655 with SMTP id
 g6-20020a1709026b46b02900eef84e8655mr12850943plt.76.1620429873028; 
 Fri, 07 May 2021 16:24:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o5sm5581119pgq.58.2021.05.07.16.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 16:24:32 -0700 (PDT)
Subject: Re: [PATCH v2] This makes it easier to figure out whether a
 particular instruction was actually translated.
To: Nathan Ringo <nathan@remexre.xyz>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <FITkUaiC5DeyCU3e1T6EisgkkQ8Fnrwf2WZTBGE@cp4-web-031.plabs.ch>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3e79a92-802d-b9d0-048a-cf8d80309388@linaro.org>
Date: Fri, 7 May 2021 16:24:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <FITkUaiC5DeyCU3e1T6EisgkkQ8Fnrwf2WZTBGE@cp4-web-031.plabs.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Fri, 07 May 2021 23:24:38 -0000

On 5/7/21 3:48 PM, Nathan Ringo wrote:
> -    trace_translate_block(tb, tb->pc, tb->tc.ptr);
> +    trace_translate_block(tb, tb->pc, (int)tb->icount, tb->tc.ptr);

What target are you looking at, because for the variable-length isa's, 
instruction count may not really help.  Perhaps tb->size instead?


r~

