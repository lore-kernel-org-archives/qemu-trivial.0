Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9nwf-0007z4-8H
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9nwa-0007u9-GS
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9nwZ-00055T-K5
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:41:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9nwZ-00055G-Gw
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583404891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmLC4b12XTxzP57sXHDVgOgViZpcGvkmxbLtZBK6IdQ=;
 b=JbJoBv9TuHwo+G/RCd5j9kCn14TdF02UeU3SNf2Ru5Oz9CbNCL7DxPVpPzILodeFgZ29Kr
 kPmCZ4VzRVaLwptVFebc6U7mGvp5nQfh+ZKOV+whIaYeagd6vNqqTXcLG+LMPr02kszes+
 73URA4U/zPc3YD6QVjC+9TZGQYAOMek=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-XfgyWUU6OSeP3M7aHOEHew-1; Thu, 05 Mar 2020 05:41:27 -0500
X-MC-Unique: XfgyWUU6OSeP3M7aHOEHew-1
Received: by mail-ed1-f72.google.com with SMTP id g11so4038192edu.10
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 02:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmLC4b12XTxzP57sXHDVgOgViZpcGvkmxbLtZBK6IdQ=;
 b=GuuuUl/B4l8Uws5uGYDkConqyETxwlIjAuHZNZgqeDGsoFllJXNpWwyRmScCRc7otX
 2LnuIKUH6hh9xFZm4nq8hw8paMvatbthunYFtU2G9rvYs9u22RapnixtR4mFLQGh7U7q
 zG9a+LWLHNGcQVZ14j5hI1xy7vpgX423e5UI0MQ6ApnDYSGn12/2qndHoLBcVSIKfrfx
 QYZEIWeJBXmuSw/6nQs7vnbxJYfrAxBYo1Y4ihi3O0XYEcXjDmMqQGsqCdNho32fs9kV
 iwp4mJ5Ncx+BWIXONBCpq6Z/uBTRzRe+ZUjeypRVATzhfHfkuz9YyvipAr/VSk2mgpY3
 MVuw==
X-Gm-Message-State: ANhLgQ0FCWSf334yGsnGV7OGmFtYlebDBMe53AGLT05eHishIiqYod4m
 /cFfu4uuEvhelhJemqujfuFiIBIdsFNF/rn7h2KjVjoYwNSn9+9WhXvrq8xZup1DKURUBWspbS3
 dzFvgDFESwINBysBrRQ==
X-Received: by 2002:a17:906:5ad4:: with SMTP id
 x20mr6608843ejs.293.1583404886260; 
 Thu, 05 Mar 2020 02:41:26 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsV7I3mvBTwte234Ehaj4XE0ujfKMtQ2wTgDI9rm7V6mebm8h1ZiQAiH925GE/qw14otJ4T0w==
X-Received: by 2002:a17:906:5ad4:: with SMTP id
 x20mr6608823ejs.293.1583404885963; 
 Thu, 05 Mar 2020 02:41:25 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id 18sm1278254ejj.63.2020.03.05.02.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 02:41:25 -0800 (PST)
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata by
 10KiB
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
 <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a5b6cddf-5887-be27-db76-2e515daa2c11@redhat.com>
Date: Thu, 5 Mar 2020 11:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 05 Mar 2020 10:41:33 -0000

On 3/5/20 9:02 AM, Gerd Hoffmann wrote:
>>   struct usb_device_id {
>> -    int vendor_id;
>> -    int product_id;
>> -    int interface_class;
>> -    int interface_subclass;
>> -    int interface_protocol;
>> +    int16_t vendor_id;
>> +    int16_t product_id;
>> +    int8_t interface_class;
>> +    int8_t interface_subclass;
>> +    int8_t interface_protocol;
> 
> I guess we should better use the uint variants here ...

I tried it first but I got:

   CC      hw/usb/quirks.o
hw/usb/quirks.c:25:34: error: result of comparison of constant -1 with 
expression of type 'const uint16_t' (aka 'const unsigned short') is 
always true [-Werror,-Wtautological-constant-out-of-range-compare]
     for (i = 0; ids[i].vendor_id != -1; i++) {
                 ~~~~~~~~~~~~~~~~ ^  ~~
hw/usb/quirks.c:28:37: error: result of comparison of constant -1 with 
expression of type 'const uint8_t' (aka 'const unsigned char') is always 
false [-Werror,-Wtautological-constant-out-of-range-compare]
             (ids[i].interface_class == -1 ||
              ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~

And went this less intrusive way.

I'll respin with s/-1/UINT8_MAX/.


