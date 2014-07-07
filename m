Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4Ec7-0003Lc-AE
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1X4Ebx-0003EP-11
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1X4Ebq-0003gX-SH
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:30:00 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:37774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1X4Ebe-0003fD-Fv; Mon, 07 Jul 2014 15:29:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	ADDEE118189D; Mon,  7 Jul 2014 21:29:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id zdoKWrPTOmMN; Mon,  7 Jul 2014 21:29:38 +0200 (CEST)
Received: from [192.168.178.35] (p54AC8794.dip0.t-ipconnect.de
	[84.172.135.148])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9DDC51180F74; Mon,  7 Jul 2014 21:29:35 +0200 (CEST)
Message-ID: <53BAF51D.1040803@weilnetz.de>
Date: Mon, 07 Jul 2014 21:29:33 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1403643149-30440-1-git-send-email-sw@weilnetz.de>
	<53A9E789.8040809@redhat.com>
In-Reply-To: <53A9E789.8040809@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: Fix new compiler error with
	-Wclobbered
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
X-List-Received-Date: Mon, 07 Jul 2014 19:30:08 -0000

Am 24.06.2014 23:03, schrieb Paolo Bonzini:
> Il 24/06/2014 22:52, Stefan Weil ha scritto:
>> Newer versions of gcc report a warning (or an error with -Werror) when
>> compiler option -Wclobbered (or -Wextra) is active:
>>
>> util/oslib-posix.c:372:12: error:
>>  variable =E2=80=98hpagesize=E2=80=99 might be clobbered by =E2=80=98l=
ongjmp=E2=80=99 or =E2=80=98vfork=E2=80=99
>> [-Werror=3Dclobbered]
>>
>> The rewritten code fixes this warning: variable 'hpagesize' is now set
>> and
>> used in a block without any call of sigsetjmp or similar functions.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


Ping? Maybe this patch can be committed directly as a build fix for
people like me who use compiler flag -Wextra.

Stefan


