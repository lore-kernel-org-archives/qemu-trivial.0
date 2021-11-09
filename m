Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkMm6-0005U1-ND
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 03:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mkMm5-0005Tq-NA
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 03:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mkMm2-0005d1-Bu
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 03:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636447592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zLtzys+7RCs6V5goavrFsEUqQMtumeSE1loZTDrvEY=;
 b=gBNbmNlI49Yt2E7pyKKXKYVq2YwdodFfYD7hxZ3Y1dFiVU4+50p5kk2L6A4fo2dLCkm8Dx
 MUvkAazf6zuknJjKbbMCmROYJvLAbZg8t3ILsfA+ImJjul8x+WvE7kqNvq4quE7FSptiV6
 Q/mIIfHkb/TTzXLY6zDgFdChet1GQBQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-DbZnq6kVMh61kvSMbk5UtQ-1; Tue, 09 Nov 2021 03:46:31 -0500
X-MC-Unique: DbZnq6kVMh61kvSMbk5UtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so7383741wmc.2
 for <qemu-trivial@nongnu.org>; Tue, 09 Nov 2021 00:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5zLtzys+7RCs6V5goavrFsEUqQMtumeSE1loZTDrvEY=;
 b=pArifk1xTeWOHNsajtkkz4oH6Ru1kKCP9FT/APh6xSwknXnYnKUSzf8XrcpRkTCiVp
 Z3+VMSafw7jPXvwo8oiY2hq/bcHxxvwytMm+RQj7MK4ZpE/cVJua6IHGrpm7lK1f5Tv/
 OpqyJ4d0O/24UNsQD3cIU2osEfa4O8+lAuNFvVHOhQ16qJmX1Lfv1VlTX5PH2WsQ0LXZ
 K3/NIj3TlKrSr2gsPM3n1PB27HPONAp5LSEZFs9fZxXibAAny6gFglaDyKYnddpnbjkj
 Etl4Mso1CCeLkUlzetSNnoErBwsnNX+B1Ppk8tdBViHtlJql+/RLTu65/WpAmgBfVdyn
 D02A==
X-Gm-Message-State: AOAM533pvQOyLo9GoRN3LOmMW8r+ojECbAWe7i4RTxT4YXR0KCvFDvUU
 bxQPa5mT9ilVNvqrswsVhimEWRC1xIkNPZYq8XQhcGPkacLJLhWwVAWWrMq7STp6POTT7vSSRiQ
 0bawOv6NfyDAjJJPDdw==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr5131027wmi.107.1636447590420; 
 Tue, 09 Nov 2021 00:46:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0jXJYfrQFNq7bMJAlyugDcZjl0qmnsaEW9ZbY654ckJjYgcwU3LmQaqs9aBnIK1GwAoVAvw==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr5130993wmi.107.1636447590214; 
 Tue, 09 Nov 2021 00:46:30 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f19sm2353153wmq.34.2021.11.09.00.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:46:29 -0800 (PST)
Subject: Re: [PATCH] device_tree: Fix compiler error
To: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20211108200756.1302697-1-sw@weilnetz.de>
 <c99a3838-7cbd-e6aa-742a-b943d3e460a5@linaro.org>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <13855c06-701b-178e-7930-e046633d3398@redhat.com>
Date: Tue, 9 Nov 2021 09:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c99a3838-7cbd-e6aa-742a-b943d3e460a5@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 08:46:37 -0000

On 11/9/21 9:38 AM, Richard Henderson wrote:
> On 11/8/21 9:07 PM, Stefan Weil wrote:
>> A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:
>>
>> ../../../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
>> ../../../softmmu/device_tree.c:560:18: error: ‘retval’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>    560 |     int namelen, retval;
>>        |                  ^~~~~~
>>
>> This is not a real error, but the compiler can be satisfied with a
>> small change.
>>
>> Fixes: b863f0b75852 ("device_tree: Add qemu_fdt_add_path")
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Though I think there's a good deal that could be cleaned up about this
> function:
> 
> (1a) Remove the unused return value?
>      The single use does not check the return.
> 
> (1b) Don't attempt to return a node, merely a success/failure code.
>      Certainly the local documentation here could be improved...
> 
> (1c) Return parent; make retval local to the loop.
> 
> (2) Merge p and path; there's no point retaining the unmodified parameter.
> 
> (3) Move name and namelen inside the loop.


(4) swap if() bodies?

if (retval == -FDT_ERR_NOTFOUND) {
} else if (retval < 0) {
}

Michal


