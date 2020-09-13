Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHQNL-0001Ps-BT
	for mharc-qemu-trivial@gnu.org; Sun, 13 Sep 2020 07:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHQNG-0001LP-5b
 for qemu-trivial@nongnu.org; Sun, 13 Sep 2020 07:40:50 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHQNE-0003fO-B1
 for qemu-trivial@nongnu.org; Sun, 13 Sep 2020 07:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599997247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gpPRBijc+3G9gBPOKUwy0YneqiwSCcznq1QbS8eARGU=;
 b=gDOasce6IAO5MRAQZKD96uhb8ucITuH7Kf6zE1V/HcwdStnjQ4z8KfBGBtOdX22Qysvj6a
 YxCb/PR4jBllJVdSCEW3DGtBT1fTNlU58X4LlU1gTJ3zrkb9Efus0kXgmngPfGqGon5klw
 HRCLk8UH/HS0oTrJG7b0p8//6duCA0A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-jl3T99MZPtiWgkCm5sw9yg-1; Sun, 13 Sep 2020 07:40:43 -0400
X-MC-Unique: jl3T99MZPtiWgkCm5sw9yg-1
Received: by mail-wr1-f70.google.com with SMTP id r15so5456029wrt.8
 for <qemu-trivial@nongnu.org>; Sun, 13 Sep 2020 04:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gpPRBijc+3G9gBPOKUwy0YneqiwSCcznq1QbS8eARGU=;
 b=mmCDD+7xBBPJWzrBUKw5iiywsHh2h2W11KXf/Dz26n6Nd6m7ro2Yo6c7OVH+uxaVWD
 jPmyq4L4Uc4Q/S8G0p/iCwyR0Zjjgdpu5rNzgK2ju+ekWsqeHG6F/sW0mb9dyWGr6aKn
 g0Gw/Y3Qlte8fa08O9K1MmU8lek6r3cY1GEniS8YGsLagCBGlSmojigybp8V+AZ72vfg
 OR+ZI0Oh1yF+rn5bu/kj5ClefNSoL4UecVmO6UJbomRGEecXXLmZ11e3jARwM4tuY4eP
 nAfEH9Ri0d27dNwqiuYTn1bTqAk+PLyh2VDlfmYG9yJMig45dHKJmEoR6b4cz+e7a7Zw
 Xrxw==
X-Gm-Message-State: AOAM531RAlJRBkmMTlN3xg/ovki1PaT9S68tMel96F93b89lf95OKOJg
 rXmKXDEK/0l9yJdDf5MDUSYxsB2ZxyfaOXqRgA48oH/zTMJQpYPywF9hzw2Xks2G0FQoGOnY1HE
 0/MoZwLxpZxTYKiDCpg==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr10789313wrw.199.1599997242190; 
 Sun, 13 Sep 2020 04:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn9ckusCaLJzd27W8hIuMf3ax9Hgtt3AHwMEO9po6t3x+Vb42LZS/8VG/KmuQNzAcYUJGnLA==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr10789305wrw.199.1599997242039; 
 Sun, 13 Sep 2020 04:40:42 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id x16sm14843157wrq.62.2020.09.13.04.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 04:40:41 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw/timer/hpet: Trivial format string fix
To: Laurent Vivier <laurent@vivier.eu>, Dov Murik <dovmurik@linux.vnet.ibm.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
 <35c826f7-bfbf-9e74-ad86-ef2d3262828f@redhat.com>
 <2d4ff491-de20-944f-dabd-f35d6a81b53d@linux.vnet.ibm.com>
 <254802cd-2e4e-8506-2bd4-ce7cc0dad23e@vivier.eu>
 <398087ba-6c7f-488b-632d-d36b8c27f1c6@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a0ddd476-8f9c-ced1-e7d9-86ea9db7be0d@redhat.com>
Date: Sun, 13 Sep 2020 13:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <398087ba-6c7f-488b-632d-d36b8c27f1c6@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/13 07:40:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 13 Sep 2020 11:40:50 -0000

On 9/12/20 9:15 PM, Laurent Vivier wrote:
> Le 12/09/2020 à 21:02, Laurent Vivier a écrit :
>> Le 12/09/2020 à 19:34, Dov Murik a écrit :
>>>
>>>
>>> On 10/09/2020 17:08, Philippe Mathieu-Daudé wrote:
>>>> On 9/10/20 3:58 PM, Philippe Mathieu-Daudé wrote:
>>>>> Fix a format string and remove dead code.
>>>>>
>>>>> Since v1:
>>>>> - Addressed Dov comments (fix format string + style):
>>>>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg739239.html
>>>>
>>>> Dov, since you sent the same patches/code and sign them with
>>>> your S-o-b, I added them here too, is that OK with you?
>>>
>>> Yes, thank you for that.
>>>
>>>>
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>    hw/timer/hpet: Remove dead code
>>>>>    hw/timer/hpet: Fix DPRINTF format string
>>>>>
>>>>>   hw/timer/hpet.c | 23 ++++++-----------------
>>>>>   1 file changed, 6 insertions(+), 17 deletions(-)
>>>>>
>>>
>>
>> Applied to my trivial-patches branch.
> 
> As Dov makes more comments on a patch, I've removed them from my branch.

Thanks. Let's follow up with Dov patches.

> 
> Thanks,
> Laurent
> 


