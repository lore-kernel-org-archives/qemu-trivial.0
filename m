Received: from mailman by lists.gnu.org with archive (Exim 4.43)
	id 1Q8uEn-0000oy-Tn
	for mharc-qemu-trivial@gnu.org; Sun, 10 Apr 2011 08:59:34 -0400
Received: from [140.186.70.92] (port=51203 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.43) id 1Q8hyx-00054L-3W
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2011 19:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8hyv-0002qU-74
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2011 19:54:22 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:48507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8hyv-0002qJ-1q
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2011 19:54:21 -0400
Received: by pvg3 with SMTP id 3so2025748pvg.4
	for <qemu-trivial@nongnu.org>; Sat, 09 Apr 2011 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NSxeM4mIijsEJKTrTGhqmuoJy1vyI3eHR5HyHC0FbhA=;
	b=Bw5wO0Hr0WUPgFz2+Z3NxDmeSkmzxXSvS2KX6AtdV9mcFH0gZbhAwI4dZk4X8NdWw3
	TsWOYClLcj4FxfgR2WZwTRLaclAmVYy72zd5aHHV+LSDvikJ0MllRdGxcYM4PbFHmd3/
	o+7J6oE79CNtBpR6RmGlGITB/I8/lAjK4BLB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=a5j5XLuXklv2XnR0DRruxXOdm182Wp0ykjahpAq8oJXD+QOyWBu9ibzn/j1jijTQb2
	CwOfTLS8p0RZKcdki//+yL+fIy8fOK9NvjrZ7NGUSR4kMK8t9glKRVO9ETxB+k49gNFW
	blzesaPNgvg7Y/xLTzHivm5DdKsiphXArkjcU=
MIME-Version: 1.0
Received: by 10.142.134.17 with SMTP id h17mr3489114wfd.210.1302393259811;
	Sat, 09 Apr 2011 16:54:19 -0700 (PDT)
Received: by 10.68.55.230 with HTTP; Sat, 9 Apr 2011 16:54:19 -0700 (PDT)
In-Reply-To: <BANLkTinfEm0aGPY05VvVUrs8+zfB+AGM9A@mail.gmail.com>
References: <BANLkTikZuagoaj7GBeJiEwJpHtdoNASCOw@mail.gmail.com>
	<BANLkTinfEm0aGPY05VvVUrs8+zfB+AGM9A@mail.gmail.com>
Date: Sat, 9 Apr 2011 16:54:19 -0700
Message-ID: <BANLkTimj0h5Xm9YrrEzkBdeVGf=cLQubzw@mail.gmail.com>
From: Jordan Justen <jljusten@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
X-Mailman-Approved-At: Sun, 10 Apr 2011 08:59:32 -0400
Subject: [Qemu-trivial] Re: qemu trivial patch branches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: qemu-trivial.nongnu.org
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Apr 2011 23:54:23 -0000

On Fri, Apr 8, 2011 at 01:41, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Apr 7, 2011 at 11:42 PM, Jordan Justen <jljusten@gmail.com> wrote=
:
>> On Wed, Apr 6, 2011 at 13:42, Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
>>> Merged into my trivial-patches tree:
>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patch=
es
>>
>> Maybe you could list the trivial patch branches on:
>> http://wiki.qemu.org/Contribute/TrivialPatches
>>
>> ...so, trivial contributors (like myself :) can check to see if their
>> trivial patches are making progress.
>
> Bien sur! =A0I've updated the page. =A0In the future please feel free to
> update the wiki :).

I changed the email address on that page to qemu-trivial@nongnu.org,
as trivial-patches@qemu.org was not delivering for me.

I also wanted to add:
 - [http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patch=
es
browse]
But, the re-captcha is not working, and the wiki requires it for
adding urls.  Should I report this to the dev list?

-Jordan

