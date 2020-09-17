Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIttm-00050C-DW
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2020 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIttj-0004xM-Vn
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 09:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kItti-0003Sl-Hm
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 09:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600349065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fqyawq+HwXsxtkAQykDYORdhLzpFB2PmyP1Ahi0DabQ=;
 b=BW6RP0X0PZNSBjWy2G+ef7OZlnjnjbT6x4PXagnzOzILdQ2QZ2z4i5Po0OR1E21tK/Vrdk
 neDoQWJ0KKNVmqPa+JlfP7BmDjsr2R4+5dCkAwwMSAeJLXYunCxQOfIZy37JdWvi+tBElu
 OFUvbN36Qh/aOF/FD1GJhWxXpJ4o5aA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-BiN8uQsGMTmEzJCV2kb6gQ-1; Thu, 17 Sep 2020 09:24:19 -0400
X-MC-Unique: BiN8uQsGMTmEzJCV2kb6gQ-1
Received: by mail-wr1-f70.google.com with SMTP id l17so872521wrw.11
 for <qemu-trivial@nongnu.org>; Thu, 17 Sep 2020 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fqyawq+HwXsxtkAQykDYORdhLzpFB2PmyP1Ahi0DabQ=;
 b=JPrM3N5oP+m35Je1tRem92nyFGhSSQsLLem9UW9mG9R64y335U8lfTdjsJUVehONuS
 EYMtqps5nFoSj4GRs3Rlccz3q92rgEm0bP7jfozPQz6ylQ9B78rWuAdKAGPDfbpO/HRH
 3dE7sj/JEISWUXfwd9DdINL48Px58rV+H+gGmEmPOGkMB7SPv4i4/5z7gSXOmK0oGALl
 7EpaELPwpPJBAvEstc8xRV2V9/ut/XLo419CoHJFBb7EKkORpmrtW3buTeAJeNOw23vf
 tD5IJt5auOX2mziqWpsyFiqW0t8f2Hbp6PB/eUyPHJKT+hzQKezVZuDZBY9pB5l854JR
 tjXA==
X-Gm-Message-State: AOAM533MU1tUOilkfrBowRPTyKUObs8izshVeDdz2mR+AvpKcnMKJmgX
 6uy50zcDRmSXgnE6E6PS3hOpQeUaOIr2iML5xIa9G2kLRZk1+UO3/n9SCmIJOD0E0LBbBTCCKEC
 1fJIPRvH/D7+VjxARIw==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr10473171wmc.165.1600349058314; 
 Thu, 17 Sep 2020 06:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmS8I/LcybxCt+LPNwaBjJtBYKs/ADaiRyC026kIK862rkaQwxFew84KdCE8Fnlais78MAOA==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr10473158wmc.165.1600349058113; 
 Thu, 17 Sep 2020 06:24:18 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id s12sm10525774wmd.20.2020.09.17.06.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 06:24:17 -0700 (PDT)
Subject: Re: [PATCH V2 00/10] fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20200917035413.701-1-zhaolichang@huawei.com>
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
Message-ID: <ec479ded-9c4c-a25a-5334-e404942db794@redhat.com>
Date: Thu, 17 Sep 2020 15:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200917035413.701-1-zhaolichang@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 17 Sep 2020 13:24:28 -0000

On 9/17/20 5:54 AM, zhaolichang wrote:
> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors, this series fixed this
> spelling errors.

Your name seems mis-configured in git (it displays it
as an username).

This should be fixable using 'git config user.name ...'.

Regards,

Phil.


