Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcL4-0002e2-GU
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:40:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcL0-0002ZA-VC
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcKz-0004rk-El
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:40:14 -0400
Received: from mail-wg0-f44.google.com ([74.125.82.44]:45972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcKs-0004m3-Aq; Fri, 12 Apr 2013 07:40:06 -0400
Received: by mail-wg0-f44.google.com with SMTP id z11so2602908wgg.35
	for <multiple recipients>; Fri, 12 Apr 2013 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=e/KOHFdTlaRtJJ+lTYo7xAst0zWd+reOmp9Fx6P8HTY=;
	b=vxXzuWCyGZAsHa0Y18j9bub0C37QHWXQKTCzwo2mW+hMCxcbwt0BLFfyboVoPhdkDE
	hfcGrxmblcWVZXRrjwIkUf8XSnUj6hz+D64Xiu2TZOThR/dOoR8ATt1YQQJP3Yr8xhu2
	dhwM8wUcYzPmKHAepWyzN+2D8+P40qFCAsw3FVu9+tHBWHu/gCtRUxL2BILoBxfNHqqU
	KJ4HblcT1LOA+bXfpB47BBwv2yasUlrad9DA4Uelwcte8skZ8khAdrVAJh8PuU4EPkJS
	ERXCPSCk3oj3B/Zu0fqjUI6nCMpEo/UAHigRcTK5RnWiljTde4b5H03VWoZMWrVe5awZ
	JgNQ==
X-Received: by 10.180.19.39 with SMTP id b7mr3474363wie.15.1365766805441;
	Fri, 12 Apr 2013 04:40:05 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id bo1sm3167030wib.0.2013.04.12.04.40.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:40:04 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:40:02 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: li guang <lig.fnst@cn.fujitsu.com>
Message-ID: <20130412114002.GF9747@stefanha-thinkpad.redhat.com>
References: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51639ACE.8020505@linux.vnet.ibm.com>
	<1365483900.9553.8.camel@liguang.fnst.cn.fujitsu.com>
	<516468E4.7020007@linux.vnet.ibm.com>
	<1365646736.9553.127.camel@liguang.fnst.cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1365646736.9553.127.camel@liguang.fnst.cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.44
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/i386/pc: prompt not
 multboot or morden kernel image
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
X-List-Received-Date: Fri, 12 Apr 2013 11:40:16 -0000

On Thu, Apr 11, 2013 at 10:18:56AM +0800, li guang wrote:
> 在 2013-04-09二的 14:15 -0500，Jesse Larrew写道：
> > On 04/09/2013 12:05 AM, li guang wrote:
> > > 在 2013-04-08一的 23:36 -0500，Jesse Larrew写道：
> > >> On 04/08/2013 09:27 PM, liguang wrote:
> > >>> if head magic is missing or wrong unexpectedly, we'd
> > >>> better to prompt memssage for this.
> > >>> e.g.
> > >>> I make a mistake to boot a vmlinuz for MIPS(which
> > >>> I think it's for x86) like this:
> > >>> qemu-system-x86_64 -kernel vmlinuz -initrd demord
> > >>> then qemu report:
> > >>> "qemu: linux kernel too old to load a ram disk"
> > >>> that's misleading.
> > >>>
> > >>
> > >> Yes, that message would definitely be misleading in this case.
> > >>
> > >>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > >>> ---
> > >>>  hw/i386/pc.c |    2 ++
> > >>>  1 files changed, 2 insertions(+), 0 deletions(-)
> > >>>
> > >>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > >>> index ebbf059..6b29c3f 100644
> > >>> --- a/hw/i386/pc.c
> > >>> +++ b/hw/i386/pc.c
> > >>> @@ -686,6 +686,8 @@ static void load_linux(void *fw_cfg,
> > >>>          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
> > >>>                             kernel_cmdline, kernel_size, header)) {
> > >>>              return;
> > >>> +        } else {
> > >>> +            fprintf(stderr, "warn: invalid multiboot or modern kernel image\n");
> > >>>          }
> > >>>          protocol = 0;
> > >>>      }
> > >>>
> > >>
> > >> My impression from reading through the code is that this branch can be
> > >> legitimately triggered by an older kernel (protocol < 0x200). 
> > > 
> > > right.
> > > 
> > >> In that case,the error message above would also be misleading.
> > > 
> > > the warning message is saying: hey, we prefer modern kernel image
> > > or multiboot, but you specify neither, what are you doing?
> > > do you want to boot an old(obsolete) kernel?
> > > 
> > > or, add a line like fprintf(stderr, "do you boot an old kernel?\n") :-)
> > > 
> > 
> > Ah, I understand now. Thanks for explaining that. :)
> > 
> > >>
> > >> I think a better solution might be to simply validate that the arch
> > >> specified in the ELF header matches the arch that qemu is emulating.
> > >>  I'll look into this more tomorrow morning. :)
> > > 
> > > that's fine
> > > 
> > 
> > Looking at Documentation/x86/boot.txt in the kernel source, it looks
> > like there is a separate word of header magic that all x86 kernels should
> > have -- even the oldest images. Adding a separate check for that magic
> > might be a more complete solution:
> > 
> > ---
> >  hw/i386/pc.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8d75b34..e120427 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -686,6 +686,14 @@ static void load_linux(void *fw_cfg,
> >          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
> >                             kernel_cmdline, kernel_size, header)) {
> >              return;
> > +        } else {
> > +            /* This is the closest thing old Linux kernels have to a
> > +               magic number. */
> > +            if (lduw_p(header+0x01FE) != 0xAA55) {
> 
> maybe a good candidate, 
> but, AFAIK, 0xAA55 can hardly be a magic for
> it's commonly used by many cases.

The problem is that older kernel images don't have a real magic number
to check.  We cannot break compatibility by rejecting them now.

Jesse's patch makes sense to me.  Feel free to discuss more, I'll merge
once there is consensus.

Stefan

