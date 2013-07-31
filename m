Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4VSr-0006RC-L9
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 08:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4VSi-00069i-Rt
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 08:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4VSc-00067L-OF
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 08:25:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V4VSP-00063W-Ob; Wed, 31 Jul 2013 08:24:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 13E57434DC;
	Wed, 31 Jul 2013 16:24:44 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id CBA704C3;
	Wed, 31 Jul 2013 16:24:43 +0400 (MSK)
Message-ID: <51F9020B.7090504@msgid.tls.msk.ru>
Date: Wed, 31 Jul 2013 16:24:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51F8E68F.4030006@msgid.tls.msk.ru>
	<CAFEAcA8UZRQAv9NLRcyvUffXMKMM01FauUDvmxiGRwHJzmUM1g@mail.gmail.com>
	<51F8FD2C.1010002@suse.de>
In-Reply-To: <51F8FD2C.1010002@suse.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: build it even if
	!system
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
X-List-Received-Date: Wed, 31 Jul 2013 12:25:12 -0000

31.07.2013 16:03, Andreas F=C3=A4rber wrote:
> Am 31.07.2013 13:05, schrieb Peter Maydell:
>>> Actually the more I think about it... Maybe it shouldn't depend
>>> on --enable-tools either, but should be an independent option.
>>> Because it isn't really a tool.
>>
>> This seems to me to be unnecessarily breaking things down
>> into very finely divided categories. I think putting it
>> in --enable-tools is fine.
>=20
> I disagree. Think about building a Windows guest agent: You don't need
> qemu-img (tools) on a Windows guest, and mjt is right that it shouldn't
> be coupled to building any qemu-system-*.

It's not a tool, but indeed that's unnecessary too fine-grained.
I'm not sure which way is preferrable :)

> However it looks as if the linux/bsd/solaris checks got lost in the pat=
ch?

No, the new place is already within linux/bsd/solaris conditional.

/mjt

