Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9hvk-0008Jy-Tz
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 16:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V9hve-0008Jm-MV
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V9hvZ-0007Sw-Qh
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:44:26 -0400
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V9hvZ-0007Se-MB
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:44:21 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so12680878obc.34
	for <qemu-trivial@nongnu.org>; Wed, 14 Aug 2013 13:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=UxrmHgAmq5fUxvpQYwmndX9f87hrJYQ5LlGu8AuegeA=;
	b=f7w54QVH44hmFk5X46bRz81Yb3SQgmA3ixI+FyinBTBLJPDfSGiigUG60TRgjjd5kK
	KGPvggSiEWZdAsAIsRDOUjNfsNEl2YxpvVvsZrdYcQEvZEWuktOLV2zciHfUdQRnUa0n
	7yi/DSitLPfFEubsuD369E3EMN0H0YKVRZuNs6zxy6p8Ko9X2OXYifljW3StGANOvTV+
	O5V8ka94hpoxiV1SEMpRcRg9JJ/EI36LRbfP7NuJr1G+cPjCv3jphTZgzLTNWTraTzV9
	ok13Ft4hhndJGGl5wnpx7zaOnuZFusMA7aDMNOzSCzDiA91YvzGSnc2JBhCQNNK/I869
	Ytag==
X-Gm-Message-State: ALoCoQnX0ShBwaoydV3aGbXmdqTbE3o300rsBkAdOhFwrQhbtGZQRqFjUG1oLCOfW5KVxNku0hVK
MIME-Version: 1.0
X-Received: by 10.182.65.1 with SMTP id t1mr22853477obs.5.1376513060965; Wed,
	14 Aug 2013 13:44:20 -0700 (PDT)
Received: by 10.60.54.104 with HTTP; Wed, 14 Aug 2013 13:44:20 -0700 (PDT)
In-Reply-To: <BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
	<2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
	<BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
Date: Wed, 14 Aug 2013 15:44:20 -0500
Message-ID: <CA+aC4kuJG0_uOYJRf21Kirp2pMxp-VG0ztXQESht=-1hh=zEqA@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.175
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	Programmingkid <programmingkidx@gmail.com>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
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
X-List-Received-Date: Wed, 14 Aug 2013 20:44:31 -0000

I'm confident there's a way to get hardware keycodes on OS X.  There
is on every other UI platform that I know of.  That's the best way to
solve this.

Regards,

Anthony Liguori

On Wed, Aug 14, 2013 at 1:02 PM, Alexander Graf <agraf@suse.de> wrote:
>
> On 04.08.2013, at 20:52, Programmingkid wrote:
>
>>
>> On Aug 4, 2013, at 2:07 PM, Peter Maydell wrote:
>>
>>> On 4 August 2013 18:53, Programmingkid <programmingkidx@gmail.com> wrot=
e:
>>>> On Aug 4, 2013, at 5:39 AM, Peter Maydell wrote
>>>>> Right, but I don't have to specify anything about any other
>>>>> key on the keyboard, why should command be special?
>>>>
>>>> The command key is used to send commands to an application. When
>>>> the user runs Mac OS X in QEMU, and the host operating system is
>>>> Mac OS X, this can cause problems.
>>>
>>> Yes, I understand the problem. Why is this any different to
>>> the similar issue with the menu-key or the Windows key in Windows
>>> (where you also might want to pass it through to the guest,
>>> or have it handled outside the guest).
>>
>> I don't use QEMU on a PC, so I don't have experience with this issue. Bu=
t it does sound like the problem I had on Mac OS X. For anyone who uses QEM=
U on Windows, is the control key used to send commands to QEMU, and sent to=
 the guest operating system? I'm wondering if someone out there uses a Wind=
ows guest on a Windows host can help us with this issue.
>>
>>>
>>>>>> Do you have your own idea as to how to handle the command key?
>>>>>
>>>>> "Should the QEMU UI use the menu-accelerator key for menus or
>>>>> should it pass it through to the guest" is a generic UI front-end
>>>>> problem; any solution should not be specific to a single UI,
>>>>> we should handle it the same way for all front-ends.
>>
>> The problem with this idea is each UI has its own implementation library=
: SDL, GTK, Cocoa. Each UI would have to have its solution coded differentl=
y. There is no one size fits all solution. I honestly don't know if this is=
 an issue with the SDL and GTK UI's.
>
> The argument is that the user experience and configuration methods should=
 be as close as possible / reasonable across the different UI backends.
>
>
> Alex
>
>

