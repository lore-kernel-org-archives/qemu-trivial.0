Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLyJI-000518-6y
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 12:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLyJB-0004tC-AS
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 12:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLyJ5-0007B6-9L
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 12:39:25 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:58588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VLyIs-00078O-SG; Tue, 17 Sep 2013 12:39:07 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6612A72819E9; Tue, 17 Sep 2013 18:39:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id cg19SrJlvm1z; Tue, 17 Sep 2013 18:38:54 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBB22.dip0.t-ipconnect.de [84.173.187.34])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	242CD72819DE; Tue, 17 Sep 2013 18:38:54 +0200 (CEST)
Message-ID: <5238859C.2040908@weilnetz.de>
Date: Tue, 17 Sep 2013 18:38:52 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CA+aC4kv6ijDVhjLSK6LgqmdHbVVJgFEokD3TCYsx9-sT1hZ3+A@mail.gmail.com>
In-Reply-To: <CA+aC4kv6ijDVhjLSK6LgqmdHbVVJgFEokD3TCYsx9-sT1hZ3+A@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/15] trivial patches for
	2013-09-14
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
X-List-Received-Date: Tue, 17 Sep 2013 16:39:31 -0000

Am 17.09.2013 17:06, schrieb Anthony Liguori:
> On Sat, Sep 14, 2013 at 2:47 PM, Michael Tokarev <mjt@tls.msk.ru> wrote=
:
>> Just a bit late but here's the next trivial-patches pull request.
>>
>> Thanks,
> Breaks the build:
>
> /home/anthony/git/qemu/cpu-exec.c: In function =E2=80=98cpu_alpha_exec=E2=
=80=99:
> /home/anthony/git/qemu/cpu-exec.c:204:15: error: variable =E2=80=98cpu=E2=
=80=99 might
> be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-=
Werror=3Dclobbered]
> /home/anthony/git/qemu/cpu-exec.c:202:28: error: argument =E2=80=98env=E2=
=80=99 might
> be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-=
Werror=3Dclobbered]
> cc1: all warnings being treated as errors
>
> I think it's one of the warning patches from Stefan.  I cannot bisect
> here.  My gcc info is below:

Yes, it's the new -Wextra compiler (see "configure: Enable extra
compiler warnings").
Some versions of gcc complain about this code in cpu-exec.c:

            /* Reload env after longjmp - the compiler may have smashed a=
ll
             * local variables as longjmp is marked 'noreturn'. */
            cpu =3D current_cpu;
            env =3D cpu->env_ptr;

I think that lines can be simply removed (which also fixes the warning).
Please apply the trivial patches without my -Wextra patch or wait until
I have sent a patch to fix cpu-exec.c.

Regards
Stefan


