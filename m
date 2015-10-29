Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZriIY-00077k-As
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 04:11:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZriIV-00075s-Kh
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZriIU-0003uj-Ks
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:10:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZriIQ-0003r5-2X; Thu, 29 Oct 2015 04:10:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F3E841D58;
	Thu, 29 Oct 2015 11:10:53 +0300 (MSK)
Message-ID: <5631D48D.90007@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 11:10:53 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?TMOpbyBHcmFuZ2U=?= <grangeleo@gmail.com>, 
	qemu-trivial@nongnu.org
References: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>	<CAAOQwLqXeshTGTYxc+Hq62t+mvi=0nbHDg3Z+=87mCGXwYPFTQ@mail.gmail.com>
	<56010629.3080307@msgid.tls.msk.ru>
In-Reply-To: <56010629.3080307@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
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
X-List-Received-Date: Thu, 29 Oct 2015 08:11:00 -0000

22.09.2015 10:41, Michael Tokarev wrote:
> 17.09.2015 19:18, L=C3=A9o Grange wrote:
>> Ping, as I had no feedback about this small patch.
>> Please tell me if I need to do anything else.
>=20
> Hello!
>=20
> I've seen initial version of your patch, thought it isn't exactly trivi=
al ;),
> and hoped someone will comment.  Only now I realized you sent it to -tr=
ivial
> but not to -devel, so there's no one to comment on it.  Please don't do=
 this,
> always include qemu-devel when sending patches, so a patch will have a
> chance to be reviewed.  I've added qemu-devel to Cc now.
>=20
> Here, I _think_ the patch is okay, but it'd be better for it to have so=
me
> review still.

Gerd, Cc'ing you this time, can you please take a look at this patch?

Thanks,

/mjt

>> 2015-08-06 17:36 GMT+02:00 Leo Grange <grangeleo@gmail.com>:
>>> Spice surface_switch fast-path was checking only width/height matchin=
g,
>>> which leads to a crash when surface bpp has been increased but size
>>> didn't change (and probably other issues if bpp has been decreased).
>>>
>>> Signed-off-by: Leo Grange <grangeleo@gmail.com>
>>> ---
>>>  ui/spice-display.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/ui/spice-display.c b/ui/spice-display.c
>>> index 0360abf..d1e0972 100644
>>> --- a/ui/spice-display.c
>>> +++ b/ui/spice-display.c
>>> @@ -406,10 +406,11 @@ void qemu_spice_display_switch(SimpleSpiceDispl=
ay *ssd,
>>>      SimpleSpiceUpdate *update;
>>>      bool need_destroy;
>>>
>>> -    if (surface && ssd->surface &&
>>> +    if (surface && ssd->surface && ssd->ds &&
>>>          surface_width(surface) =3D=3D pixman_image_get_width(ssd->su=
rface) &&
>>> -        surface_height(surface) =3D=3D pixman_image_get_height(ssd->=
surface)) {
>>> -        /* no-resize fast path: just swap backing store */
>>> +        surface_height(surface) =3D=3D pixman_image_get_height(ssd->=
surface) &&
>>> +               surface_bits_per_pixel(surface) =3D=3D surface_bits_p=
er_pixel(ssd->ds)) {
>>> +        /* no-resize and no bpp change fast path: just swap backing =
store */
>>>          dprint(1, "%s/%d: fast (%dx%d)\n", __func__, ssd->qxl.id,
>>>                 surface_width(surface), surface_height(surface));
>>>          qemu_mutex_lock(&ssd->lock);
>>> --
>>> 2.5.0
>>>
>>
>=20
>=20


