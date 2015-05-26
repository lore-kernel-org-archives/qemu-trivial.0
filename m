Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxIIF-0005zZ-5p
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 13:05:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxII9-0005mh-9V
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxII2-0008Uy-Q1
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:05:25 -0400
Received: from mail-qg0-f43.google.com ([209.85.192.43]:34768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxII2-0008Ui-Hg
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:05:18 -0400
Received: by qgez61 with SMTP id z61so65719778qge.1
	for <qemu-trivial@nongnu.org>; Tue, 26 May 2015 10:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3e6SgobPJjVT9KQSMYnt7QzGLw6555pYlDkad1DELhM=;
	b=Q7gqcncmttnYXKlfog633PWeefyFAowCsBOXZKhJ9TGpYUhF2o5m026D9oNxWOSjPL
	80R65vcoDTtDFY3hrkqHFDOuz0IbcNqJLhGmEZ9Ap7nNm/u6hvA8sib/8VqyCFc7kL9h
	7sGkcMrXrHV3JtwpzeZgKaW0HTV6p8RDGPbk7syizFmyF+k3069aUJlpgAZpHT/5kUQS
	szG4jK6BcxJJw8Ecaecww13JtqpDcoIP3IPkfk+5Q00L4+3/XL969eDlpwFJLQRqkzyV
	vmlOnIPg7dh9WPgSnTBWbq+MoNcfNrAO7GPhB9GGcMFPhzBZT/OfPfP90Zdc9niYQprq
	hWHA==
X-Gm-Message-State: ALoCoQk+nvGUpxr7J7F00eO8vAA/sjoQu5vtaXqTYd/IyNE1CItiRGiZ8rSeOiGBEwdyVSVX2MRy
MIME-Version: 1.0
X-Received: by 10.55.33.23 with SMTP id h23mr12568413qkh.61.1432659918083;
	Tue, 26 May 2015 10:05:18 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.45.2 with HTTP; Tue, 26 May 2015 10:05:17 -0700 (PDT)
In-Reply-To: <55642B01.3010305@redhat.com>
References: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>
	<55642B01.3010305@redhat.com>
Date: Tue, 26 May 2015 10:05:17 -0700
X-Google-Sender-Auth: q5Yr_rIuKAqglnyDwBDRUmYuMgQ
Message-ID: <CAEgOgz6MwXzMG7u_WdMLDDYy1A27eqLTiLvZtKyYXOQSnf2HjQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.43
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory_mapping: Use
	qemu_common.h include
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 17:05:29 -0000

On Tue, May 26, 2015 at 1:12 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 26/05/2015 08:38, Peter Crosthwaite wrote:
>> Rather than an explicit inclusion of cpu.h. This maked it more
>> consistent with other core code files, which either just rely on
>> qemu-common.h inclusion or preceed cpu.h with qemu-common.h anyway.
>
> I'd rather keep the cpu.h inclusion.  It would be nice to get rid of the
> automagic inclusion of cpu.h from qemu-common.h.
>

OK, but it is an odd one out, would you be willing to accept
the double include that seems to be widespread?

+#include "qemu_common.h"
 #include "cpu.h"
-#include "exec/cpu-all.h"

Regards,
Peter

> Paolo
>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
>> random core code inclusion without preceeded qemu-common.h. I guess
>> this is the only one in tree?
>> ---
>>  memory_mapping.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/memory_mapping.c b/memory_mapping.c
>> index 7b69801..7cf5548 100644
>> --- a/memory_mapping.c
>> +++ b/memory_mapping.c
>> @@ -13,8 +13,7 @@
>>
>>  #include <glib.h>
>>
>> -#include "cpu.h"
>> -#include "exec/cpu-all.h"
>> +#include "qemu-common.h"
>>  #include "sysemu/memory_mapping.h"
>>  #include "exec/memory.h"
>>  #include "exec/address-spaces.h"
>> -- 1.9.1
>

