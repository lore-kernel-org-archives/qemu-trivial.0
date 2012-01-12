Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKWK-0002Yx-CV
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:16:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKWE-0002Le-FQ
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:16:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKW4-0006f8-Tk
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:16:38 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:57261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlKVu-0006de-6J; Thu, 12 Jan 2012 08:16:18 -0500
Received: by wibhm11 with SMTP id hm11so1431769wib.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=c6KWt/iSyqI2ufFW+rZYK3dysXO+oZv9SSGnkrIZSok=;
	b=E/I3vn5dddZZcZ5H6b/UZ3wYHSawa0uCsVphBiqrPDHx53sRfHjvgdiguR84Cjgu8P
	nlKJKUCIkY7QtmgpHmwK8+ieH8MgY95jW+FSEjCQeNqCWdQewi4pZPFURG/oi7QyCNIp
	JaFqy3pVnN2lOHWaIQCqCUgijgmZ8c84IXS5Y=
MIME-Version: 1.0
Received: by 10.180.72.162 with SMTP id e2mr6004417wiv.8.1326374177378; Thu,
	12 Jan 2012 05:16:17 -0800 (PST)
Received: by 10.180.79.170 with HTTP; Thu, 12 Jan 2012 05:16:17 -0800 (PST)
In-Reply-To: <CAOq732+AQK+WrgPeGCQdDJ6s90vx3zYCUdnb1msg3asB+KhbqQ@mail.gmail.com>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
	<20120110083555.GA13145@stefanha-thinkpad.localdomain>
	<CAOq732+AQK+WrgPeGCQdDJ6s90vx3zYCUdnb1msg3asB+KhbqQ@mail.gmail.com>
Date: Thu, 12 Jan 2012 13:16:17 +0000
Message-ID: <CAJSP0QX2KumPiE1L6NvaqyzvsJME-8WtT1zPgmFzt534Pzd5ZA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: andrzej zaborowski <balrogg@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add 'fall through' comments
 to case statements without break
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
X-List-Received-Date: Thu, 12 Jan 2012 13:16:42 -0000

On Thu, Jan 12, 2012 at 1:05 PM, andrzej zaborowski <balrogg@gmail.com> wro=
te:
> On 10 January 2012 09:35, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Mon, Jan 09, 2012 at 06:29:51PM +0100, Stefan Weil wrote:
>>> These comments are used by static code analysis tools and in code revie=
ws
>>> to avoid false warnings because of missing break statements.
>>>
>>> The case statements handled here were reported by coverity.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>> =A0hw/pcnet.c =A0 =A0| =A0 =A01 +
>>> =A0json-lexer.c =A0| =A0 =A01 +
>>> =A0qemu-option.c | =A0 =A04 ++++
>>> =A03 files changed, 6 insertions(+), 0 deletions(-)
>>
>> This reminds me of another questionable fall-through:
>>
>> bt-host.c:bt_host_read():
>>
>> while (s->len --)
>> =A0 =A0switch (*pkt ++) {
>> =A0 =A0...
>> =A0 =A0case HCI_SCODATA_PKT:
>> =A0 =A0 =A0 =A0if (s->len < 3)
>> =A0 =A0 =A0 =A0 =A0 =A0goto bad_pkt;
>>
>> =A0 =A0 =A0 =A0pktlen =3D MIN(pkt[2] + 3, s->len);
>> =A0 =A0 =A0 =A0s->len -=3D pktlen;
>> =A0 =A0 =A0 =A0pkt +=3D pktlen;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <--- fall-throug=
h or not?
>> =A0 =A0default:
>> =A0 =A0bad_pkt:
>> =A0 =A0 =A0 =A0fprintf(stderr, "qemu: bad HCI packet type %02x\n", pkt[-=
1]);
>> =A0 =A0}
>>
>> It seems the code will skip HCI_SCODATA_PKT and report a warning (althou=
gh type
>> pkt[-1] will be incorrect). =A0Any thoughts?
>
> Yes, definitely there's a break missing. =A0Bluetooth SCO links are like
> USB Isochronous, so not really tested because they're only used by
> streaming devices.

Thanks for explaining.  We can address this in a separate patch, sorry
for hijacking this thread :).

Stefan Weil: Your patch looks good.

Stefan

