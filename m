Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoTtj-0006cM-IS
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTtf-0006aE-Tw
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTte-00017B-7e
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:30:39 -0400
Received: from mail-bk0-x22d.google.com ([2a00:1450:4008:c01::22d]:49424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTtd-00016u-O7
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:30:37 -0400
Received: by mail-bk0-f45.google.com with SMTP id je9so1006505bkc.32
	for <qemu-trivial@nongnu.org>; Mon, 17 Jun 2013 00:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=/RtDTxj4Wd3LiAPSeSJW+0ju8VIkR6N0EC88qJj5hFU=;
	b=ai/ZVPh4D3z//a8L8jr+Y+obyFsWzZBZdAxHlM6Da3UCOS/RAqlcTsj/2GlCWY7Osm
	N8ip5jqLiPtMzRe7mNWv1ntZvXkzF6YZ0+sgNKWtjEjqyrARrvVEGwz/84DeT9+A9ztx
	OIAMo7p+BKhShJ6/m82YzZkhQitJuwaTy2rCSNNmfsIisaN8q9i3N/CdkUlhnJ3REw9w
	sKSYG8plCZcJeMNZScEwiLyzz0tWIYRgXT2sHMOYaB36vBKjKl0PXvWgTRIYqHZJpx1X
	2QfqaYwLikFsXulrw6Y0OkffkoP1rUk/t23ZOu4pMfv5aKUs0CL8YetGdUbu2DdS+geV
	SOaw==
MIME-Version: 1.0
X-Received: by 10.204.228.136 with SMTP id je8mr1704973bkb.93.1371454235885;
	Mon, 17 Jun 2013 00:30:35 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 17 Jun 2013 00:30:35 -0700 (PDT)
In-Reply-To: <51BE5EE8.5070607@suse.de>
References: <CAEgEybqrZ50JD5jmf9ge2g1VgNB5XE4wLkfxvB6qBe89vjP8Zw@mail.gmail.com>
	<51BE5EE8.5070607@suse.de>
Date: Mon, 17 Jun 2013 17:30:35 +1000
X-Google-Sender-Auth: KBelI0iForsqIajn-xK6CtTLm8k
Message-ID: <CAEgOgz6obvwmHGzjt3J5WUZOgpeYhVj3dYbrZhABwGzzCryzYw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkY0RntGQLtqLR7Y59ueSjId8rzLMZ+ouW6zaLrOouoDaNTvDwBntVp6XQqEweCfsgbAAwj
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22d
Cc: Vladimir Senkov <hangup@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] copy&paste error in serial.c causes
 a crash when attempting to read from UART (if there is no data to be read)
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
X-List-Received-Date: Mon, 17 Jun 2013 07:30:42 -0000

Hi Andreas,

On Mon, Jun 17, 2013 at 10:57 AM, Andreas F=E4rber <afaerber@suse.de> wrote=
:
> Am 17.06.2013 02:43, schrieb Vladimir Senkov:
>> From 032bdc94c6369aa7b578182cdad8038ebb2b8cd1 Mon Sep 17 00:00:00 2001
>> From: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.com>>
>> Date: Sun, 16 Jun 2013 20:30:52 -0400
>> Subject: [PATCH] fixed a copy&paste error in serial.c
>>
>> Signed-off-by: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.co=
m>>
>
> Patch is HTML-damaged unfortunately, we recommend git-send-email:
> http://wiki.qemu.org/Contribute/SubmitAPatch
>
> But since the patch is so trivial, maybe Peter or Michael can fix it up?
>

Yes I can,

Sorry about the regression. I'll give Vladamir overnight to remake if
he wants, otherwise I will remake first thing tomorrow.

Regards,
Peter

> Regards,
> Andreas
>
>> ---
>>  hw/char/serial.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/char/serial.c b/hw/char/serial.c
>> index b537e42..6382f98 100644
>> --- a/hw/char/serial.c
>> +++ b/hw/char/serial.c
>> @@ -424,7 +424,7 @@ static uint64_t serial_ioport_read(void *opaque,
>> hwaddr addr, unsigned size)
>>              ret =3D s->divider & 0xff;
>>          } else {
>>              if(s->fcr & UART_FCR_FE) {
>> -                ret =3D fifo8_is_full(&s->recv_fifo) ?
>> +                ret =3D fifo8_is_empty(&s->recv_fifo) ?
>>                              0 : fifo8_pop(&s->recv_fifo);
>>                  if (s->recv_fifo.num =3D=3D 0) {
>>                      s->lsr &=3D ~(UART_LSR_DR | UART_LSR_BI);
>> --
>> 1.8.1.2
>>
>
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg
>

