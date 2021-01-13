Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzpaD-0006CC-Mo
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 18:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpa8-0006Ag-QS
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 18:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpa4-0003qP-TT
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 18:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610580575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fif37q7xRFd66DR0whtSibS93whJ6zeQDCaP5SPREV4=;
 b=EbPJF0rFVHA0jOi+xnyNONAD7kNama1WrYV9diIFV1OdXKlki4qrx6UP9pThe6j0c5sw2d
 COxmZcY8a16n+hd08OeL5w5xrI20SkLc8CXQwfvsDoOwPBTOzordh5oCh7ZG0B/qfjlrR0
 1+kpNBV5U0Plq/aItd4nqVPUaLLW9P4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-wRld-mJNNimKjE6kmF5DZw-1; Wed, 13 Jan 2021 18:29:32 -0500
X-MC-Unique: wRld-mJNNimKjE6kmF5DZw-1
Received: by mail-wr1-f70.google.com with SMTP id b8so1692972wrv.14
 for <qemu-trivial@nongnu.org>; Wed, 13 Jan 2021 15:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fif37q7xRFd66DR0whtSibS93whJ6zeQDCaP5SPREV4=;
 b=RTiu5oBs5bRN5pyegVLykSVqLOD09+GDqn+ENl/4UoKUnp4AZgsFlQ0Xtrw3QTllTC
 is28Zh7Y8duiYkmbl8EKzGU55BShJ/QvZorN8XyfqjtiVABLG/1A0jh0retxcdRBfTPx
 fe2/pEI4MP2SmrBNZ5BZz/nlrJG/zH6J3tzI7cJ0yDZ5+yL8Rwbg8mNIqacK+WwFvwkP
 P/v8r1R9m/vRTYIiFwp32kfyDG2XUE+QxndukRMc+sFaxw+AUbfTMqJHPG8JxbltJXt6
 Eh3cH6lk2yFcSSR4eT3o6zHyWznEKdJr/ERPma/mxLx+Y7ZvdyIwOcFLso94LRUTTMSw
 ysiw==
X-Gm-Message-State: AOAM531iGe5hcgAtJaC01xJ/2NASmSaMf+c7Y1LsWafm5xWfm/oKYqBv
 bISISHwD5ZavFhsvvo8PCybOnjH3Pq/GfmY4vsh3NZcsl+SrrglWQ/UyXZMxRl2Noe1qwZkvG0U
 giN0mkKh+BWGzC6d8NQ==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr4975163wrp.30.1610580570913; 
 Wed, 13 Jan 2021 15:29:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUvWFbqC92jAmHWuoiiPuN8eBx7wubl8iV1+Q1XOE4XaNT7FvsD0u9fZGL934En4TbZRlcFQ==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr4975145wrp.30.1610580570665; 
 Wed, 13 Jan 2021 15:29:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z6sm5958234wrw.58.2021.01.13.15.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 15:29:29 -0800 (PST)
Subject: Re: [PATCH 0/2] MAINTAINERS cleanups
To: John Snow <jsnow@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201030153416.429791-1-jsnow@redhat.com>
 <2e2482ad-0d71-d34c-320a-b95117559a53@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6fb0c5c9-f248-036f-f9f0-6c1f85ab5484@redhat.com>
Date: Thu, 14 Jan 2021 00:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2e2482ad-0d71-d34c-320a-b95117559a53@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 13 Jan 2021 23:29:42 -0000

Cc'ing qemu-trivial@

On 1/13/21 11:08 PM, John Snow wrote:
> On 10/30/20 11:34 AM, John Snow wrote:
>>
>>
>> John Snow (2):
>>    MAINTAINERS: Remove Ben Warren
>>    MAINTAINERS: Make status spellings consistent
>>
>>   MAINTAINERS | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
> 
> A little late for 5.2 now, but ... ping?


