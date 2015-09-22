Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZeICw-00047J-Pe
	for mharc-qemu-trivial@gnu.org; Tue, 22 Sep 2015 03:41:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZeICt-00043t-Rm
	for qemu-trivial@nongnu.org; Tue, 22 Sep 2015 03:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZeICs-0001re-TJ
	for qemu-trivial@nongnu.org; Tue, 22 Sep 2015 03:41:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZeICo-0001kH-JU; Tue, 22 Sep 2015 03:41:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AF1D442049;
	Tue, 22 Sep 2015 10:41:29 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9CB12A6A;
	Tue, 22 Sep 2015 10:41:29 +0300 (MSK)
Message-ID: <56010629.3080307@msgid.tls.msk.ru>
Date: Tue, 22 Sep 2015 10:41:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?TMOpbyBHcmFuZ2U=?= <grangeleo@gmail.com>, 
	qemu-trivial@nongnu.org
References: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>
	<CAAOQwLqXeshTGTYxc+Hq62t+mvi=0nbHDg3Z+=87mCGXwYPFTQ@mail.gmail.com>
In-Reply-To: <CAAOQwLqXeshTGTYxc+Hq62t+mvi=0nbHDg3Z+=87mCGXwYPFTQ@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] spice: fix checking for surface
	bpp match
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
X-List-Received-Date: Tue, 22 Sep 2015 07:41:45 -0000

17.09.2015 19:18, L=C3=A9o Grange wrote:
> Ping, as I had no feedback about this small patch.
> Please tell me if I need to do anything else.

Hello!

I've seen initial version of your patch, thought it isn't exactly trivial=
 ;),
and hoped someone will comment.  Only now I realized you sent it to -triv=
ial
but not to -devel, so there's no one to comment on it.  Please don't do t=
his,
always include qemu-devel when sending patches, so a patch will have a
chance to be reviewed.  I've added qemu-devel to Cc now.

Here, I _think_ the patch is okay, but it'd be better for it to have some
review still.

Thanks,

/mjt

> 2015-08-06 17:36 GMT+02:00 Leo Grange <grangeleo@gmail.com>:
>> Spice surface_switch fast-path was checking only width/height matching=
,
>> which leads to a crash when surface bpp has been increased but size
>> didn't change (and probably other issues if bpp has been decreased).
>>
>> Signed-off-by: Leo Grange <grangeleo@gmail.com>
>> ---
>>  ui/spice-display.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/ui/spice-display.c b/ui/spice-display.c
>> index 0360abf..d1e0972 100644
>> --- a/ui/spice-display.c
>> +++ b/ui/spice-display.c
>> @@ -406,10 +406,11 @@ void qemu_spice_display_switch(SimpleSpiceDispla=
y *ssd,
>>      SimpleSpiceUpdate *update;
>>      bool need_destroy;
>>
>> -    if (surface && ssd->surface &&
>> +    if (surface && ssd->surface && ssd->ds &&
>>          surface_width(surface) =3D=3D pixman_image_get_width(ssd->sur=
face) &&
>> -        surface_height(surface) =3D=3D pixman_image_get_height(ssd->s=
urface)) {
>> -        /* no-resize fast path: just swap backing store */
>> +        surface_height(surface) =3D=3D pixman_image_get_height(ssd->s=
urface) &&
>> +               surface_bits_per_pixel(surface) =3D=3D surface_bits_pe=
r_pixel(ssd->ds)) {
>> +        /* no-resize and no bpp change fast path: just swap backing s=
tore */
>>          dprint(1, "%s/%d: fast (%dx%d)\n", __func__, ssd->qxl.id,
>>                 surface_width(surface), surface_height(surface));
>>          qemu_mutex_lock(&ssd->lock);
>> --
>> 2.5.0
>>
>=20


