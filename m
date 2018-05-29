Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNSd3-0005aD-FJ
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 20:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNSd0-0005ZM-Ke
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNScz-0003gA-GU
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:36:42 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNScu-0003eD-7A; Mon, 28 May 2018 20:36:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id h5-v6so8676914qtm.13;
	Mon, 28 May 2018 17:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W07LbdLxdMFliPoXyvMYrZmrS0hgXJvddduT9cspvrI=;
	b=VIQaHOYPrG3NqliVMsK/gF3nkGhvb3rhT3dIJiyKcH6SZVBNOqaf4JXuFHYcadNVuC
	ns9VmiE29gvnFo5v7DU/XTrOl8FeQppkAPNFTMglIxuOqgYRYz27BicEchYwSzDEIZXa
	SXrEq+LQZ15mxuJdPKHWoiegNTJZ81MBp1hKdEcbgittVObsH25YNdSnW4kFas8bIq8/
	Mtmeamv/W7bKkRj8SfvvpMsNOVShjBy3kBMbhThWFYfMHyQs1mwUSM23l+5fUmtK3eDa
	pV8b3pVcZQTTkvy1musvzaCYVRyfdAtml+Afm53Gj5wfsz7AcwHvrlUMT/nPr8OYDoJM
	t0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=W07LbdLxdMFliPoXyvMYrZmrS0hgXJvddduT9cspvrI=;
	b=ojDYYQkBF4aPIxffjsyd8cO2NI8CaM67SMKRF32HXTr5a3bA1odrKQR521Jkqsm01e
	jD1qrVYsyiaAfka2t3GDRFlt/YELhrFwrCbLHHHhGKhywi4XVYWHoqaxyuL18WPCc4oa
	st6XSWoWORBSMqzydaLPPx/uZ0Hr19jsO9Q1Z4d24R7tnJtLuZ0hS9orjhMRa3+Guk4l
	Ruu6xQvUGNVgNkprB0GyCVYgGDJqW2XxQzbkjaVCaAtUMw41tmEGzUTFUZpQRgEgGATd
	+UOPBLgniNtDRazG3VkGTzq+AbwjaD0N4fPndGL6qmnyRt1ebC8F6/UugyutGcEPJ8kn
	8TUA==
X-Gm-Message-State: ALKqPwdOYBMwCcRbMaHmdOV+aWP7q3e20Lqbk2FsRSPHHVgzMQGtlk2h
	zcWHJ3m25UtJc6JAT6Lwjyzd7w3yF+w=
X-Google-Smtp-Source: ADUXVKJU/E0nEa6rJwwXe4Y00bu9UnUv/h04PlH+u0OyaAS9pNqf6EMDKEd1AzqEKD1Rme6eum8Naw==
X-Received: by 2002:ac8:30ef:: with SMTP id
	w44-v6mr10020990qta.238.1527554195474; 
	Mon, 28 May 2018 17:36:35 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e96-v6sm11687671qtb.69.2018.05.28.17.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 17:36:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, "open list:S390" <qemu-s390x@nongnu.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-2-f4bug@amsat.org>
	<20180528174805.7a56a4b8@w520.home>
	<20180529030540-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ba9292ae-5bf3-54af-fefc-66336f83afd6@amsat.org>
Date: Mon, 28 May 2018 21:36:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529030540-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH v4 01/21] vfio: Include
 "exec/address-spaces.h" directly in the source file
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
X-List-Received-Date: Tue, 29 May 2018 00:36:43 -0000

On 05/28/2018 09:06 PM, Michael S. Tsirkin wrote:
> On Mon, May 28, 2018 at 05:48:05PM -0600, Alex Williamson wrote:
>> On Mon, 28 May 2018 20:26:59 -0300
>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> -ENOCOMMITLOG

Oops sorry Alex, I meant to add some, but missed this while rebasing.

>> Why?  Tangible benefit.  Looks like noise.  Thanks,
>>
> I agree it should have a commit log, but .c files
> should be self-sufficient not rely on .h files
> pulling in headers for symbols the .h does not use
> itself.

I meant:

  No declaration of "hw/vfio/vfio-common.h" directly requires to include
  the "exec/address-spaces.h" header.  To simplify dependencies and
  ease following cleanup of "exec/address-spaces.h", directly include
  it in the source file where the declaration are used.

> This is better because it makes refactoring easier.
> 
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  include/hw/vfio/vfio-common.h | 1 -
>>>  hw/vfio/ccw.c                 | 1 +
>>>  hw/vfio/platform.c            | 1 +
>>>  3 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>> index d9360148e6..8264a65fa5 100644
>>> --- a/include/hw/vfio/vfio-common.h
>>> +++ b/include/hw/vfio/vfio-common.h
>>> @@ -22,7 +22,6 @@
>>>  #define HW_VFIO_VFIO_COMMON_H
>>>  
>>>  #include "qemu-common.h"
>>> -#include "exec/address-spaces.h"
>>>  #include "exec/memory.h"
>>>  #include "qemu/queue.h"
>>>  #include "qemu/notify.h"
>>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>>> index e67392c5f9..76e4e8c652 100644
>>> --- a/hw/vfio/ccw.c
>>> +++ b/hw/vfio/ccw.c
>>> @@ -22,6 +22,7 @@
>>>  #include "hw/vfio/vfio-common.h"
>>>  #include "hw/s390x/s390-ccw.h"
>>>  #include "hw/s390x/ccw-device.h"
>>> +#include "exec/address-spaces.h"
>>>  #include "qemu/error-report.h"
>>>  
>>>  #define TYPE_VFIO_CCW "vfio-ccw"
>>> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
>>> index 5c921c27ba..57c4a0ee2b 100644
>>> --- a/hw/vfio/platform.c
>>> +++ b/hw/vfio/platform.c
>>> @@ -24,6 +24,7 @@
>>>  #include "qemu/range.h"
>>>  #include "sysemu/sysemu.h"
>>>  #include "exec/memory.h"
>>> +#include "exec/address-spaces.h"
>>>  #include "qemu/queue.h"
>>>  #include "hw/sysbus.h"
>>>  #include "trace.h"

