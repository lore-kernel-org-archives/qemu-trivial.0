Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V63QN-0002Av-1g
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 14:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V63QC-00026M-BW
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V63Q3-0003qF-T7
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:52:52 -0400
Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235]:61023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V63Pm-0003mZ-1Y; Sun, 04 Aug 2013 14:52:26 -0400
Received: by mail-qa0-f53.google.com with SMTP id hu14so581842qab.5
	for <multiple recipients>; Sun, 04 Aug 2013 11:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=UuP8lJhmbmv+ceEyJmcdJPbyFSvTLoVBF5e1fZZyT3M=;
	b=e6uPgk+1pnm2WFkzcVWIl5jroZlSIVLV/u+JT4MR3Yp0lfR6CAtZJrKkFKPyBidpUw
	yrYtgQQi0lp+/ywTFajj7Imfsc2ABCIFx71dfBNKc0kZjjWx9yPN2WYhWlwVGt1rcpDp
	mARuuJsLGik+RuWY+y2KT0sWQ/Pw5p75S2iT8PHa9ofNhuxMuE7pspA1qEenk2QjFgAQ
	xX/oYgPUpCAuS7ujtCUoh5AZMJCoS43MojtFI3n+cS6TUArx81HbmfttY5Xm2QcEH5nR
	YAbtHtYdGv7YLeMB4sV/fUADnr7BLIdC1KY0JPBhd3FriKVE4+Pn/X94pxgjVCzmzrKa
	R4XQ==
X-Received: by 10.229.158.3 with SMTP id d3mr5106591qcx.72.1375642345572;
	Sun, 04 Aug 2013 11:52:25 -0700 (PDT)
Received: from [192.168.0.2] (d14-69-153-26.try.wideopenwest.com.
	[69.14.26.153])
	by mx.google.com with ESMTPSA id nh4sm1983053qeb.6.2013.08.04.11.52.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 11:52:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
Date: Sun, 4 Aug 2013 14:52:22 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::235
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sun, 04 Aug 2013 18:53:02 -0000


On Aug 4, 2013, at 2:07 PM, Peter Maydell wrote:

> On 4 August 2013 18:53, Programmingkid <programmingkidx@gmail.com> =
wrote:
>> On Aug 4, 2013, at 5:39 AM, Peter Maydell wrote
>>> Right, but I don't have to specify anything about any other
>>> key on the keyboard, why should command be special?
>>=20
>> The command key is used to send commands to an application. When
>> the user runs Mac OS X in QEMU, and the host operating system is
>> Mac OS X, this can cause problems.
>=20
> Yes, I understand the problem. Why is this any different to
> the similar issue with the menu-key or the Windows key in Windows
> (where you also might want to pass it through to the guest,
> or have it handled outside the guest).

I don't use QEMU on a PC, so I don't have experience with this issue. =
But it does sound like the problem I had on Mac OS X. For anyone who =
uses QEMU on Windows, is the control key used to send commands to QEMU, =
and sent to the guest operating system? I'm wondering if someone out =
there uses a Windows guest on a Windows host can help us with this =
issue.=20

>=20
>>>> Do you have your own idea as to how to handle the command key?
>>>=20
>>> "Should the QEMU UI use the menu-accelerator key for menus or
>>> should it pass it through to the guest" is a generic UI front-end
>>> problem; any solution should not be specific to a single UI,
>>> we should handle it the same way for all front-ends.

The problem with this idea is each UI has its own implementation =
library: SDL, GTK, Cocoa. Each UI would have to have its solution coded =
differently. There is no one size fits all solution. I honestly don't =
know if this is an issue with the SDL and GTK UI's.=20=

