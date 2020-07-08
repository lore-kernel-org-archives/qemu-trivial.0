Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtKwF-00079o-8y
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jul 2020 21:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtKwD-00077S-WC
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 21:01:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25164
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtKwC-0003sB-1B
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 21:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594256479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SP7p10zQCTFQ0IeMD+wPAl0MwWTRVAjofBdESwNrtUI=;
 b=ALd9ZcF+B5XA4cKgd++ecDRBWCxTCKa6MbVAqqIuIrKjH0l7rq+dGmVjxABTixFeLkXyKV
 vQ3opHY60OEhqpQ6QczXceBafO6Tli0rVvFYTrc3adaejh9792jcWS96IlO3ky9ScmhEj0
 vecESFAIZS0idinZMsuxpqdx2KT81ZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-KUFvTb4UPLqWBrhRypOQrg-1; Wed, 08 Jul 2020 04:57:34 -0400
X-MC-Unique: KUFvTb4UPLqWBrhRypOQrg-1
Received: by mail-wm1-f70.google.com with SMTP id z11so2253401wmg.5
 for <qemu-trivial@nongnu.org>; Wed, 08 Jul 2020 01:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SP7p10zQCTFQ0IeMD+wPAl0MwWTRVAjofBdESwNrtUI=;
 b=uXALtx4m3mMLsO8ktKA/+WGEP4pQDLyUjXYYFLCkr3Bk6igR6nGKaBz6yS+XVu87Tu
 0fZs9mVO1Il/9jjsBfRqcWhCw6N6u2UWSEjjo+qX8Yg9OSgH8XCFO1MRdtiIrFVp/6Hf
 VsGUY1FSYmnjF753tgkoqE9KxOSAYaOJWmocLqBxXuNQg7z+gCbYHZUBKXMjNmAUN8bw
 Gs69VfBZWVFZnpJ+so5YpSqSxXqGBfU1sVx6IdtIjjwM8nBElAEBWXrUt5vDWJjlKHOe
 7YgEWT/34xWUT4FbTZva7CoihCF0Emlrf6dm9PhfgU+w7+RKAL5Zh+6SqoeJ7XK7o0cf
 IJCw==
X-Gm-Message-State: AOAM530Awo2z8szav+42T3F8VdyPlc+LsczEGpRi/h5CCbPLoMLPo/B8
 PM4kD+d12ki7WmF55O912TE3T0aEekc5DR9EJ5ZoIUicCi/eHXfFpO+z2xViN+YRk808CEcLzVq
 pmHpAs97Cz2oKaOFgIg==
X-Received: by 2002:a1c:dd86:: with SMTP id u128mr8251369wmg.123.1594198653528; 
 Wed, 08 Jul 2020 01:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Us5m2JT1t8/6MrVDBKMynH7y2zThyqANYVV5x0fIpjL4/Bfibc4V1x+Kip3wPDCvcbzoPQ==
X-Received: by 2002:a1c:dd86:: with SMTP id u128mr8251353wmg.123.1594198653291; 
 Wed, 08 Jul 2020 01:57:33 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id q1sm4679275wro.82.2020.07.08.01.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 01:57:32 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Cover the firmware JSON schema
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200703183450.32398-1-philmd@redhat.com>
 <20200708024434-mutt-send-email-mst@kernel.org>
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
Message-ID: <3dafd514-f66c-96c5-3217-86ef990dda1b@redhat.com>
Date: Wed, 8 Jul 2020 10:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200708024434-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jul 2020 01:01:22 -0000

+qemu-trivial

On 7/8/20 8:45 AM, Michael S. Tsirkin wrote:
> On Fri, Jul 03, 2020 at 08:34:50PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
>> Add an entry to cover firmware.json (see commit 3a0adfc9bf:
>> schema that describes the different uses and properties of
>> virtual machine firmware).
>>
>> Cc: Laszlo Ersek <lersek@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Kashyap Chamarthy <kchamart@redhat.com>
>> Cc: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> 
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Thanks Michael. If you plan to do a pull request, can you
include this patch please? (modulo the weird UTF8 mojibakes)

Else it can simply go via the trivial tree.

> 
>> ---
>> Since RFC v1:
>> - Added Daniel & Kashyap as reviewer
>> - Added myself as co-maintainer with Laszlo
>>
>> Based on a comment from Laszlo:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg604925.html
>> Background info from Kashyap:
>> https://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg01978.html
>> ---
>>  MAINTAINERS | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index dec252f38b..64bcea658d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2601,6 +2601,14 @@ F: include/hw/i2c/smbus_master.h
>>  F: include/hw/i2c/smbus_slave.h
>>  F: include/hw/i2c/smbus_eeprom.h
>>  
>> +Firmware schema specifications
>> +M: Laszlo Ersek <lersek@redhat.com>
>> +M: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>> +R: Daniel P. Berrange <berrange@redhat.com>
>> +R: Kashyap Chamarthy <kchamart@redhat.com>
>> +S: Maintained
>> +F: docs/interop/firmware.json
>> +
>>  EDK2 Firmware
>>  M: Laszlo Ersek <lersek@redhat.com>
>>  M: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>> -- 
>> 2.21.3
> 


