Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9mQA-0004lD-KH
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 21:32:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V9mQ2-0004k9-Eo
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 21:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V9mPx-00010n-9p
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 21:32:06 -0400
Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233]:55629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V9mPx-00010g-4k; Wed, 14 Aug 2013 21:32:01 -0400
Received: by mail-ve0-f179.google.com with SMTP id c13so155796vea.24
	for <multiple recipients>; Wed, 14 Aug 2013 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ljNncmK0JZ9FY2T8IawYrL+Pz8NqiH90VDs7CJ64poE=;
	b=UXIcqwvh/nzWakVQxu5lWzJZ4Vy3ggOIlRMoJXKkvPl9xuDXlQVpsQVQ7TupTDJLou
	YLHOHs/ohRJTzShka7nTut/m3c785szdx9eFbUOTFGhte1KYB9hVGwqtkmGlegn9MyMS
	MPiksArMkYPhyfx4ugRLQImh2jpuIhosO/vFXiw2b/aYEfDFeuiZIT9pPliSKnS7IBIj
	dls5DFz/B9YvVODCAuDCCjy2UtNbgXjE+HPK1PgptAW7aWfH6YeJIFCCtOEUmDiDLwQo
	RJrKUNTb7boxhVhwfTJ7797wmwlExCOWyCc5TRjFUvoNsf1NV9Rw4JBxn9TglLJet10n
	so0g==
X-Received: by 10.220.164.202 with SMTP id f10mr12146293vcy.25.1376530320234; 
	Wed, 14 Aug 2013 18:32:00 -0700 (PDT)
Received: from [192.168.0.3] (d14-69-153-26.try.wideopenwest.com.
	[69.14.26.153])
	by mx.google.com with ESMTPSA id xs3sm33530380vdb.3.2013.08.14.18.31.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 18:31:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <B8F69B83-8EC9-4337-99BF-B18B84CB7531@suse.de>
Date: Wed, 14 Aug 2013 21:31:56 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <13863120-443B-4B80-939C-543A8216EF01@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
	<2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
	<BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
	<CA+aC4kuJG0_uOYJRf21Kirp2pMxp-VG0ztXQESht=-1hh=zEqA@mail.gmail.com>
	<CAFEAcA_m6Af5tRB=s0h0TiO6ghbKi+hVvtnB2f3CeAtY2S7UbQ@mail.gmail.com>
	<B8F69B83-8EC9-4337-99BF-B18B84CB7531@suse.de>
To: Alexander Graf <agraf@suse.de>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c01::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH v2] Adds the
	ability to use the command key in the guest operating system.
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
X-List-Received-Date: Thu, 15 Aug 2013 01:32:12 -0000


On Aug 14, 2013, at 4:58 PM, Alexander Graf wrote:

>=20
> On 14.08.2013, at 22:52, Peter Maydell wrote:
>=20
>> On 14 August 2013 21:44, Anthony Liguori <anthony@codemonkey.ws> =
wrote:
>>> I'm confident there's a way to get hardware keycodes on OS X.  There
>>> is on every other UI platform that I know of.  That's the best way =
to
>>> solve this.

I know you want to use hardware keycodes, but here are (IMHO) the =
reasons why we should stick with the PC/XT layout:
1) Simple - only one keyboard layout to deal with.
2) Compatible - This layout works with operating systems from MS-DOS 1.0 =
to Ubuntu Linux 12.=20
3) Less work - no major code changes.
4) Good enough - does work with Mac OS X.=20
5) Would Mac keyboard keycodes work with Windows, AIX, Solaris, and =
OS/2? Doubt it. Guess which keyboard layout would work.

>>=20
>> Sure, but that doesn't answer the fundamental question of "when
>> should the OS's window/menu accelerator operate the OS menu and
>> when should it be passed to the guest as a raw key". However you
>> get the keycodes you still have that choice.
>=20
> The normal rule of thumb IIRC is when mouse grab is active, everything =
goes into the guest.

That is a good idea. I am thinking of eliminating the -command-key =
option and just doing the above suggestion.=20

Anybody else have their own idea for solving the command key issue?=20=

