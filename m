Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZOswa-00009z-6Q
	for mharc-qemu-trivial@gnu.org; Mon, 10 Aug 2015 15:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZOswW-00005X-Ke
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 15:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZOswV-0004se-Ik
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 15:41:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44075)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1ZOswO-0004oL-Hs; Mon, 10 Aug 2015 15:41:00 -0400
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 54A7A14128E;
	Mon, 10 Aug 2015 19:40:59 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 486)
	id 3E5391412BC; Mon, 10 Aug 2015 19:40:59 +0000 (UTC)
Received: from [10.228.68.87] (rrcs-67-52-130-30.west.biz.rr.com
	[67.52.130.30])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 92D331412BA;
	Mon, 10 Aug 2015 19:40:57 +0000 (UTC)
Message-ID: <55C8FE48.6010900@codeaurora.org>
Date: Mon, 10 Aug 2015 15:40:56 -0400
From: Christopher Covington <cov@codeaurora.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:36.0) Gecko/20100101 Thunderbird/36.0
MIME-Version: 1.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 05/11] qemu-log: Improve
 the "exec" TB execution logging
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
X-List-Received-Date: Mon, 10 Aug 2015 19:41:09 -0000

Hi Peter, Alex,

On 08/03/2015 05:14 AM, Alex Benn=C3=A9e wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Improve the TB execution logging so that it is easier to identify
> what is happening from trace logs:
>  * move the "Trace" logging of executed TBs into cpu_tb_exec()
>    so that it is emitted if and only if we actually execute a TB,
>    and for consistency for the CPU state logging
>  * log when we link two TBs together via tb_add_jump()
>  * log when cpu_tb_exec() returns early from a chain of TBs
>=20
> The new style logging looks like this:
>=20
> Trace 0x7fb7cc822ca0 [ffffffc0000dce00]
> Linking TBs 0x7fb7cc822ca0 [ffffffc0000dce00] index 0 -> 0x7fb7cc823110=
 [ffffffc0000dce10]
> Trace 0x7fb7cc823110 [ffffffc0000dce10]
> Trace 0x7fb7cc823420 [ffffffc000302688]
> Trace 0x7fb7cc8234a0 [ffffffc000302698]
> Trace 0x7fb7cc823520 [ffffffc0003026a4]
> Trace 0x7fb7cc823560 [ffffffc0000dce44]
> Linking TBs 0x7fb7cc823560 [ffffffc0000dce44] index 1 -> 0x7fb7cc8235d0=
 [ffffffc0000dce70]
> Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
> Abandoned execution of TB chain before 0x7fb7cc8235d0 [ffffffc0000dce70=
]
> Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
> Trace 0x7fb7cc822fd0 [ffffffc0000dd52c]

Do you think there's some way to log the loop count when a circular chain=
 is
executed?

System Emulation started at Mon Aug 10 15:30:49 2015
Invocation:aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-a57 -m=
 2G
-kernel psci-exit -d exec,int,in_asm -nodefaults -nographic -monitor none
-icount shift=3D0
----------------
IN:
0x0000000080000000:  d2800140      mov x0, #0xa
0x0000000080000004:  f1000400      subs x0, x0, #0x1 (1)
0x0000000080000008:  54ffffe1      b.ne #-0x4 (addr 0x80000004)

Trace 0x7f38787cb000 [0000000080000000]
----------------
IN:
0x0000000080000004:  f1000400      subs x0, x0, #0x1 (1)
0x0000000080000008:  54ffffe1      b.ne #-0x4 (addr 0x80000004)

Linking TBs 0x7f38787cb000 [0000000080000000] index 1 -> 0x7f38787cb0d0
[0000000080000004]
Trace 0x7f38787cb0d0 [0000000080000004]
Linking TBs 0x7f38787cb0d0 [0000000080000004] index 1 -> 0x7f38787cb0d0
[0000000080000004]
Trace 0x7f38787cb0d0 [0000000080000004]
----------------
IN:
0x000000008000000c:  d2800100      mov x0, #0x8
0x0000000080000010:  f2b08000      movk x0, #0x8400, lsl #16
0x0000000080000014:  d4000002      hvc #0x0

Linking TBs 0x7f38787cb0d0 [0000000080000004] index 0 -> 0x7f38787cb1c0
[000000008000000c]
Trace 0x7f38787cb1c0 [000000008000000c]
Taking exception 11 [Hypervisor Call]
...from EL1
...with ESR 0x5a000000

Thanks,
Christopher Covington

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
a Linux Foundation Collaborative Project

