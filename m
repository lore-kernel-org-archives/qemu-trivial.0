Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2EAx-0007cX-1Q
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2015 03:42:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z2EAv-0007cI-Jk
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 03:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z2EAs-0006Cr-Ab
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 03:42:21 -0400
Received: from mail-yh0-f54.google.com ([209.85.213.54]:36106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z2EAs-0006Cc-7A
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 03:42:18 -0400
Received: by yhan67 with SMTP id n67so3826852yha.3
	for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2015 00:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OKDH/DfLQ1R3zGCpJctAPrlEJ4P4IL8XrSu6v+7wLpU=;
	b=MtxbLruLt7aiD3AzzUwYqOZHIglP6YuLAjFXPxKpWK/Qut1YxIfT+k7sRqjvMR3fvN
	HYd186ySnnVlBo6mqPNewIxD0TJbi0byWMZ5FvniZ5Ewt82hKYAiIw+jX6UcTbnoMwuY
	riPMLpHtHuwKK5SIs10iMXuaBbepsAt1doaerdFAwmWhV6Eg22zzrUCB/tgYT5bqi4my
	W0zLsBMvdQitI3EmJCzvH3LxDawhxsXzzkgMOHg6tkvjQ21MhgH7Q+hXMOocWpZyPG/X
	Bz/b+gAjPVFpNHZ/opd6dmY8sCFXm2MUc/y66xAqsPbxBz/VKtxTrfBkGYdTupecSXld
	8xxg==
X-Gm-Message-State: ALoCoQmr11YBl00NehdXy3k0/I2uPQn+NSINyv2BxiNj5o903dU/lqBDlzLb8ow0dccHjuzjjrnO
MIME-Version: 1.0
X-Received: by 10.13.242.67 with SMTP id b64mr20213205ywf.74.1433835737590;
	Tue, 09 Jun 2015 00:42:17 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.38.9 with HTTP; Tue, 9 Jun 2015 00:42:17 -0700 (PDT)
In-Reply-To: <557572D5.3050103@redhat.com>
References: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
	<557572D5.3050103@redhat.com>
Date: Tue, 9 Jun 2015 00:42:17 -0700
X-Google-Sender-Auth: Q3wifRwTBrIvxqtbbc-w-EDNZMY
Message-ID: <CAEgOgz6md-U4nAZM1MEqAqMnt6wk4APhGuU5tptXijq0umZQ+Q@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.54
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] memory_mapping: Rework
	cpu related includes
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
X-List-Received-Date: Tue, 09 Jun 2015 07:42:22 -0000

On Mon, Jun 8, 2015 at 3:47 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 07/06/2015 23:59, Peter Crosthwaite wrote:
>> This makes it more consistent with all other core code files, which
>> either just rely on qemu-common.h inclusion or precede cpu.h with
>> qemu-common.h.
>>
>> cpu-all.h should not be included in addition to cpu.h. Remove it.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>> changed since v1:
>> Leave in cpu.h include
>>
>> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
>> random core code inclusion without preceeded qemu-common.h. I guess
>> this is the only one in tree?
>> ---
>>  memory_mapping.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/memory_mapping.c b/memory_mapping.c
>> index 7b69801..36d6b26 100644
>> --- a/memory_mapping.c
>> +++ b/memory_mapping.c
>> @@ -13,8 +13,8 @@
>>
>>  #include <glib.h>
>>
>> +#include "qemu-common.h"
>>  #include "cpu.h"
>> -#include "exec/cpu-all.h"
>>  #include "sysemu/memory_mapping.h"
>>  #include "exec/memory.h"
>>  #include "exec/address-spaces.h"
>>
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> About to leave on vacation, so someone else will have to pick it up.
>

Enjoy. If you are not back before soft freeze would you object to me
sending a [PULL] for some of the multi-arch related mainloop header
patches for which I have RB from Richard from?

Regards,
Peter

> Paolo
>

