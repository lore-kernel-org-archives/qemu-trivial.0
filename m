Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZzdc-00040S-A0
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 02:13:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZzdZ-0003zc-N4
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 02:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZzdX-0007sz-Pf
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 02:13:05 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:42732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZzdT-0007sL-FP; Fri, 24 Jun 2011 02:12:59 -0400
Received: by gyg10 with SMTP id 10so1280310gyg.4
	for <multiple recipients>; Thu, 23 Jun 2011 23:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=C2hGN0DJc956v8TQfc1hfOzv4T6sLH1s5Ay71mgNbAo=;
	b=QhJC3RFqf+RHLEN6ItQZRt4VZVdERZ4WyHKtZKVmBBFPcKRAvTiiZjliljU5yd6Xrp
	vZdQg6erZCRnOWYm/PzL/IP+GOebHAJpZ6DtiS0mcjNRKnl7QA7eto9LCFqcqqZBpaeJ
	Bqc4wms/ndoA2bG2l3SzN3JQJ5BAd/7Bqyurg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=wUvvAJzQQS4S5KmKOSbNE8pioqojULKp5bNj37WISa5L3xmITYlsrLYd6e3mZqMvBp
	gzDNCgq87DyZX2sm6VNHRfTjkjfM/16mIoMM1Pw/fPeT81RlFbjRTFTHy4iZkxKqDoQv
	ZsNzVXgew9XIY7U0aKch1JA+bb5xcJnzRiQTI=
MIME-Version: 1.0
Received: by 10.150.253.15 with SMTP id a15mr3418783ybi.160.1308895978235;
	Thu, 23 Jun 2011 23:12:58 -0700 (PDT)
Received: by 10.147.136.16 with HTTP; Thu, 23 Jun 2011 23:12:58 -0700 (PDT)
In-Reply-To: <4E042A94.7020608@mail.berlios.de>
References: <4E02F63E.3010908@web.de>
	<20110623133508.GF12698@stefanha-thinkpad.localdomain>
	<4E034E79.5050901@mail.berlios.de>
	<BANLkTikpwAVCpEdQzpBWLx=2CmkxXxEMAA@mail.gmail.com>
	<4E042A94.7020608@mail.berlios.de>
Date: Fri, 24 Jun 2011 07:12:58 +0100
Message-ID: <BANLkTi=jmJX3uoKs31fPnQn_UvdZNgAj3w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Fri, 24 Jun 2011 06:13:07 -0000

On Fri, Jun 24, 2011 at 7:11 AM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 24.06.2011 07:41, schrieb Stefan Hajnoczi:
>>
>> On Thu, Jun 23, 2011 at 3:32 PM, Stefan Weil <weil@mail.berlios.de> wrot=
e:
>>>
>>> Am 23.06.2011 15:35, schrieb Stefan Hajnoczi:
>>>>
>>>> On Thu, Jun 23, 2011 at 10:15:58AM +0200, Jan Kiszka wrote:
>>>>>
>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>
>>>>> Recent mingw32 provide those defines.
>>>
>>> ... and all of those defines are wrong, because QEMU does not use
>>> MS format specifiers. http://patchwork.ozlabs.org/patch/74276/
>>> tried to fix this. My preferred solution is removing those PRI*64 from
>>> qemu-common.h, because not only recent mingw32 versions provide
>>> the (wrong) definitions, but even the Debian version provides them
>>> (which is really old, but I use it for my regression tests).
>>>
>>> The wrong definitions do not allow using -Wformat for mingw32
>>> builds, but they work because (most?) relevant mingw32 functions
>>> accept both MS and standard format specifiers.
>>>
>>> Adding the correct definitions (to qemu-os-win32.h, not to qemu-common.=
h)
>>> would be another solution as long as mingw32 does not handle
>>> __USE_MINGW_ANSI_STDIO correctly.
>>>
>>>>>
>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>> ---
>>>>> qemu-common.h | 3 +++
>>>>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>>>
>>>> It's never too late to implement C99!
>>>>
>>>> Thanks, applied to the trivial patches tree:
>>>>
>>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patc=
hes
>>>>
>>>> Stefan
>>>
>>> Stefan, the patch won't harm, but it's also unnecessary.
>>> So it's up to you whether you remove it from your queue,
>>> modify it as I suggested above or apply it as it is.
>>
>> Keeping those #defines unconditional prevents new mingw builds from
>> working, according to the commit description. So we have to either
>> remove them entirely or do them correctly. Dropping this patch will
>> keep the build from working.
>>
>> I suggest we keep this patch. A follow-up patch can us MS format
>> specifiers or do any other adjustments that make this work better.
>> Stefan, would you be able to send that patch?
>>
>> Stefan
>
> Hi Stefan,
>
> I just did a "git blame include/inttypes.h" on cygwin/mingw32 sources
> (git repository created from CVS). Here is the result:
>
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 =A034) #define PRId64 "I64=
d"
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 =A052) #define PRIi64 "I64=
i"
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 =A070) #define PRIo64 "I64=
o"
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 =A090) #define PRIu64 "I64=
u"
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 109) #define PRIx64 "I64x"
> 8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 127) #define PRIX64 "I64X"
>
> The format specifiers were added in 2002 and never changed since that tim=
e,
> so they are rather old. They don't break any current mingw32 builds.
> They will break builds as soon as mingw32 fixes the wrong definitions
> (which I don't expect for the next months).
>
> I'll send a patch which simply removes the definitions from
> qemu-common.h, so Jan's patch is no longer needed.

Thanks!

Stefan

