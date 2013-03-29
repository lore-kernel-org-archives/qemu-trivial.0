Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULaZN-0005IH-NE
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2013 10:46:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULaZH-00056X-Kj
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2013 10:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULaZF-0005uC-Tt
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2013 10:46:11 -0400
Received: from mail-qe0-f46.google.com ([209.85.128.46]:56955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ULaZB-0005sW-Ep; Fri, 29 Mar 2013 10:46:05 -0400
Received: by mail-qe0-f46.google.com with SMTP id a11so299050qen.33
	for <multiple recipients>; Fri, 29 Mar 2013 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=6WkntQS28MTwoAVdv0E/pBtO24xxwu35ARHYmnSTsYo=;
	b=Y/LuTvsfl4rAbWQY7QT9CtPlXUJ0aCI1S0cxhnNaS8IOteLqnAWwRBenk+amxCVMyI
	YWBPsbeLWQ2NXZN94ecVBqf1a5Xlsvr7hJrZCu1M0Q83Wn+JRc/6JB50HiVrwEPIR2h2
	6Bcc+PKjEWrrbfwDjq6Rp9vorDKvVb2EJBsgI9lBBiW8pp3EOe2XcKhV7teYPsg6Tt/g
	mFefj/5j5H/BmIqNSViyLaXar9YtH9ULE8QjVMiPZN9f9sHVnCfTLM5NrvQcUYdWH5E8
	ZTaNJbTdX2GNYo/LoXCPLBlNsv748t8MKs6N9F1SbYYSOVkMsKBMW7KkapYwZAYAI73U
	7sBQ==
MIME-Version: 1.0
X-Received: by 10.49.117.106 with SMTP id kd10mr4545841qeb.25.1364568364977;
	Fri, 29 Mar 2013 07:46:04 -0700 (PDT)
Received: by 10.49.41.65 with HTTP; Fri, 29 Mar 2013 07:46:04 -0700 (PDT)
In-Reply-To: <1364517522.31713.59.camel@liguang.fnst.cn.fujitsu.com>
References: <1364364631-24665-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<20130328094237.GE24910@stefanha-thinkpad.redhat.com>
	<1364517522.31713.59.camel@liguang.fnst.cn.fujitsu.com>
Date: Fri, 29 Mar 2013 15:46:04 +0100
Message-ID: <CAJSP0QUX88Jmnj9EhzBQ0FUAVm0AShYPfyyB7xY8YaXR+TMG7w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: li guang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.128.46
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: reject to boot a
 wrong header magic kernel
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
X-List-Received-Date: Fri, 29 Mar 2013 14:46:16 -0000

On Fri, Mar 29, 2013 at 1:38 AM, li guang <lig.fnst@cn.fujitsu.com> wrote:
> =E5=9C=A8 2013-03-28=E5=9B=9B=E7=9A=84 10:42 +0100=EF=BC=8CStefan Hajnocz=
i=E5=86=99=E9=81=93=EF=BC=9A
>> On Wed, Mar 27, 2013 at 02:10:31PM +0800, liguang wrote:
>> > if head magic is missing or wrong unexpectedly, we'd
>> > better to reject booting.
>> > e.g.
>> > I make a mistake to boot a vmlinuz for MIPS(which
>> > I think it's for x86) like this:
>> > qemu-system-x86_64 -kernel vmlinuz -initrd demord
>> > then qemu report:
>> > "qemu: linux kernel too old to load a ram disk"
>> > that's misleading.
>> >
>> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>> > ---
>> >  hw/i386/pc.c |    4 +++-
>> >  1 files changed, 3 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> > index b1e06fa..2b78dfc 100644
>> > --- a/hw/i386/pc.c
>> > +++ b/hw/i386/pc.c
>> > @@ -683,8 +683,10 @@ static void load_linux(void *fw_cfg,
>> >          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filenam=
e,
>> >                             kernel_cmdline, kernel_size, header)) {
>> >              return;
>> > +        } else {
>> > +            fprintf(stderr, "please assure specicified kernel is for =
x86!\n");
>> > +            exit(1);
>>
>> load_multiboot() can fail for other reasons so this error messing is
>> misleading.  Giving QEMU a non-x86 kernel is just one scenario where
>> this may fail.
>
> according to my check of load_mutiboot function,
> mostly it will return 0 if it's not multboot,
> or 1 it's a multiboot, so print this message,
> or can I just print "wrong kernel image!" ?

Yes, load_multiboot() fails if the image is not a valid multiboot
image.  An error message like "not a valid multiboot image" is good.

>>
>> >          }
>> > -        protocol =3D 0;
>> >      }
>>
>> Why did you drop protocol =3D 0?
>
> I think we only want either normal or multi boot linux kernel,
> I can't see meaning let other case go on.
> so, here, if a normal kernel, OK, go on,
> if multiboot, OK, go on,
> others, NO, end up.
> so, "protocol =3D 0" is meaningless here.

I looked in more detail now and here is why we cannot drop this line of cod=
e:

    uint16_t protocol;

Note that the variable is not initialized.

[...]
    if (ldl_p(header+0x202) =3D=3D 0x53726448)
    protocol =3D lduw_p(header+0x206);
    else {
    /* This looks like a multiboot kernel. If it is, let's stop
       treating it like a Linux kernel. */
        if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
                           kernel_cmdline, kernel_size, header))
            return;
    protocol =3D 0;

Set it to 0 here so it's initialized

    }
    if (protocol < 0x200 || !(header[0x211] & 0x01)) {

Use variable here - so we *must* initialize it before use.

Stefan

