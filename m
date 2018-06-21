Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW402-0004gs-FB
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3zz-0004fb-7U
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3zy-0000LF-8N
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:07:59 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3zt-0000KQ-Gz; Thu, 21 Jun 2018 14:07:53 -0400
Received: by mail-qt0-x242.google.com with SMTP id l10-v6so3706369qtj.0;
	Thu, 21 Jun 2018 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Uad1xef7nVG4vkNdnI/+3gRjCb/f7ih3d/NhSQa+e4M=;
	b=BeYC41N0H+w2F901TcseywkVTBeH2uV2Q/jrRX3ty27nyGRdBsxMi8CXBcaJ27LAL/
	syWRnFWRKyigPo81mQYlr94S4ScarPh2Es8AEL4ILBAvLASdj8KI91P4qNSV1yu/+Rbd
	Ers3E5YHTHWQkfEHPjQfdmYU7SIDVTjsdjOVoSSOds53pqCH3/EsiFDbLQbQ6XfNnJ4C
	sfd0NLucQRgMKIRaQ0DExhnoGrm1oGsxe7dNlcXQBb43U0cNKPRfaFT2/Lm9+LLQIrmm
	Dp+EV+ucdn9uQfXD8XTxPLZHQZiO5/X2HcspnjDGUTqrNLMzFMefMZCeVCE9Sf2DeHkI
	/QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Uad1xef7nVG4vkNdnI/+3gRjCb/f7ih3d/NhSQa+e4M=;
	b=mTIKL6+lTuwvuwdsPfiOonK9ZgTNs4qUbV9pg8JcpYivASH+IQAKKgUWqBMiI8MV8t
	zFoSBHQGrjdpfBpkdsXIjOsqoXeClaTAciLaPjP/aS2gQSsxTMl2GvFLm/t1DzumjwFJ
	u6PE8pvvaEekzNYtDvu2EkCuKLbjEN49oDSVrCF6wLJ+BhdaJrxtD6+FTIOVPJqO5ABH
	ednBzHFj7Osk2nk6V/foaycXlQ6qyKWrvocqnfi4SLUyh76vR/nVbT9uMi9ECt3LI0ls
	1xTldaey7lSQeKJZZmHg+ruBdQAP3Is/QLny/6vFiFsypcU9ffHhdMG/NJfgzwHY9GIC
	Flug==
X-Gm-Message-State: APt69E0/BQ84x6+QUdQZr6MJS3EAMj5HbGk1oJdp4vA8+xKSqwJi8Xvi
	mOitYyJkLaA0GhtmpPMhYwY5P9sD
X-Google-Smtp-Source: ADUXVKKz3Tj8Tm1GCZ6vvKL1maHj5AmO8cJWSUOAaurwgL/NxAaztLcJG0Rn56vxPYLlNXWAIUKF7w==
X-Received: by 2002:a0c:d026:: with SMTP id
	u35-v6mr22814848qvg.210.1529604472839; 
	Thu, 21 Jun 2018 11:07:52 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l66-v6sm3545917qke.69.2018.06.21.11.07.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:07:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:Floppy" <qemu-block@nongnu.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
	<20180621171257.14897-11-f4bug@amsat.org>
	<4aa9b48d-1934-bf06-0bae-9d8d2721f199@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ee2ec992-6a76-5685-06f5-0e1373909e3e@amsat.org>
Date: Thu, 21 Jun 2018 15:07:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4aa9b48d-1934-bf06-0bae-9d8d2721f199@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH 10/11] hw/block/fdc: Convert from
 FLOPPY_DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 18:08:01 -0000

On 06/21/2018 02:41 PM, John Snow wrote:
> 
> 
> On 06/21/2018 01:12 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/block/fdc.c        | 6 +++---
>>  hw/block/trace-events | 4 ++++
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index cd29e27d8f..c7b4fe9b3e 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -40,6 +40,7 @@
>>  #include "sysemu/blockdev.h"
>>  #include "sysemu/sysemu.h"
>>  #include "qemu/log.h"
>> +#include "trace.h"
>>  
>>  /********************************************************/
>>  /* debug Floppy devices */
>> @@ -934,7 +935,7 @@ static uint32_t fdctrl_read (void *opaque, uint32_t reg)
>>          retval = (uint32_t)(-1);
>>          break;
>>      }
>> -    FLOPPY_DPRINTF("read reg%d: 0x%02x\n", reg & 7, retval);
>> +    trace_fdc_ioport_read(reg, retval);
> 
> Earlier in this function we've already masked the register number, which
> is not clear from context.

Sorry this is an old patch, I then learned to fill commit messages as if
you are going to send upstream, even if it will be in months...

> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks.

> 
> (and ACK, to whomever stages this outside of my branch. --js)
> 
>>  
>>      return retval;
>>  }
>> @@ -943,9 +944,8 @@ static void fdctrl_write (void *opaque, uint32_t reg, uint32_t value)
>>  {
>>      FDCtrl *fdctrl = opaque;
>>  
>> -    FLOPPY_DPRINTF("write reg%d: 0x%02x\n", reg & 7, value);
>> -
>>      reg &= 7;
>> +    trace_fdc_ioport_write(reg, value);
>>      switch (reg) {
>>      case FD_REG_DOR:
>>          fdctrl_write_dor(fdctrl, value);
>> diff --git a/hw/block/trace-events b/hw/block/trace-events
>> index 6b9e733412..d842c45409 100644
>> --- a/hw/block/trace-events
>> +++ b/hw/block/trace-events
>> @@ -1,5 +1,9 @@
>>  # See docs/devel/tracing.txt for syntax documentation.
>>  
>> +# hw/block/fdc.c
>> +fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
>> +fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
>> +
>>  # hw/block/virtio-blk.c
>>  virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
>>  virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
>>

