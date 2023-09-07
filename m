Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeDKO-0001CT-MM
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2023 07:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qeDKH-00011S-CA
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 07:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qeDK9-0002bf-M4
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 07:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694086643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kCVUSHAaoNdfu6EYfvddmbNEBHEyGVnH4OHsXNzpbo=;
 b=BUWB6c9SpDocAZLTMXTaQ0PPttWv42jmbi2fxNWamZJr96gq0Le9UMcWyXaLee8cw8yj9D
 sU8qNoF2Femr9vSrY4plIj1edBLJ20ufb6ubP7mi+tUf86Ei/tsZ0FXBGInspROSxvAe0t
 xzk3CkPx1V+zKwuWOQYfPhEtXPXEiDM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-l4B9iGOfPmS9rlhR_4Dqqw-1; Thu, 07 Sep 2023 07:37:22 -0400
X-MC-Unique: l4B9iGOfPmS9rlhR_4Dqqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-317d5b38194so347174f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 07 Sep 2023 04:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086641; x=1694691441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kCVUSHAaoNdfu6EYfvddmbNEBHEyGVnH4OHsXNzpbo=;
 b=KbK/dbqQqvxfRMoKEC6UoxqcZaldzOweswg2RI3Yi2BcNcsCKwzXBXNM5PaRlLFDz9
 Jqp35yZCOBHy5v8rjKS3qsOiLIf7VsbZ4vuo2bxMSYbSRL+KGqYDepTyrIBmmpumQZDf
 9M2QaAlapebYSIhtcYr/tqa0O2HXsLNisBmncIXvq6Akw4Mo8KDbhI5DieTrn/LqZB/d
 VZ0yhhffMWe1NqeS3VR2jw31iwOFfVan8OdYkZi/nZJ1l4R4JlLjL6mfEykktNPgGDJd
 ZEoVq5ks/QrvlNSo0wLNhUZlrtESv2NVURtNkkbkCrTicYTSJsqQgzHhb3xhaCop/2l3
 OA6A==
X-Gm-Message-State: AOJu0YwEvM0IbHCW1NNtYXfSxxwhv81pRCAOZxupTD7y3kGR6TXpaLJH
 0tD1hTiRi4Jkh0ISBhmn9SXLuitvjWclasEkG2E8XrvDpP7ggDCvU31XBqR/qqRIpmGOF697qZi
 9jowzOuq08Lg/MFEcjQ==
X-Received: by 2002:adf:ed46:0:b0:30e:56b3:60fe with SMTP id
 u6-20020adfed46000000b0030e56b360femr1916069wro.4.1694086641557; 
 Thu, 07 Sep 2023 04:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLevAbeDIb/W6ZGXe/y1sn+h1t8m+oXEyZJ8wbfo6pJhzLHFGwG0qpyGDHb1Jga5RbTa48w==
X-Received: by 2002:adf:ed46:0:b0:30e:56b3:60fe with SMTP id
 u6-20020adfed46000000b0030e56b360femr1916057wro.4.1694086641287; 
 Thu, 07 Sep 2023 04:37:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-5.web.vodafone.de. [109.43.176.5])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adf9bcc000000b0031759e6b43fsm19964066wrc.39.2023.09.07.04.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 04:37:20 -0700 (PDT)
Message-ID: <96673508-be8a-d26b-a731-fd07580086eb@redhat.com>
Date: Thu, 7 Sep 2023 13:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/3] hw/mips/jazz: Rework the NIC init code
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org
References: <20230825175123.624114-1-thuth@redhat.com>
 <a9aa3e9e-dbde-54ed-1df0-749f483806f6@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a9aa3e9e-dbde-54ed-1df0-749f483806f6@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 07 Sep 2023 11:37:34 -0000

On 01/09/2023 12.15, Michael Tokarev wrote:
> 25.08.2023 20:51, Thomas Huth wrote:
>> The NIC init code of the jazz machines is rather cumbersome, with
>> a for-loop around it that is always left after the first iteration.
>> This patch series reworks this a little bit to make the code more
>> readable and shorter.
>>
>> Thomas Huth (3):
>>    hw/mips/jazz: Remove the big_endian variable
>>    hw/mips/jazz: Move the NIC init code into a separate function
>>    hw/mips/jazz: Simplify the NIC setup code
> 
> Thomas, after comments for "hw/mips/jazz: Remove the big_endian variable",
> will you respin?

I've now sent a patch to clean up that ugliness with TARGET_BIG_ENDIAN first:

https://lore.kernel.org/qemu-devel/20230907113500.185276-1-thuth@redhat.com/

Once that has been accepted, I'll respin the other patches.

  Thomas


