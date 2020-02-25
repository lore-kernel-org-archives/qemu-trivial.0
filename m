Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6YCu-0007zQ-Lg
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 06:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6YCp-0007xQ-1g
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6YCl-0006kM-Hl
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36452
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6YCl-0006ga-EK
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582629406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BnY+u7s79rAmYLt+X2g5zqRZ/vhE6dNcKt11EC2/4E=;
 b=heVOrsH/fE/LOHo9rei3rKHCNgd5b8XzPbMfs1jwUvJjn+mb7BWuIIg09spM7IwzDGDLrV
 wtREqeThCHTFaMkC/6oHrSKvWG1OliI0gX1YOzKpB0ciVZXjlOUVkmzH9z25npdh5tSf5h
 Tk9ulE5E2RLLjZX+5obPr+HETfMUy48=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-RZZeT0-sM1yLYGpXC1LYJA-1; Tue, 25 Feb 2020 06:16:44 -0500
X-MC-Unique: RZZeT0-sM1yLYGpXC1LYJA-1
Received: by mail-wm1-f69.google.com with SMTP id f66so714625wmf.9
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 03:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mybTY2JMYN6zflQVzeyGn4UvK2wvHyf2BrGcCFX1Jl8=;
 b=oia4XfRPcMfY65ZLiqfiZqPDuAIsTEqNK/g5aIRleFPo7o9O0oSn+TcmCHx6oqW7xj
 OdEYbgPDQ7N6fVkprLeFj/MQJI4g/eZUTffEKh5y+UjL/xz2xgI9igE9463tIN6C90fV
 IA0rhsSAO0LUIH1RwdxJYfNzv/jG2kqka2m1V6rQOG3YgMhCLwjKhMoJfNVA1bNtxOaV
 S4pgXGR0jISJAqpYDG/SDZX0L9RfMBy06+BoWhj5pkSvU9gzQDkpX1y8rT+QjNGiFfbp
 3qamhZzHTkPPtVjPWea1tRVVx9BW2GCvgh5QNbbWIEDneuYIW8XaprmHQLSfUu5dtsv0
 eX6g==
X-Gm-Message-State: APjAAAXW6XTB8jMrUMz55L+qYSVlCSRhVn6JSNaSds9fkURXHrgu1SeU
 x4ImrKgEfBbFMQkT67jCm7xbAiH1/RClDEBMTbuc1e59C/iq+s0qq8jid7pwlvpy9qVamo7rME4
 /8FqvUudkf0PQArAlOg==
X-Received: by 2002:adf:c445:: with SMTP id a5mr1777295wrg.14.1582629403709;
 Tue, 25 Feb 2020 03:16:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjIQfd/kPRxuwRCkxqYF8ia2cNean9hsKYlHTZi9oRlrGSkzkDFOUkfllGF0zTOSJpl7TYIA==
X-Received: by 2002:adf:c445:: with SMTP id a5mr1777273wrg.14.1582629403547;
 Tue, 25 Feb 2020 03:16:43 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm23898793wrq.92.2020.02.25.03.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:16:42 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/arm/gumstix: Simplify since the machines are
 little-endian only
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-2-philmd@redhat.com>
 <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ac5c707-c34f-b374-d910-e5d73ba8c327@redhat.com>
Date: Tue, 25 Feb 2020 12:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 25 Feb 2020 11:16:54 -0000

On 2/25/20 12:12 PM, Peter Maydell wrote:
> On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> As the Connex and Verdex machines only boot in little-endian,
>> we can simplify the code.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>=20
>>   static void gumstix_machine_init(void)
>>   {
>> +    if (target_words_bigendian()) {
>> +        return;
>> +    }
>=20
> I don't think we really need to do this, do we? We don't
> in any of the other arm boards that just assume little-endian.
> I think TARGET_WORDS_BIGENDIAN will only be true on Arm for
> the BE linux-user targets, never for softmmu.
>=20
> Also, there's a warning comment in the header file for
> the declaration of target_words_bigendian() that says
> you probably don't want to use it...

Yes you (and the comment) are right, we should not use this call in=20
target-specific code.

>=20
> If you drop this, then otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

>=20
> thanks
> -- PMM
>=20


