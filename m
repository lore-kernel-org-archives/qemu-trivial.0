Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWLz4-0005Pd-0p
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLz2-0005OD-I3
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLz1-0000J3-O4
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:20:12 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLyt-0008Uy-RR; Fri, 22 Jun 2018 09:20:03 -0400
Received: by mail-qt0-x241.google.com with SMTP id y20-v6so5860767qto.8;
	Fri, 22 Jun 2018 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hEfzVvTI+agOcqqMVtxffk+yrD9FIseIzbE02a1V3r8=;
	b=cKatUYwgLR8L01PsNwSxw0IgiQ9sR+d8mvQmRUEpSWVUQGNFsC5+EN0KcAhXTZ1Zd+
	fpBtopS4V89R0ZE2VFAPAqMIVBwF8irPvWKforjPTOH38+iZgZ/jhNUU4Ez6+tCHfRHG
	Yb/WqbwqixcQWGi811k+yB7nYZfbNOy/F5Qppn6471XkNIHc1j4dmYoEbbxr5eD902it
	oh30W+h5idf+rQu8z6WOH3/Wp3vsbsG1D26vWNdNcvoux6gebSm53JKDTgQh9idydNcY
	gqU8UnyVuCsmE/xBLlRHRYxVqiVxMMKJXnuMR0j1qf/Zh4sVTrleTY6As/W5kbt4fv1M
	P33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=hEfzVvTI+agOcqqMVtxffk+yrD9FIseIzbE02a1V3r8=;
	b=PpFmLZI3k92NkrKARoavsvrhcWw3NUSpXuhdbGvye/iaBCmX4G4+u1hp7zdAx5bRey
	P0hh6AcmhotA7o2DvFg0QLtFEUOuAOrR13Sfi+kknQt6LbO4yZgtcqDvNI4OeYHNus4P
	V2afFsB0c2m27Pg4bsr+UxnFFApwwaz5wfeZ5ccL5VBWS4FUee3NTVYSu+yCsCxjI2Cl
	R/S8y6RXYjntB25CXo4JDtA+8M3Z5kRbyZrYAPzCFNpfBqZUSVDK188T7aL6vRBx71D2
	p1+nHcwCMWxMEplSodMSkKey0s2b6DPQQLWwIAcVpKDM+DUhlqp8y/L0pE2FrRieZrOz
	oW+A==
X-Gm-Message-State: APt69E3H/doo+Ai3xlbwBoSKeIGxbvI7KSfW3Kdrh0VJjIqnl55mACRz
	Q15h5pojSuxr7loNM5rLL3Q=
X-Google-Smtp-Source: AAOMgpdfy41KM3tM/VtcnAE6wEtAGsAcfN5u3BY2wOdqDBzY36vgcENhAbXVAUkPC2H65JoajtUzKw==
X-Received: by 2002:ac8:1e87:: with SMTP id
	c7-v6mr1252366qtm.322.1529673603253; 
	Fri, 22 Jun 2018 06:20:03 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm6104579qtm.69.2018.06.22.06.20.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:20:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-2-f4bug@amsat.org>
	<114c5545-19e6-690a-78a7-4586aa57860d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <932f49c8-aa5b-3ee6-037f-8950dc367881@amsat.org>
Date: Fri, 22 Jun 2018 10:19:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <114c5545-19e6-690a-78a7-4586aa57860d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/11] hw/input/pckbd: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 13:20:13 -0000

On 06/22/2018 05:04 AM, Thomas Huth wrote:
> On 21.06.2018 20:02, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/input/pckbd.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index f33e3fc63d..1102d2a31b 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -22,6 +22,7 @@
>>   * THE SOFTWARE.
>>   */
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/hw.h"
>>  #include "hw/isa/isa.h"
>>  #include "hw/i386/pc.h"
>> @@ -308,7 +309,8 @@ static void kbd_write_command(void *opaque, hwaddr addr,
>>          /* ignore that */
>>          break;
>>      default:
>> -        fprintf(stderr, "qemu: unsupported keyboard cmd=0x%02x\n", (int)val);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "qemu: unsupported keyboard cmd=0x%02lx\n", val);
> 
> Please remove the "qemu:" prefix while you're at it.

Sure.

