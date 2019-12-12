Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifCGB-00005F-1O
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 19:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifCG8-00004r-Fc
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifCG5-0003lg-BJ
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:23:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42837
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifCG5-0003iB-4L
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576110187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EymNOX1NegcNNMtrmpakBYZhnf2kxB4QYRfKgyeUGI=;
 b=RRSxO+42Qjh6myxgBLemx95MnbCQGx7pBm0v8k/WIbr/AWMw7omdDXgd5bosqbw9jYk90j
 eDrzjkLebvkRNxQC7TmU+3wJFxp6KNxRYBMFWXhNA3HIAf/oTNxi8l7bLCQ0A3tqF4akCO
 6vgyGOQIUUVu9QQASds+3DyvqgUQHGE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-n4EQMsmrPnGUwjFatLbqAA-1; Wed, 11 Dec 2019 19:23:06 -0500
Received: by mail-wr1-f70.google.com with SMTP id b13so289765wrx.22
 for <qemu-trivial@nongnu.org>; Wed, 11 Dec 2019 16:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2H/gWN4eszVbxFGkp/8hevIVOCaI4aQnjh5/iVFB6Sw=;
 b=sLUZkdiuVX4JZw8RtCjYTVBGaQ7xHyQlP0IzcoFGTg0KoWB23W2+udYStZkww9BLkf
 SwqxmXnYdsEkzvis7pj62KK13cUazjUFhVzzpdAl4PZtGBrzgZTjAmrTsQ8fMLNfwMl2
 qhB7J71V3kMoJm4qpiUiX06TVau+naARZKgdSrS4K0LR6dUKVMEbqSeFfkdkPhs0QZoC
 DZzcLLVxeNuEZr00HESwNNeYzoTrwaUBic2tEVIMb++x3W/dQqOkSg+qjM9ahylsaksn
 YiHuQ8ehGAQPPdrcUwNHrM5WBIxZ97fLZGiwWNhriyPPPv6SbVjCBEKqRozAlesgQEs5
 d1NA==
X-Gm-Message-State: APjAAAVMiMDknfLiHArD0+8rNENoMlEf+770lsaDiE5Vivelqy3R+oh5
 kGVv1iV1szCsBKrTE7m/51mRSj6xUubecA1fQ26G49g5zSrnEMGx9TKluJUH1KN6F32VwhNMygM
 5MLFRi77Ns6nN9GesJA==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr2784969wrr.183.1576110185131; 
 Wed, 11 Dec 2019 16:23:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxB3wC52eTFf5o7/Tmz8X1+KGruT5nzFJmGPB0CprDQxkNXd3iOhZbCSnBKHhKywavADzvzNQ==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr2784952wrr.183.1576110184884; 
 Wed, 11 Dec 2019 16:23:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id n3sm4212734wmc.27.2019.12.11.16.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 16:23:04 -0800 (PST)
Subject: Re: [PATCH] tests: fix test-qga on macosx
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-8-git-send-email-pbonzini@redhat.com>
 <6738c39d-bab8-fcc8-7508-a9ce90f68d7d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <70855d65-bafa-c349-c1f8-593a29829bc6@redhat.com>
Date: Thu, 12 Dec 2019 01:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6738c39d-bab8-fcc8-7508-a9ce90f68d7d@redhat.com>
Content-Language: en-US
X-MC-Unique: n4EQMsmrPnGUwjFatLbqAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Thu, 12 Dec 2019 00:23:13 -0000

On 11/12/19 20:12, Thomas Huth wrote:
> On 11/12/2019 15.23, Paolo Bonzini wrote:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Fix Unix socket connection & skip commands that are not implemented.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  tests/test-qga.c | 25 ++++++++++++++++++-------
>>  1 file changed, 18 insertions(+), 7 deletions(-)
>=20
> Don't you also want to enable it in the tests/Makefile.include ?
> It's currently fenced with CONFIG_LINUX...

Hmm yeah, it was a hidden change done by the Meson conversion.  I'll
send v2.

Paolo


