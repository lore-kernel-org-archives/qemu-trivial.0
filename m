Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxIhV-0004D7-CB
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 13:31:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxIhT-0004BD-2V
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxIhO-0002Uk-BP
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:31:35 -0400
Received: from mail-qg0-f52.google.com ([209.85.192.52]:35587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YxIhO-0002UY-7L
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:31:30 -0400
Received: by qgg60 with SMTP id 60so14477649qgg.2
	for <qemu-trivial@nongnu.org>; Tue, 26 May 2015 10:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JLupj4YS/eztOz0Dk/YPc4hEb2lB/9oRck+m2P261tQ=;
	b=Kyo+ou3lJFoL2Olypkwx592KEu+ZIpvzRqEFrYzJjOAt+KKxsJKeQGV1DlUjQAmDGA
	5JSbV+NelgjbRGd5PN4RDn4dMnBsGRzDjmLM3+jchpndDO+xz7ApPg03wQ/NGex8zEss
	qd6JtkSbCmR4AqkWPcoOR+ZINyIcw+uHKB4f7eQIxUHfz5I5cvFyGwAfaBWicqGw0O1l
	jJsZvxeiFd0U5QZfVj4JnP/mXkNk/eSX/vhsSi/1bUqtp+m/H4Jwu8FL3TPCEvAaSJjQ
	PXqMOg9oTpYK9Y9NCq8Kl4VDyeCpuYsFtl/QRSxzbYQrh78TGCTDOMCabYNblcRQ9wTf
	c1LA==
X-Gm-Message-State: ALoCoQnr6ap5L4kWxj4iU69Rm7ocQ8b7rMp0YYNLxsZ4Mg4BPzM3Zuldc3Ll98T4R1GKbFA3I6/7
MIME-Version: 1.0
X-Received: by 10.55.40.218 with SMTP id o87mr56207454qko.82.1432661489527;
	Tue, 26 May 2015 10:31:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.45.2 with HTTP; Tue, 26 May 2015 10:31:29 -0700 (PDT)
In-Reply-To: <5564AAFB.2040604@redhat.com>
References: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>
	<55642B01.3010305@redhat.com>
	<CAEgOgz6MwXzMG7u_WdMLDDYy1A27eqLTiLvZtKyYXOQSnf2HjQ@mail.gmail.com>
	<5564AAFB.2040604@redhat.com>
Date: Tue, 26 May 2015 10:31:29 -0700
X-Google-Sender-Auth: v1h_UtG6ikDXHpKrCZyOGG62RGA
Message-ID: <CAEgOgz6v-R2AAPdonRq5cn0+G4-=jErwr06gUKpB32RDNeH9PA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.52
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
X-List-Received-Date: Tue, 26 May 2015 17:31:36 -0000

On Tue, May 26, 2015 at 10:18 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 26/05/2015 19:05, Peter Crosthwaite wrote:
>> OK, but it is an odd one out, would you be willing to accept
>> the double include that seems to be widespread?
>>
>> +#include "qemu_common.h"
>>  #include "cpu.h"
>> -#include "exec/cpu-all.h"
>
> This is exactly what I meant.  What is odd about it?
>

Nothing at all. It's just the other of the two valid resolutions to my
problem. I lost the coinflip when I wrote the patch :) Will respin
tonight.

Regards,
Peter

> In fact, including exec/cpu-all.h outside cpu.h is definitely odd.
>
> Paolo
>

