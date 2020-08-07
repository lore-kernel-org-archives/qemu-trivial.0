Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k42go-0003rV-3a
	for mharc-qemu-trivial@gnu.org; Fri, 07 Aug 2020 09:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k42gm-0003rH-Ts
 for qemu-trivial@nongnu.org; Fri, 07 Aug 2020 09:45:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41965
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k42gl-0008Vg-AA
 for qemu-trivial@nongnu.org; Fri, 07 Aug 2020 09:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596807938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=O1Edmj+bV3CWXw6Ac93lzEdvaLuoW5JWiHIkSSUx3Ys=;
 b=eC5uqPD013A1l5VU+IR1Kv1NM1c19Rsqp2LH9DX7VQ8qVeP1Gzttm4KKJ01ygm/8YX6v00
 J2dY6NXzGau6BUxVqUd5G9kNPvfipeIuN5ayGXLiQn6RHn2oSOmkeZJRXsPF5/yTORWqBA
 yAoGJZjcxVuz2+3AGKRgz0e5xq5mssE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-F5P7XNM8Mh6zxX4CmiNUGw-1; Fri, 07 Aug 2020 09:45:37 -0400
X-MC-Unique: F5P7XNM8Mh6zxX4CmiNUGw-1
Received: by mail-wr1-f72.google.com with SMTP id r14so779831wrq.3
 for <qemu-trivial@nongnu.org>; Fri, 07 Aug 2020 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O1Edmj+bV3CWXw6Ac93lzEdvaLuoW5JWiHIkSSUx3Ys=;
 b=UB5V6N9a+BHoU6ld+4qhs8a4xqYX3t1sqJ4+gRJPMaqwspMpke2nhYgZMjwshELzRW
 7tWWOQD1uf6Q+BICaR+tIopu2p01H77tx1cdaibyXvrxTSLUB+w4mq0eo7eZcHeKpltr
 CJj6NP4lIdJlxkvwWjstvIF4EGYVImuDsgGA5YqL1yNXpIafhlRW5rzTv1TEgNjw9O7m
 QLXKSMU+h8UswNGKF1MJud0esqZcdKTZ4c+dVY5OBIDH3QEid2GQKA89s8E0SNsgSUch
 j18uRv+9/50KQetgkos2/7mrZYG5BXBvwW4agQscANYdtPPXEyPlD6nxE1zo9d6iD3jq
 mBQw==
X-Gm-Message-State: AOAM53152FSAyO1pk9JWTapyLK8cZpzq8mnPnNMZStegGf5UQK+RpXYG
 fT3FljDbvYfZJjobcUeDb63zXKVT1vBzUOkSWkqhS6okGtWwIJQFb6coc1xIOae6nRGoFWOU9pf
 P6/dzgMjRvkwCDxGjpw==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr12360097wrv.331.1596807936022; 
 Fri, 07 Aug 2020 06:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv13B5dkSJG7UQdOfpIYDiRQa+w2PrJWz9regTxjT1Z27IIojzlIHj8H9wbwWSLmlk8MFrJQ==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr12360079wrv.331.1596807935813; 
 Fri, 07 Aug 2020 06:45:35 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id w64sm10955035wmb.26.2020.08.07.06.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 06:45:35 -0700 (PDT)
Subject: Re: [PATCH] docs: Fix broken links
To: Han Han <hhan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu
References: <20200807101736.3544506-1-hhan@redhat.com>
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
Message-ID: <398abb60-998d-beae-2d1f-76d831824730@redhat.com>
Date: Fri, 7 Aug 2020 15:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200807101736.3544506-1-hhan@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Fri, 07 Aug 2020 13:45:41 -0000

On 8/7/20 12:17 PM, Han Han wrote:
> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>  docs/amd-memory-encryption.txt | 4 ++--
>  docs/pvrdma.txt                | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


