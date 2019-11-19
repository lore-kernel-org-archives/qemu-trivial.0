Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iX6Ib-0004rE-6F
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2019 11:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iX6IY-0004mg-2S
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:24:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iX6IW-0007Pv-SV
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:24:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57289
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iX6IW-0007Om-P5
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574180652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjysQALhk+U9MIs4/dyzD9AOC+F1VbKkNCYM+APDpgs=;
 b=SIwJ+wG2FMT3+yJmndGpeql0gZYrozaQ/oBMvAHxua/9pfXKruEqqGWyO0qjyEVP8ojXI+
 6fojMH+I+kLkeNkTe9534tGbPi7LkeYphdtUbxIoZiJhrB9HAkD720VU0syV09+6g+fBV7
 ByBkWNZrI0ofy/HeXGEpkq17nu2x+xA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-zFXMOatoPhClS8r6XDBbOA-1; Tue, 19 Nov 2019 11:24:09 -0500
Received: by mail-wr1-f70.google.com with SMTP id q6so18630701wrv.11
 for <qemu-trivial@nongnu.org>; Tue, 19 Nov 2019 08:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jKRhxYVddBJ4HfBKN9Vv6aCtn3nJZeIh4nl5sSKteJs=;
 b=Z3ANlx0SI0qns6+zLqJGLUJ+PX7VLcKIZO2t+EQl6aRuOYVhR8IvxMZujzTsYJifIf
 3BYS0ozJIyrQVoaY6EgpXntPF1saaaeKN8drGHAEhl4OCeWZnU21XOm30UyikgKEe4y1
 5792mVMBLzq1KWvdLCwL9C+G1LZslBgclgK2ZgmtZPg5lbKKaRMXpXJrl4EVArIoo0RY
 GNeUJ5AK9/RVgjC1Z92LNNQdR0/ZDgsz3sWXAiYFo+L4um0xbJi38qpWDkRfLypnLyVf
 FqoxH7D7p8GSYrZfKQC0BIJPUR2rMk7eNBeT7pHC21hDiuG5MAceC3uAEEfvqqPf2b30
 6naw==
X-Gm-Message-State: APjAAAWdmrLx3k6XOj15K7c4c0HGIKPDUAfkAnEd6ahz3WJJTu/9jUKF
 dEgjHdxH9oDwIpwwyhoW+T/t38nQgimdHkWtL2NHyK3IQiUCDZLyJOzMVgGVwOHomIs+vPSgdqc
 Aldoh13OygqxHKzCB+w==
X-Received: by 2002:a05:600c:294e:: with SMTP id
 n14mr6562065wmd.18.1574180648801; 
 Tue, 19 Nov 2019 08:24:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwuwCf32+G1yVoTW4lxfXbu8F7JhgX8kaHWDQXhJeelptkKnvfjYYMwxJKCQDrHC9Qp/0haw==
X-Received: by 2002:a05:600c:294e:: with SMTP id
 n14mr6562027wmd.18.1574180648612; 
 Tue, 19 Nov 2019 08:24:08 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id x8sm27445666wrm.7.2019.11.19.08.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:24:08 -0800 (PST)
Subject: Re: [PATCH v4 0/2] hw: Remove dynamic field width from trace events
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191118222746.31467-1-philmd@redhat.com>
 <20191119162112.GC229732@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2a3704c-da84-5f88-14a3-74c0d6bd38c3@redhat.com>
Date: Tue, 19 Nov 2019 17:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119162112.GC229732@stefanha-x1.localdomain>
Content-Language: en-US
X-MC-Unique: zFXMOatoPhClS8r6XDBbOA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 19 Nov 2019 16:24:15 -0000

On 11/19/19 5:21 PM, Stefan Hajnoczi wrote:
> On Mon, Nov 18, 2019 at 11:27:44PM +0100, Philippe Mathieu-Daud=E9 wrote:
>> This series fixes LP#1844817 [2].
>>
>> (Eric noted in [1] the dtrace via stap backend can not support
>> the dynamic '*' width format.)
>>
>> If they are trivial/block/tracing pull in preparation, this
>> series will be happy to be taken, else it will go via mips-next.
>>
>> Thanks,
>>
>> Phil.
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04720.html
>> [2] https://bugs.launchpad.net/qemu/+bug/1844817
>>
>> Philippe Mathieu-Daud=E9 (2):
>>    hw/block/pflash: Remove dynamic field width from trace events
>>    hw/mips/gt64xxx: Remove dynamic field width from trace events
>>
>>   hw/block/pflash_cfi01.c |  8 ++++----
>>   hw/block/pflash_cfi02.c |  8 ++++----
>>   hw/mips/gt64xxx_pci.c   | 16 ++++++++--------
>>   hw/block/trace-events   |  8 ++++----
>>   hw/mips/trace-events    |  4 ++--
>>   5 files changed, 22 insertions(+), 22 deletions(-)
>>
>> --=20
>> 2.21.0
>>
>=20
> Will send a pull request today.

Oh thanks Stefan, but it was getting late for the RC tag so I sent a=20
pull for these patches via mips-next a pair of hours ago:
https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg02894.html


