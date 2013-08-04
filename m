Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V62wk-0000zo-Ec
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 14:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V62wd-0000yS-I8
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V62wY-0001N6-3h
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:22:19 -0400
Received: from mail-qe0-x233.google.com ([2607:f8b0:400d:c02::233]:44299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V62wY-0001N1-0n; Sun, 04 Aug 2013 14:22:14 -0400
Received: by mail-qe0-f51.google.com with SMTP id nd7so1308588qeb.38
	for <multiple recipients>; Sun, 04 Aug 2013 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=GY1a8+rUEV0ItzLvi6qqGvwV8JxyKlA79Ff1g67u5sE=;
	b=KJ7iAvutw8ACYVkk7jPig5iKpoyQLsWBCdUWgw1VUWqucWs++O/3gx1qhpNWR5dfUc
	qbLiFlVrtx0ujtUur2UGwoTwD1I9vmXeacOuT8hUrsiEQKMZDCvFwiLjA8QP2TYstpo5
	k7POt/igRE5ZghCtoRITpUDxaL3dQbt4mnjEGkJHC4KAcXFs36Mk+rsmeBhQ7kgsaovW
	RVkTia4yi16i02mdFJ+hpdYLGbVu9iLJQ6/i5ejEOC+fVgmfbp/6uvlDxB7KOIJgRCb/
	fdRbcioztDJZCV3TYf7Gu9tC8aAVBleSpSSbVIjVPnchEDbr4Rp+V3JrTilnfu6cNT67
	sO2w==
X-Received: by 10.224.49.130 with SMTP id v2mr23715229qaf.75.1375640533619;
	Sun, 04 Aug 2013 11:22:13 -0700 (PDT)
Received: from [192.168.0.2] (d14-69-153-26.try.wideopenwest.com.
	[69.14.26.153])
	by mx.google.com with ESMTPSA id lk8sm62633qeb.3.2013.08.04.11.22.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 11:22:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CA+aC4ktgrnt__57o9uA+Er0Qe7HU5qy10n3XWUY6gy+q9D781Q@mail.gmail.com>
Date: Sun, 4 Aug 2013 14:22:11 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9B3E155-9B81-4E76-9166-404D66513F9F@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<CA+aC4ktgrnt__57o9uA+Er0Qe7HU5qy10n3XWUY6gy+q9D781Q@mail.gmail.com>
To: Anthony Liguori <anthony@codemonkey.ws>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::233
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Adds the ability to use
	the command key in the guest operating system.
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
X-List-Received-Date: Sun, 04 Aug 2013 18:22:25 -0000


On Aug 4, 2013, at 7:58 AM, Anthony Liguori wrote:

> On Sun, Aug 4, 2013 at 4:39 AM, Peter Maydell =
<peter.maydell@linaro.org> wrote:
>>=20
>> "Should the QEMU UI use the menu-accelerator key for menus or
>> should it pass it through to the guest" is a generic UI front-end
>> problem; any solution should not be specific to a single UI,
>> we should handle it the same way for all front-ends.
>=20

Ok. I guess that sounds like a good idea, but hard to implement. I don't =
think any single piece of code could be applied to all the different =
UI's. There is SDL, GTK, Cocoa, and who knows what else to handle. Each =
UI library would need its own code to deal with the meta key issue.=20

> The right way to handle this would be to access the hardware keycode
> and avoid the keymap table entirely.  I'm sure there is such an API in
> Cocoa...
>=20
> Regards,
>=20
> Anthony Liguori

Your idea does have a few issues with it. This might work with a Mac =
guest on a Mac host, but what about a PC guest on a Mac host? A PC =
operating system like Windows 95 would probably not be able to recognize =
a Macintosh keyboard. The current strategy in cocoa.m is to emulate a =
pc/xt keyboard. This kind of keyboard works for a lot of different guest =
operating systems - including Mac OS X.=20=

