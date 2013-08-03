Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5lUC-0007XB-Tm
	for mharc-qemu-trivial@gnu.org; Sat, 03 Aug 2013 19:43:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V5lU5-0007Wx-DJ
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 19:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V5lTz-0003vD-LX
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 19:43:41 -0400
Received: from mail-qe0-x22d.google.com ([2607:f8b0:400d:c02::22d]:65330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V5lTo-0003tK-F6; Sat, 03 Aug 2013 19:43:24 -0400
Received: by mail-qe0-f45.google.com with SMTP id x7so1069384qeu.18
	for <multiple recipients>; Sat, 03 Aug 2013 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=H5M9iT3Hmsf6OtoDyjNFPFJmGSBBmWzEOLqYMNHhZ0Q=;
	b=ePV3jIJ+goJ8SHhj09EhSn5fYWhvp4DuIJVj2SNLeuyouac3l6XhDaSZPChxcOOehj
	OJ0AVtaHEZZU2BDXpl892Pv8tR8JV7RkZpUz7bQuI2iGRPvrtKoYxsctZjuwJyfCdyAu
	L0KEqNjhYRibjIsnrk0vXoQhwSzOqywIS76vkWfHpyEAuPQZ5gqF8sWCUsw77c+Rv+ED
	f5IZ+mIII8tkw32AzDvxL6qXWjB/UUK9lykAhoUPUxnt7BOERdkb55M7YG7REl+W+b4r
	2racYk9A+XjCJFMtDr7szIS7y4cSJjz2zbsJpgWPLwjprnBZKMtcNtaNKhspAg9UWmOO
	dytQ==
X-Received: by 10.224.50.204 with SMTP id a12mr20223349qag.17.1375573403823;
	Sat, 03 Aug 2013 16:43:23 -0700 (PDT)
Received: from [192.168.0.2] (d14-69-153-26.try.wideopenwest.com.
	[69.14.26.153])
	by mx.google.com with ESMTPSA id d1sm7059711qag.6.2013.08.03.16.43.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 16:43:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
Date: Sat, 3 Aug 2013 19:43:21 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22d
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Sat, 03 Aug 2013 23:43:47 -0000


On Aug 3, 2013, at 7:06 PM, Peter Maydell wrote:

> On 3 August 2013 23:52, G 3 <programmingkidx@gmail.com> wrote:
>> This patch adds the ability to use the command key in the guest
>> operating system. Just add -command-key 55 to the command line
>> options sent to QEMU to use this feature.
>>=20
>> I have checked the patch by sending it thru checkpatch.pl this time. =
I also
>> made a bunch of style changes to more closely match QEMU's suggested =
coding
>> style.
>>=20
>> signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>>=20
>> ---
>> ui/cocoa.m |  114
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>> 1 files changed, 104 insertions(+), 10 deletions(-)
>=20
> This definitely isn't "trivial".
>=20
> I'm also really unconvinced that this is the right way to handle
> this: adding a new cocoa-UI-only command line option which takes
> a magic number looks very odd.
>=20
> thanks
> -- PMM

Why don't you think it is trivial? There aren't many cocoa-ui users. =
This patch falls into a very small and little used area of QEMU. I think =
that makes this patch a trivial one.=20

The way of how to handle send the command key into the guest operating =
system has already been discussed. This way lets the user decide at =
runtime how best to handle the command key. The magic number you talk =
about is actually a virtual key value. Every key has their own virtual =
key.

Do you have your own idea as to how to handle the command key?=20=

