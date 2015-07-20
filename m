Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZHDrW-0004V5-OV
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2015 12:24:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZHDrU-0004Rb-CS
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:24:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZHDrT-00013t-E5
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:24:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZHDrN-0000oa-Ns; Mon, 20 Jul 2015 12:24:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id DAFDAA075D;
	Mon, 20 Jul 2015 16:24:08 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-56-218.rdu2.redhat.com
	[10.10.56.218])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6KGO77P022477; Mon, 20 Jul 2015 12:24:07 -0400
Message-ID: <55AD20A7.6030908@redhat.com>
Date: Mon, 20 Jul 2015 12:24:07 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1437231284-17455-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1437231284-17455-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4] tests: Fix broken
	targets check-report-qtest-*
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
X-List-Received-Date: Mon, 20 Jul 2015 16:24:17 -0000



On 07/18/2015 10:54 AM, Stefan Weil wrote:
> They need QTEST_QEMU_IMG. Without it, the tests raise an assertion:
>=20
> $ make -C bin check-report-qtest-i386.xml
> make: Entering directory 'bin'
> GTESTER check-report-qtest-i386.xml
> blkdebug: Suspended request 'A'
> blkdebug: Resuming request 'A'
> ahci-test: tests/libqos/libqos.c:162:
>  mkimg: Assertion `qemu_img_path' failed.
> main-loop: WARNING: I/O thread spun for 1000 iterations
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tests/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/Makefile b/tests/Makefile
> index 2c4b8dc..8d26736 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -478,6 +478,7 @@ $(patsubst %, check-%, $(check-unit-y)): check-%: %
> =20
>  $(patsubst %, check-report-qtest-%.xml, $(QTEST_TARGETS)): check-repor=
t-qtest-%.xml: $(check-qtest-y)
>  	$(call quiet-command,QTEST_QEMU_BINARY=3D$*-softmmu/qemu-system-$* \
> +		QTEST_QEMU_IMG=3Dqemu-img$(EXESUF) \
>  	  gtester -q $(GTESTER_OPTIONS) -o $@ -m=3D$(SPEED) $(check-qtest-$*-=
y),"GTESTER $@")
> =20
>  check-report-unit.xml: $(check-unit-y)
>=20

My apologies -- missed a spot when I added this.
I'll stage this one in my IDE branch if nobody feels it belongs in a
different tree.

Reviewed-by: John Snow <jsnow@redhat.com>

