Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGNFg-0008DQ-Qd
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 10:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGNFf-0008DH-Pk
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 10:08:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGNFd-00059v-Ih
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 10:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599746916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t9rwAF9aA7tjqUjoLtzS1fgHPnMnB5K89LDcUIfAi6U=;
 b=B6gl9yl+s7Nxq5Ii2Zz6Wd9/6GOLjhtzeXefiCNU6Cmp8QGqjs2XPPHetk1G8x9wsI6Osp
 UCdLM7vLQKtYBWw8DSjAHYgJ7aIIl4fvULaNEf6qAmKK3tqb5pZXkbX7pIN31TcNnnuiS+
 MfnlltGZjqu99UW4c5o2tPg7b3Ht9WA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-pzV7xlYdOKKp6grYbOp2aw-1; Thu, 10 Sep 2020 10:08:34 -0400
X-MC-Unique: pzV7xlYdOKKp6grYbOp2aw-1
Received: by mail-wr1-f72.google.com with SMTP id y3so2291087wrl.21
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 07:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t9rwAF9aA7tjqUjoLtzS1fgHPnMnB5K89LDcUIfAi6U=;
 b=Sv2V2wJHZ3Zkgdh038pj9BJafOR/5THIAo27fYuJ4/cBGaTKuWX8KoqqeABsmvprqf
 CXoQK93qewRUJrL4iu0OKcJwYIYZ2MAuAf/VUevmKSHjm9C7BJfVhcYXbaPdFUMQL5kD
 rwTvupCzt0XrBZZizhEVEXAvf78UDGyOoD+qHSRA3x/NeUeCX1L/TFlglAe0cDxsUVON
 ydD5ep5DziEJp45doJBmVROA803ONKVz6JIJUsXnkWkEGscRBJNVPvAja4GR+KswO8ZI
 UQx+XPt2uEGX3MqD4tO2PX/wtqfWVciWfgS/noPb0YzaZz895X99/2Ji5ZbrHHF6bFFQ
 xQZQ==
X-Gm-Message-State: AOAM530s7eGOmoHEJs7Tx2mrHIedL1QQZRUJkqkwrctqeZBYXw66YToF
 jUnYNeDG9pY6Lrn/hYxFv/DtuBZrb8tPrKcVJNBlPZZOZI4Woc40mh7Lf7j6zW6Cm6DJP0pZB2Z
 iR+zW7F7Q4Mn0nkMwbQ==
X-Received: by 2002:adf:f986:: with SMTP id f6mr8936151wrr.270.1599746913471; 
 Thu, 10 Sep 2020 07:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb/XH1Rbc33nv9hvMzIYNE3wGeTHU/ESahDwHvPTi6vUNsVBh9PEvDZIbvVjZBBv1vmkxBGA==
X-Received: by 2002:adf:f986:: with SMTP id f6mr8936130wrr.270.1599746913282; 
 Thu, 10 Sep 2020 07:08:33 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id c14sm8900181wrv.12.2020.09.10.07.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:08:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw/timer/hpet: Trivial format string fix
To: qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.vnet.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20200910135852.516809-1-philmd@redhat.com>
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
Message-ID: <35c826f7-bfbf-9e74-ad86-ef2d3262828f@redhat.com>
Date: Thu, 10 Sep 2020 16:08:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910135852.516809-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:35:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 14:08:40 -0000

On 9/10/20 3:58 PM, Philippe Mathieu-Daudé wrote:
> Fix a format string and remove dead code.
> 
> Since v1:
> - Addressed Dov comments (fix format string + style):
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg739239.html

Dov, since you sent the same patches/code and sign them with
your S-o-b, I added them here too, is that OK with you?

> 
> Philippe Mathieu-Daudé (2):
>   hw/timer/hpet: Remove dead code
>   hw/timer/hpet: Fix DPRINTF format string
> 
>  hw/timer/hpet.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
> 


