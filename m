Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEuFU-0005AI-8f
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jul 2022 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEuFO-000573-73
 for qemu-trivial@nongnu.org; Fri, 22 Jul 2022 11:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEuFL-0001fD-KM
 for qemu-trivial@nongnu.org; Fri, 22 Jul 2022 11:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4ceIwmIpo6VF90bAFoKfiugXPvAFI3Dxl59Pmu90hw=;
 b=gfNosmBaVoPnWI+ExRiwQDjRcFWbJS5DaYXwc+OCIBAGgZ6hnqPE1dunsUjxa0xQ0bJVz9
 6FLCTnkRmfCSRmtMpOlK0yD+kOoVE3zAJiMALhP1ZXtTJGX6VkK3zPGULD5q4CO5x1CE8z
 UCFQHC3HNQ5SNVsGopL3oy2RyoFVb2g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-hDBgnZ6DNQ6xePyYgj86-A-1; Fri, 22 Jul 2022 11:07:12 -0400
X-MC-Unique: hDBgnZ6DNQ6xePyYgj86-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 q9-20020adfb189000000b0021e3e7d3242so872641wra.19
 for <qemu-trivial@nongnu.org>; Fri, 22 Jul 2022 08:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f4ceIwmIpo6VF90bAFoKfiugXPvAFI3Dxl59Pmu90hw=;
 b=6hVeam26DdBPQ42EQ9L1KUguxU1U2BjAl275NIOzQzhMc5YGv6tsUzRWmm9tYeB8hX
 z2+XppBKd1M+hn8nthVQK0jAiGnx7BBTFoEwl5aClX888zIkotZB7s5bs/S6ZPB71PJ5
 SBwSC+vU0KMLt42kpqQyAFOEpid3TWgbA7n5lC89KoPVHgFQ2k5jpaqk6ZKiXzHFQW+n
 12ChNiSGfw0m8G5cvYq+Adjlsbbo1XhAp9tkQr/zx3aT9+pfl289U7xwpJaqyr9Ne5Rn
 zwAKPcXmtcq41trL7sRN4eohMTfuNdM15VOBOqaGz/kiWW4i3IH36dNLz9Gju7qHMgby
 y2Xg==
X-Gm-Message-State: AJIora8I0pN2GBFwD3FKjxLwiYrXPaA/VXtdDKS0PMscI1pyAODS/UMg
 mn9OoCQArrdY5XL5VoAdMDW/0m3VaC/J6haUo4NvjfGLHJmVLk10OrbTkEFpnLPltgISiravvob
 sM/q1vX8ARDpx4VXy0g==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr243259wrw.215.1658502430827; 
 Fri, 22 Jul 2022 08:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssx1h81Q7RsPbDLM9Ot61U5GfBLggtgSrLR1kpduszR1Jl1CNX3NIinh0XoDWqyo+S48T/wQ==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr243227wrw.215.1658502430298; 
 Fri, 22 Jul 2022 08:07:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 a7-20020adffac7000000b0021e3e73dec6sm5735900wrs.72.2022.07.22.08.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 08:07:09 -0700 (PDT)
Message-ID: <368acb07-ddcd-7d6f-a86d-deb82a64d82b@redhat.com>
Date: Fri, 22 Jul 2022 17:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] trivial: Fix duplicated words
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20220722145859.1952732-1-thuth@redhat.com>
 <Ytq8MarsylEWxvhQ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Ytq8MarsylEWxvhQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jul 2022 15:07:22 -0000

On 22/07/2022 17.03, Daniel P. Berrangé wrote:
> On Fri, Jul 22, 2022 at 04:58:59PM +0200, Thomas Huth wrote:
>> Some files wrongly contain the same word twice in a row.
>> One of them should be removed or replaced.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Removing duplicated words seems to be the new hip trend on the
>>   Linux kernel mailing lists - so let's be hip in QEMU land, too! ;-)
> 
> I've got patches proposed for this, as well as test to detect it:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01405.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01403.html
> 
> though I'm not checking 'this this' or 'a a'

Ah, ok! Sorry, I should have had a closer look at that series...

So never mind this patch here - but what do we do about "this" and "a" ? 
Shall I respin my patch limited to those two words, or do you want to 
include it in your series?

  Thomas


