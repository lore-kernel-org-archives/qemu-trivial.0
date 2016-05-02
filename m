Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axD0x-00029q-9q
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 08:31:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axD0o-0001xy-Vx
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axD0d-0007lr-BL
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:31:37 -0400
Received: from mail-yw0-x234.google.com ([2607:f8b0:4002:c05::234]:34137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axD0c-0007gg-4c
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:31:31 -0400
Received: by mail-yw0-x234.google.com with SMTP id j74so245979369ywg.1
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=emgj8C5uIz8vUaflwcygem3AaWIqWdLrnWI85sEhTQk=;
	b=JqA3Zy703vFKA+3Lqe0P0+6E+zIExdxOukGtWgsaOeRWY8uSWuHMBWFQFuTmS8Mge/
	xyOKoPLdXf++EAewV8izc+zMJqYvcxtaR2CRaf5crJZ68Q23Jz+Z4lp6tOfNETgDG1PH
	w+ItmoGSQRmBWI6MlmWWyOH/7r8qUrg5I6yqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=emgj8C5uIz8vUaflwcygem3AaWIqWdLrnWI85sEhTQk=;
	b=MiIh3qYuDl8E6nwMyv5e4JycI7vv1gV76NUdBRsooeus3IvbbI7Diut05Y0MYQsjzr
	z9uynec9kzGZgnXt8O9jZPRZx+Q21OtdlH/pAkNQrkoxioSFdavdeJ9yEBT6zAuKY279
	5Bm4F8+P39NEFRgYZkdJfqKMdB43Sad5MufV+uehDHnTm4fK0mpsct4E0amFixF8eIoF
	RdwfJA7+ddelbIoHrR5t2DshRO6ADJaH3tUWRsAGoGYQsyqh3jG8Rv3EKDcSbwG4ZA2A
	9RYBE4bnab0b49JuGgtbPlbVd+f/f3HjAxb483K5eeSAGgj1nOcIYexSI23ojJaxH27n
	VQcQ==
X-Gm-Message-State: AOPr4FWpczcoxAqZklUp1ZSqfjpWcrGbL+aGMM9AzjeLsJ+yZAirLmI/G3Ve6rZOGJwwd59Y9WK5yrYFbVRoUYAh
X-Received: by 10.176.7.35 with SMTP id h32mr19302036uah.17.1462192268084;
	Mon, 02 May 2016 05:31:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 05:30:48 -0700 (PDT)
In-Reply-To: <5727457A.30509@msgid.tls.msk.ru>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<5727457A.30509@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 May 2016 13:30:48 +0100
Message-ID: <CAFEAcA8LHu=aKLirJ9j_SvLVu8RWMM6EbFNu7M_SDntQFo-d0g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Jan Vesely <jano.vesely@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::234
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 12:31:49 -0000

On 2 May 2016 at 13:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 29.04.2016 16:07, Jan Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fixes build failure with --enable-xfsctl and
>> new linux headers (>=3D4.5) and older xfsprogs(<4.5):
>> In file included from /usr/include/xfs/xfs.h:38:0,
>>                  from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/=
qemu-2.5.0/block/raw-posix.c:97:
>> /usr/include/xfs/xfs_fs.h:42:8: error: redefinition of =E2=80=98struct f=
sxattr=E2=80=99
>>  struct fsxattr {
>>         ^
>> In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/=
qemu-2.5.0/block/raw-posix.c:60:0:
>> /usr/include/linux/fs.h:155:8: note: originally defined here
>>  struct fsxattr {
>
> This is a bug in xfsprogs, which has been fixed by a later
> release.
>
> I think it is wrong to fix it in qemu.

We have workarounds for system library bugs in various places
in QEMU, so I don't think it's a big deal to have one here too,
if it's clearly flagged as being a bug workaround.

thanks
-- PMM

