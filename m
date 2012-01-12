Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKLn-000539-8U
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:05:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1RlKLe-0004ca-Nt
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1RlKLY-000529-W4
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:05:42 -0500
Received: from mail-tul01m020-f173.google.com ([209.85.214.173]:38572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>)
	id 1RlKLS-000519-UZ; Thu, 12 Jan 2012 08:05:31 -0500
Received: by obbta7 with SMTP id ta7so772291obb.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=mHE7DpJWHYdJqJeA8aBqRjnWhA+87N7Ul7pR9kHCLKk=;
	b=eWoInv/5bLid9y8TdpymxAjKWKTXy87nNnl9gD7SKXpEP3MMtVilup3WQvtYxW/XDW
	iw1duQZW4VfO3Nc/ZLxeEG/CUHdh3FQC+EWp9SKwAxtGOwfcIUxwEOso85Pv/Qm0yhni
	D3DP2Uvw4ocpicgGs4VJ0c9g1+IMDKsvfxPb0=
MIME-Version: 1.0
Received: by 10.182.150.66 with SMTP id ug2mr2871069obb.68.1326373529083; Thu,
	12 Jan 2012 05:05:29 -0800 (PST)
Received: by 10.182.51.136 with HTTP; Thu, 12 Jan 2012 05:05:28 -0800 (PST)
In-Reply-To: <20120110083555.GA13145@stefanha-thinkpad.localdomain>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
	<20120110083555.GA13145@stefanha-thinkpad.localdomain>
Date: Thu, 12 Jan 2012 14:05:28 +0100
Message-ID: <CAOq732+AQK+WrgPeGCQdDJ6s90vx3zYCUdnb1msg3asB+KhbqQ@mail.gmail.com>
From: andrzej zaborowski <balrogg@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.173
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
X-List-Received-Date: Thu, 12 Jan 2012 13:05:48 -0000

On 10 January 2012 09:35, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Jan 09, 2012 at 06:29:51PM +0100, Stefan Weil wrote:
>> These comments are used by static code analysis tools and in code review=
s
>> to avoid false warnings because of missing break statements.
>>
>> The case statements handled here were reported by coverity.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> =C2=A0hw/pcnet.c =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
>> =C2=A0json-lexer.c =C2=A0| =C2=A0 =C2=A01 +
>> =C2=A0qemu-option.c | =C2=A0 =C2=A04 ++++
>> =C2=A03 files changed, 6 insertions(+), 0 deletions(-)
>
> This reminds me of another questionable fall-through:
>
> bt-host.c:bt_host_read():
>
> while (s->len --)
> =C2=A0 =C2=A0switch (*pkt ++) {
> =C2=A0 =C2=A0...
> =C2=A0 =C2=A0case HCI_SCODATA_PKT:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s->len < 3)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_pkt;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pktlen =3D MIN(pkt[2] + 3, s->len);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s->len -=3D pktlen;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pkt +=3D pktlen;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <--- fall-through or not?
> =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0bad_pkt:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "qemu: bad HCI packet type %02=
x\n", pkt[-1]);
> =C2=A0 =C2=A0}
>
> It seems the code will skip HCI_SCODATA_PKT and report a warning (althoug=
h type
> pkt[-1] will be incorrect). =C2=A0Any thoughts?

Yes, definitely there's a break missing.  Bluetooth SCO links are like
USB Isochronous, so not really tested because they're only used by
streaming devices.

Cheers

