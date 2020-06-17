Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlhDD-0006U6-Vj
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2020 19:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aperamak@pp1.inet.fi>)
 id 1jlhDB-0006Rw-Ch; Wed, 17 Jun 2020 19:11:17 -0400
Received: from mta-out1.inet.fi ([62.71.2.194]:36576 helo=julia1.inet.fi)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aperamak@pp1.inet.fi>)
 id 1jlhD9-0005na-2T; Wed, 17 Jun 2020 19:11:17 -0400
Received: from [91.154.154.51] (91.154.154.51) by julia1.inet.fi
 (9.0.019.26-1) (authenticated as perall-2)
 id 5EEA260E00022DDF; Thu, 18 Jun 2020 02:10:32 +0300
Subject: Re: [PATCH] hw/audio/gus: Fix registers 32-bit access
From: Allan Peramaki <aperamak@pp1.inet.fi>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200615201757.16868-1-aperamak@pp1.inet.fi>
 <CAFEAcA-eKboVf3uk4iY_A9_uQ=HnGyic4fzbzJhv1gH2V+TMVw@mail.gmail.com>
 <87e628f4-6c0e-c4a2-daba-57cb1e508b77@pp1.inet.fi>
Message-ID: <06bdf82f-858a-6b28-a9f9-e85154ac9c5d@pp1.inet.fi>
Date: Thu, 18 Jun 2020 02:10:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87e628f4-6c0e-c4a2-daba-57cb1e508b77@pp1.inet.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.71.2.194; envelope-from=aperamak@pp1.inet.fi;
 helo=julia1.inet.fi
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 19:11:12
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
X-List-Received-Date: Wed, 17 Jun 2020 23:11:17 -0000

On 18/06/2020 01:25, Allan Peramaki wrote:
> On 17/06/2020 23:23, Peter Maydell wrote:
>> Are these accesses all guaranteed to be correctly aligned
>> to be 16 or 32 bit loads/stores ? Otherwise it would be
>> better to use the ldl_p/stl_p/ldw_p/stw_p/etc accessors,
>> which correctly handle possibly misaligned pointers.
> 
> Yes (assuming compiler aligns struct fields properly.) It is not obvious 
> though (and easy to break), so I suppose refactoring much of the GUS 
> code would be nice. For example, the few places where GUSregd(position) 
> is used, position is 2 (mod 4). On the other hand, gusptr is also 2 (mod 
> 4) bytes (making gusptr+position = 0 (mod 4)), because we have the struct

It is aligned, but my reasoning had a mistake. Both gusptr and position 
(GUSDRAMPOS24bit and voicewavetableirq) are 0 (mod 4). (mixbuf is a 
pointer.) Sorry.

> 
> typedef struct GUSState {
>      ISADevice dev;
>      GUSEmuState emu;
>      QEMUSoundCard card;
>      uint32_t freq;
>      uint32_t port;
>      int pos, left, shift, irqs;
>      int16_t *mixbuf;
>      uint8_t himem[1024 * 1024 + 32 + 4096];
>      int samples;
>      SWVoiceOut *voice;
>      int64_t last_ticks;
>      qemu_irq pic;
>      IsaDma *isa_dma;
>      PortioList portio_list1;
>      PortioList portio_list2;
> } GUSState;
> 
> 

Best regards,
Allan

