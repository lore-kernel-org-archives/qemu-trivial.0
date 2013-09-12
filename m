Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VK7fT-0005xo-2b
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 10:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1VK7fL-0005wf-Ld
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1VK7fF-0000Cq-Rs
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:14:39 -0400
Received: from mout.web.de ([212.227.15.14]:60441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1VK7fF-0000CY-Hp
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:14:33 -0400
Received: from envy.site ([195.135.221.2]) by smtp.web.de (mrweb102) with
	ESMTPSA (Nemesis) id 0Lrb3x-1W4xfG1bp7-013RIg for
	<qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 16:14:31 +0200
Message-ID: <5231CC3F.30001@web.de>
Date: Thu, 12 Sep 2013 16:14:23 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: famz@redhat.com, Peter Maydell <peter.maydell@linaro.org>
References: <1378918197-9036-1-git-send-email-peter.maydell@linaro.org>
	<20130912012318.GA9134@T430s.nay.redhat.com>
In-Reply-To: <20130912012318.GA9134@T430s.nay.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:deqM7GUghTWB6decIdgP1QNv0RAnQ8rSrufd/on2Ysdetu4pyQH
	RXVj30mh45GC/iW/1Ly+joRUG+KxEts5/E++ri2mCsfaN2jyEOM2ztEgLYqOF1ThMBX6toV
	+VHst/oMOy9H50KO5qpZCPFcExWTBDEtj4yQJbtJdJ5pDBHSjQCiFxsvtIkVK7za13WvMCV
	1kTWBfmzO9UkaTlJ6yUyg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.14
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] ui/Makefile.objs: delete unnecessary
	cocoa.o dependency
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
X-List-Received-Date: Thu, 12 Sep 2013 14:14:45 -0000

Am 12.09.2013 03:23, schrieb Fam Zheng:
> On Wed, 09/11 17:49, Peter Maydell wrote:
>> Delete an unnecessary dependency for cocoa.o; we already have
>> a general rule that tells Make that we can build a .o file
>> from a .m source using an ObjC compiler, so this specific
>> rule is unnecessary. Further, it is using the dubious construct
>> "$(SRC_PATH)/$(obj)" to get at the source directory, which will
>> break when $(obj) is redefined as part of the preparation for
>> per-object library support.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This needs to go in before Fam's patchset for modules
>> can be applied, either via a cocoa maintainer queue or via
>> -trivial or just as a first patch on the front of Fam's
>> patches if they would otherwise be being held up by this.
>>
> 
> Sure, I'll apply to my tree and rebase if it's merged.

If it works, fine with me:

Reviewed-by: Andreas Färber <andreas.faerber@web.de>

I don't think I have any other Cocoa patches queued - or did I miss a
more acceptable version of the command-key workaround?

Regards,
Andreas

> 
> Thanks,
> 
> Fam
> 
>>  ui/Makefile.objs | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/ui/Makefile.objs b/ui/Makefile.objs
>> index 6ddc0de..f33be47 100644
>> --- a/ui/Makefile.objs
>> +++ b/ui/Makefile.objs
>> @@ -17,6 +17,4 @@ common-obj-$(CONFIG_GTK) += gtk.o x_keymap.o
>>  
>>  $(obj)/sdl.o $(obj)/sdl_zoom.o: QEMU_CFLAGS += $(SDL_CFLAGS) 
>>  
>> -$(obj)/cocoa.o: $(SRC_PATH)/$(obj)/cocoa.m
>> -
>>  $(obj)/gtk.o: QEMU_CFLAGS += $(GTK_CFLAGS) $(VTE_CFLAGS)
>> -- 
>> 1.7.11.4
>>


