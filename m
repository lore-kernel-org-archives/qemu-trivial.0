Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQQbE-0005wf-R2
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 03:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQQbC-0005vQ-Hz
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 03:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQQb9-0008Rn-Ql
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 03:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602143062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L2Ubjsc/gTyKZFufptoYRixH+M6Y+mAewGZQDH/hnSU=;
 b=DM1xRthWoZt8SIdl3R84KsVd6s6yGQNphRqBWTxoRIZEe4c70fffEFlC6WvO0nzoaBFw32
 JqiXXiTntpUk9K4KoU1Pi69+uVUjpwwkH+7mdRuIRfwNERqW3eu4MCagWa4zqDdUkFFCYl
 oveEm4CcwAT4LojHu6rcFsW8cI61Ybc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-pMH1-C8_MdS2CIgRFjp8Cg-1; Thu, 08 Oct 2020 03:44:21 -0400
X-MC-Unique: pMH1-C8_MdS2CIgRFjp8Cg-1
Received: by mail-wr1-f72.google.com with SMTP id l17so3520917wrw.11
 for <qemu-trivial@nongnu.org>; Thu, 08 Oct 2020 00:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=L2Ubjsc/gTyKZFufptoYRixH+M6Y+mAewGZQDH/hnSU=;
 b=ez8y3TCKf3xJtZW9iAMR0bqCFgw3eqV3sG/SqO5n8nmxvJZgMHvaWyy0KqAvJvqKCd
 tQHZ1pkfE40II3fDswlThcovAvtLNBeni1FSvJGtigUieSuiEKmWJVbDXDsOF+uXdxWY
 8h4Qn6vbGub7eqX/bafRMq75jBVjuUOw+eB/SgWcrh2cIGdoUnZ4bufv27VcDL0KNN2o
 lk4P3mX5m9KFPHV/lTOWCjk8UWwCT3ZvssnUHxNh96lvhukxbTHuu05cj7mEtzzTaQbN
 UavhWxuYivCDUuwXk8ZNY/vJ3VFG/uuq6OzcjKofuzFUGROHdki4TcrqSmvi8hvRr/O1
 ylGw==
X-Gm-Message-State: AOAM532Eos+tw57sYqHn06Ew8mqIu4qzaAeCF/AMx9kaRkdaXJ5o4Y2u
 Z1OyDE/mrDdDYiEGFi/KIz9LLH2HtNC1y2j2jRhVJQQ53fk/grg/yDLPLyzws9AV3AGgUWrb27r
 34YwzrfGcuWfq7XnCgQ==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr6004636wrv.140.1602143059926; 
 Thu, 08 Oct 2020 00:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv2aP4iNExcxydOXovSDkY/q1F4CWraOYwBr21RgVryTTYOy9yEYMWFKzccjft7qsnFZitUQ==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr6004614wrv.140.1602143059752; 
 Thu, 08 Oct 2020 00:44:19 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j134sm5773559wmj.7.2020.10.08.00.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 00:44:19 -0700 (PDT)
Subject: Re: [PATCH] qom: Fix "typddef" typo
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201007220255.1170167-1-ehabkost@redhat.com>
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
Message-ID: <3a0f87a3-afcd-93d9-f54f-8aa0942542fa@redhat.com>
Date: Thu, 8 Oct 2020 09:44:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007220255.1170167-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
X-List-Received-Date: Thu, 08 Oct 2020 07:44:27 -0000

On 10/8/20 12:02 AM, Eduardo Habkost wrote:
> Fix typo introduced in the C11 #ifdef for qemu_max_align_t.  It
> never caused any problems because we always compile using
> -std=gnu99.
> 
> Fixes: 4c880f363e9e ("qom: Allow objects to be allocated with increased alignment")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  qom/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index c335dce7e4..125dabd28b 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -692,7 +692,7 @@ static void object_finalize(void *data)
>  
>  /* Find the minimum alignment guaranteed by the system malloc. */
>  #if __STDC_VERSION__ >= 201112L
> -typddef max_align_t qemu_max_align_t;
> +typedef max_align_t qemu_max_align_t;

Oops
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  #else
>  typedef union {
>      long l;
> 


