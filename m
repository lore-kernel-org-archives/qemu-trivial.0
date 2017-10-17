Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4PRA-0002YX-8B
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 06:49:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4PR8-0002Xc-Hp
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 06:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4PR4-0000Rf-M2
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 06:49:26 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:55914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4PR4-0000RN-Hg; Tue, 17 Oct 2017 06:49:22 -0400
Received: by mail-qt0-x22e.google.com with SMTP id v41so2440649qtv.12;
	Tue, 17 Oct 2017 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ugXSQKhdUCycnrcK6YyYAoF/njLymEcjzfYX75SOCzo=;
	b=FiK7eOzf/J4fJY/N61H59aTbMgkx3ET/2VsNEp3poZjXYBRmeoEddWaUxWQ4eLMLK7
	tL5IInat9/0h5rRN/h5+6D3FPIsz758fGzukgAj9EMWbYUkSYBDHBtgyVEmS08omFbWf
	UWOSvf2iL7LUKnKHhBsBiPKq8h4lKB+xGMKgpvlGH3gRBt586tF/CJAGWuynKHucGim5
	zslYgPKENuspMTtcdXJprl9nd9D/eSIM2nhksvt0vi3NcL1zrJdZmqWxez6xCIvwFryv
	E/kFBYCX+rS9lgdkkcaHC+lHlPRuytjAbAXzC7y2cWBc+xElHSlIgza1WGpb2+TaOibp
	DFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ugXSQKhdUCycnrcK6YyYAoF/njLymEcjzfYX75SOCzo=;
	b=PiNWKEXEgk7dpgqeF2bWo/8Mxs2DzqFXZEoiJyb8Z6QK8l6L25lsGeGSt2Jy+Ae7tB
	QE31REuZf4XDYpg+5dmHNgIjsWLPkNZUR6fTGBjYZwp0ZHsuN/tBscvWmHZ/gQ3OMg4Q
	3dgPUnrk8KwkZc6HodaXR7qaUFR/AX3n9unpSocrgz8ufCJCVPig9RJo0rHG8ZjrSL7R
	iC9HGPNagTWF5/5wBXhYV+NFQYz8vsEmsDRXURY/2IWtZoMzD7C6JYE+/tMTkdWxLy0f
	RDSK9ZlUzsy9/j8ltAH0s6v2csltfNrpDxqDWFpkWcW541IIOs+IHGGrEuE1MG/9WX5W
	5i9g==
X-Gm-Message-State: AMCzsaVeZeneqEuIhtRQ/AZXoxpvLhRfKQc2ES8VVMlPMiwdsP0fL6a/
	P9t1fSP+i9Z1EAIB5b8VHgvEGbAcqTM=
X-Google-Smtp-Source: AOwi7QAsI3RkSV7Qu+xXozlZClIiHZEcZQrkpC/JpWFh/jgyqG4XWpUcIrx6B+gWdsXQL9pm9dYBeg==
X-Received: by 10.237.61.221 with SMTP id j29mr19352558qtf.103.1508237361531; 
	Tue, 17 Oct 2017 03:49:21 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	n76sm5730995qkn.85.2017.10.17.03.49.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 03:49:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-31-f4bug@amsat.org>
	<44b57d76-6d10-84c8-3a13-cdac7331c5d9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <47c7b41d-23ff-3dd1-9c07-69bd5df08685@amsat.org>
Date: Tue, 17 Oct 2017 07:49:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <44b57d76-6d10-84c8-3a13-cdac7331c5d9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-trivial] [PATCH v2 30/39] hw/display/vga: remove the old
 i386/pc dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 10:49:27 -0000

Hi Thomas,

>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>> index ad34a1f048..fe23b81442 100644
>> --- a/hw/display/vga_int.h
>> +++ b/hw/display/vga_int.h
>> @@ -25,8 +25,9 @@
>>  #ifndef HW_VGA_INT_H
>>  #define HW_VGA_INT_H
>>  
>> -#include "hw/hw.h"
>> +#include "exec/ioport.h"
>>  #include "exec/memory.h"
>> +#include "ui/console.h"
> 
> So vga_int.h now includes console.h (is it really necessary?) ...

The VGACommonState struct has a GraphicHwOps *hw_ops member.

> 
> [...]
>>  static inline bool isa_ne2000_init(ISABus *bus, int base, int irq, NICInfo *nd)
>>  {
>> diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
>> index 51ccbccc41..e887b45651 100644
>> --- a/hw/display/vga-isa-mm.c
>> +++ b/hw/display/vga-isa-mm.c
>> @@ -23,11 +23,9 @@
>>   */
>>  #include "qemu/osdep.h"
>>  #include "hw/hw.h"
>> -#include "ui/console.h"
> 
> ... and here you also remove it from the .c file - OK ...
> 
>> -#include "hw/i386/pc.h"
>> +#include "hw/display/vga.h"
>>  #include "vga_int.h"
>>  #include "ui/pixel_ops.h"
>> -#include "qemu/timer.h"
>>  
>>  #define VGA_RAM_SIZE (8192 * 1024)
>>  
>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>> index 1af95562f2..9af43abee8 100644
>> --- a/hw/display/vga-isa.c
>> +++ b/hw/display/vga-isa.c
>> @@ -26,7 +26,7 @@
>>  #include "qemu/osdep.h"
>>  #include "hw/hw.h"
>>  #include "ui/console.h"
> 
> ... but here you keep it? I think you should either remove it here, too,

I missed this one.

> or not add the include in the header (which I'd prefer if the header
> itself does not depend on console.h).

Do you suggest me do declare GraphicHwOps opaque in "qemu/typedefs.h"?

> 
>> -#include "hw/i386/pc.h"
>> +#include "hw/isa/isa.h"
>>  #include "vga_int.h"
>>  #include "ui/pixel_ops.h"
>>  #include "qemu/timer.h"
>> diff --git a/hw/display/vga.c b/hw/display/vga.c
>> index ed24ef7076..0da4942a09 100644
>> --- a/hw/display/vga.c
>> +++ b/hw/display/vga.c
>> @@ -24,9 +24,9 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "hw/hw.h"
>> -#include "vga.h"
>> +#include "hw/display/vga.h"
>>  #include "ui/console.h"
> 
> Here's another one --^

Oh this one too.


