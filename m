Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnHkc-0002QF-Rx
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2019 03:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnHka-0002Px-Pd
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 03:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnHkZ-0006gT-Oi
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 03:19:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hnHkZ-0006fs-IX
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 03:19:47 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so16485132wrm.8
 for <qemu-trivial@nongnu.org>; Tue, 16 Jul 2019 00:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tnVNqHoiSgR4rP6XelwFnflFmdAT2038/qPRxCmlvno=;
 b=j3BHz9fL/KAyW9/iTYsvKhNGoMV6NCd6jCC3eI/RXVFYa3akKc/FsC+qfa3oV4OoCs
 WrQb1aT+V/tEccVzg+6zzPz7iO90RmJ9k+Rtb92gMS2TLkP8MtTZsJ+N3fa24LfPRV6P
 ImDbHvMSWJtdBYfLbOWyNmlsfEQimz+lhCX+mtiFYB/7AeA4Zhh5UxHhnFIJ6sGHdIOX
 iOJZK256pgs/o2qpEnfFYVqHCL2L6weBy68CSC6NtcC9lpH0oUQktNcotGT+/kiBgdBB
 CC6lVpS+aa5jrAOs99m45R9qJs0jXcx8gAD4XFThxtiPd4HAYCYrlnsgXCXWU6y/nQms
 b1jA==
X-Gm-Message-State: APjAAAVIzhDbellr7IxkKU7FU1Ppz5ZvLqKEUd//RaFF2hhM46soM67s
 cAUHLW0WwR+zm7voZQxJLjCyyg==
X-Google-Smtp-Source: APXvYqz3/yzb20m4x1/IIV8ME4b+bSJCzY12Z8Y1T1903sJ5pG/ndWp0ZoUBtG6yZSbpdJHoK/Ddbw==
X-Received: by 2002:adf:e504:: with SMTP id j4mr33075107wrm.222.1563261586434; 
 Tue, 16 Jul 2019 00:19:46 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id x20sm40687579wrg.10.2019.07.16.00.19.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 00:19:45 -0700 (PDT)
To: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190615051722.13994-1-rfried.dev@gmail.com>
 <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8422687a-f410-64a4-1211-b06a4f26681e@redhat.com>
Date: Tue, 16 Jul 2019 09:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: cadence_gem: clear RX
 control descriptor
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
X-List-Received-Date: Tue, 16 Jul 2019 07:19:49 -0000

On 7/16/19 9:11 AM, Ramon Fried wrote:
> ping
> 
> On Sat, Jun 15, 2019 at 8:17 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>>
>> The RX ring descriptors control field is used for setting
>> SOF and EOF (start of frame and end of frame).
>> The SOF and EOF weren't cleared from the previous descriptors,
>> causing inconsistencies in ring buffer.
>> Fix that by clearing the control field of every descriptors we're
>> processing.
>>
>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>> ---
>>  hw/net/cadence_gem.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index ecee22525c..d83a82bdb0 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
>>      desc[1] |= DESC_1_RX_SOF;
>>  }
>>
>> +static inline void rx_desc_clear(uint32_t *desc)
>> +{
>> +    desc[1]  = 0;
>> +}
>> +
>>  static inline void rx_desc_set_eof(uint32_t *desc)
>>  {
>>      desc[1] |= DESC_1_RX_EOF;
>> @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>          bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>>
>>          /* Update the descriptor.  */
>> +        rx_desc_clear(s->rx_desc[q]);

Maybe move the call before the comment, regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> +
>>          if (first_desc) {
>>              rx_desc_set_sof(s->rx_desc[q]);
>>              first_desc = false;
>> --
>> 2.21.0
>>

