Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V62V6-0007hd-JM
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 13:53:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V62Uz-0007hI-Lv
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 13:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V62Uu-0008S6-30
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 13:53:45 -0400
Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a]:46969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V62Ui-0008Qa-Hb; Sun, 04 Aug 2013 13:53:28 -0400
Received: by mail-qe0-f42.google.com with SMTP id s14so1322597qeb.1
	for <multiple recipients>; Sun, 04 Aug 2013 10:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=9hDm+CwdlMQJKrfnS9OUEQLgBQ1d4mSJmC7BXMh7IhM=;
	b=ul57AYFDffveDrHe1ypLG9S6xIlwFEPXexHCHLyrPngWhF5DVziH0wzoTm5LMxIt+1
	SUD/iN1ecnaC/yRKg8pvRoE/PeKAkDfVLJzYIRAwyw6yVwzI4x60i/9TG4AlWQ2ndae2
	wkkBLK0Vs+8+Fji13LoeAVgP6+dLWp2SBJh+AD24WWJPxJet7/942ZDIH1N+IESjoRvF
	rtwZqApJcQTlLjO8c+7LjjIpO+EsqjP2nooYXk53yBCCm+L7DGGXrP8LNas6pik63bPL
	wRwyq53e9zsdFjn4QHqQkDqtqLZKXW7bLEy/eGlQh2ADNt7vnCiYPcKQHtIRAU3Xcrah
	j7oA==
X-Received: by 10.224.24.199 with SMTP id w7mr23646576qab.82.1375638807545;
	Sun, 04 Aug 2013 10:53:27 -0700 (PDT)
Received: from [192.168.0.2] (d14-69-153-26.try.wideopenwest.com.
	[69.14.26.153])
	by mx.google.com with ESMTPSA id h4sm795365qai.6.2013.08.04.10.53.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 10:53:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
Date: Sun, 4 Aug 2013 13:53:24 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22a
Cc: qemu-trivial@nongnu.org,
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
X-List-Received-Date: Sun, 04 Aug 2013 17:53:51 -0000


On Aug 4, 2013, at 5:39 AM, Peter Maydell wrote:

> On 4 August 2013 00:43, Programmingkid <programmingkidx@gmail.com> =
wrote:
>>=20
>> On Aug 3, 2013, at 7:06 PM, Peter Maydell wrote:
>>=20
>>> On 3 August 2013 23:52, G 3 <programmingkidx@gmail.com> wrote:
>>>> This patch adds the ability to use the command key in the guest
>>>> operating system. Just add -command-key 55 to the command line
>>>> options sent to QEMU to use this feature.
>>>>=20
>>>> I have checked the patch by sending it thru checkpatch.pl this =
time. I also
>>>> made a bunch of style changes to more closely match QEMU's =
suggested coding
>>>> style.
>>>>=20
>>>> signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>>>>=20
>>>> ---
>>>> ui/cocoa.m |  114
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>>>> 1 files changed, 104 insertions(+), 10 deletions(-)
>>>=20
>>> This definitely isn't "trivial".
>>>=20
>>> I'm also really unconvinced that this is the right way to handle
>>> this: adding a new cocoa-UI-only command line option which takes
>>> a magic number looks very odd.
>=20
>> Why don't you think it is trivial?
>=20
> It's over 100 lines long; it's not "obviously correct"; it adds
> a new command line switch; cocoa.m has a listed maintainer.
>=20
>> The way of how to handle send the command key into the guest =
operating
>> system has already been discussed. This way lets the user decide at
>> runtime how best to handle the command key. The magic number you talk
>> about is actually a virtual key value. Every key has their own
>> virtual key.
>=20
> Right, but I don't have to specify anything about any other
> key on the keyboard, why should command be special?

The command key is used to send commands to an application. When the =
user runs Mac OS X in QEMU, and the host operating system is Mac OS X, =
this can cause problems. Users like me want to use the command key in =
the guest operating system, but we also need to send commands to QEMU. =
So this causes problems. Every user is going to have their own idea on =
how to solve this problem. So the way to fix this problem is to have the =
user decide which key should act as the command key.=20

>=20
>> Do you have your own idea as to how to handle the command key?
>=20
> "Should the QEMU UI use the menu-accelerator key for menus or
> should it pass it through to the guest" is a generic UI front-end
> problem; any solution should not be specific to a single UI,
> we should handle it the same way for all front-ends.

?=

