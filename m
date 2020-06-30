Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqBv2-0005Dj-Pb
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 04:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqBv1-0005A8-2a
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 04:47:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57261
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqBuz-00007c-Ak
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 04:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593506824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W3b/qTeenEtl21pNKmDf1cpErOMxHMaHRIktFWkMxSo=;
 b=U/pPl7eXSeTj+xh+9x1iowUJ+7E3+cXfh/d5wBP1M15FXGLkN1n3doHvPZjRi9U2lhCqfe
 3KNT/I2QGI/x6e8O3PkPk24CodKT5tZs/Z4pR5IPE7zc8iHnno1sjlpnBS8TTVKhmF5qlu
 f4jvOpw3D8ITizqo5IjYQd7HjvEGYdM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-OmVvwWvPNvuSdn1tikmcew-1; Tue, 30 Jun 2020 04:47:03 -0400
X-MC-Unique: OmVvwWvPNvuSdn1tikmcew-1
Received: by mail-ed1-f69.google.com with SMTP id da18so16523928edb.13
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2020 01:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W3b/qTeenEtl21pNKmDf1cpErOMxHMaHRIktFWkMxSo=;
 b=Xrcpfahwnz0pJT8yu0FHNAM9ZyAdZ5QrKsJLRwPqJhCOtzX/j68HWp/+ix4bkytW/V
 FKKpitbW5pFY+Gk5qClA3QkSZISXb4Ux3N8D0u3ZiD0Wpn883z4SnNUc/51IRhRS32TR
 xBt4V/Qbs2wn6540iiZLdyXRktFJgGhhppwcQtm7nfxH2aDU8SEdP8H9NzPMocTP+J9S
 v9dDa+frEhZQ5pu7XTAxiDg54jZOxFCJsOlQOaJdGvLg7xdaQHf375eBxz66mMv6clLA
 JmLCNifc2I88hQiBDAixiuIwBHKLGnV2gOEyXi1LOrxK4g9owRen/jmuSD12cdpjt4Qq
 rHWQ==
X-Gm-Message-State: AOAM533WpWWE9ewnRWopNbFjYGaor6EnoUrmmCRSFbM1VOvFjI/UbwEN
 1tNeg8aNp6MSx7afv6Mf+cjBHdCN7ugiU77taCXXxulZ+5YPv791yjC1UP+t3PDeYoprGQlII+s
 OQvp9uPoaBq0KIRJA8Q==
X-Received: by 2002:a50:f418:: with SMTP id r24mr16670877edm.382.1593506821858; 
 Tue, 30 Jun 2020 01:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvK3ZzbDLQxQEReBmRbECL5H97QHOxX2C3nCwT4Q4CClNWIO8ETEGbBkEof8qEAE9WhDI/HQ==
X-Received: by 2002:a50:f418:: with SMTP id r24mr16670861edm.382.1593506821700; 
 Tue, 30 Jun 2020 01:47:01 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id dt22sm1574019ejc.104.2020.06.30.01.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 01:47:01 -0700 (PDT)
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
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
Message-ID: <a482bd09-28c8-7de7-de06-dba60d1c8160@redhat.com>
Date: Tue, 30 Jun 2020 10:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 08:47:07 -0000

On 6/30/20 10:23 AM, Gerd Hoffmann wrote:
> On Tue, Jun 30, 2020 at 08:44:24AM +0200, Philippe Mathieu-DaudÃ© wrote:
>> +Gerd
>>
>> On 6/29/20 11:48 PM, David CARLIER wrote:
>>> From 157a0374093371719de42e99364352d64190f52a Mon Sep 17 00:00:00 2001
>>> From: David Carlier <devnexen@gmail.com>
>>> Date: Mon, 29 Jun 2020 22:20:06 +0000
>>> Subject: [PATCH 7/9] Skipping drm build, unsupported.
> 
> --verbose please.

David has difficulties understanding how to send patches,
so you missed the cover/context. This is for the Haiku OS
which apparently is POSIX.1-2001 compatible.

I don't know about DRI-1.0, maybe it is POSIX.1-2008?

>>> -util-obj-$(CONFIG_POSIX) += drm.o
>>> +util-obj-$(CONFIG_LINUX) += drm.o
> 
> Can't see anything linux-specific there.  Also note that FreeBSD (and
> possibly other *BSDs too) have drm support.  So CONFIG_POSIX looks
> correct to me.
> 
> take care,
>   Gerd
> 


