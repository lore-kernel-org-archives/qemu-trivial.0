Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V22ot-0002bC-Re
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 13:25:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1V21rG-0005VX-G5
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1V21rD-0002Rv-Nv
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 12:24:10 -0400
Received: from multi.imgtec.com ([194.200.65.239]:19162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>)
	id 1V21rD-0002Ri-Hz; Wed, 24 Jul 2013 12:24:07 -0400
From: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Thread-Topic: [Qemu-devel] [Qemu-trivial] [PATCH] linux-user: correct
	argument number for sys_mremap and sys_splice
Thread-Index: AQHOh8Y1woQcnX7M6EG14suwj+zQtply9wYAgAAEQICAAQgSEg==
Date: Wed, 24 Jul 2013 16:22:50 +0000
Message-ID: <56EA75BA695AE044ACFB41322F6D2BF40223EA68@BADAG02.ba.imgtec.org>
References: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
	<51EEBAD6.4020607@msgid.tls.msk.ru>,
	<CAFEAcA87Vf5OOMNtnNhWMsRBJWr7WG3LBut9b5rW-iC9=n32mg@mail.gmail.com>
In-Reply-To: <CAFEAcA87Vf5OOMNtnNhWMsRBJWr7WG3LBut9b5rW-iC9=n32mg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.64.117]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEF-Processed: 7_3_0_01192__2013_07_24_17_24_05
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
X-Mailman-Approved-At: Wed, 24 Jul 2013 13:25:46 -0400
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@linaro.org" <riku.voipio@linaro.org>,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: correct
 argument number for sys_mremap and sys_splice
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
X-List-Received-Date: Wed, 24 Jul 2013 16:24:13 -0000

=0A=
________________________________________=0A=
From: Peter Maydell [peter.maydell@linaro.org]=0A=
Sent: Tuesday, July 23, 2013 7:33 PM=0A=
To: Michael Tokarev=0A=
Cc: Petar Jovanovic; qemu-trivial@nongnu.org; riku.voipio@linaro.org; qemu-=
devel@nongnu.org; Petar Jovanovic=0A=
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] linux-user: correct argume=
nt number for sys_mremap and sys_splice=0A=
=0A=
> Petar: I think it would be a good idea if you checked=0A=
> the whole of our table against a recent kernel and made=0A=
> sure we're in sync for everything, rather than fixing=0A=
> things one at a time.=0A=
>=0A=
=0A=
I did, this is how I came up with these two system calls.=0A=
=0A=
Here are all the differences:=0A=
=0A=
Syscall             Qemu    Kernel=0A=
=0A=
sys_acct            0    1=0A=
sys_epoll_wait      3    4=0A=
sys_fdatasync       0    1=0A=
sys_lookup_dcookie  3    4=0A=
sys_mremap          4    5=0A=
sys_quotactl        0    4=0A=
sys_sigaltstack     2    0=0A=
sys_splice          4    6=0A=
sys_waitid          4    5=0A=
=0A=
=0A=
So, we are not fully in sync, but the rest of it will not cause any=0A=
problems. In the existing QEMU code in cpu_loop(CPUMIPSState *env)=0A=
first four arguments are always passed, so for sys_acct, sys_epoll_wait,=0A=
sys_fdatasync, sys_quotactl, sys_lookup_dcookie and sys_sigaltstack=0A=
the differences do not matter.=0A=
=0A=
For sys_splice and sys_mremap, the difference is important so I=0A=
added this change and came up with test cases.=0A=
=0A=
The last on the list is sys_waitid, the difference could be important yet=
=0A=
it still is not, since the host part does not seem to make use of it.=0A=
=0A=
Considering the turn-around times for code reviews and getting the changes=
=0A=
in, I am guided by "If it ain't broke, don't fix it", otherwise I would=0A=
change the other values for clarity and readability, I would also change=0A=
tabs/spaces mix in the table mips_syscall_args, etc.=0A=
=0A=
Regards,=0A=
Petar=


