Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RV62t-0003OT-BV
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 13:35:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RV62q-0003Ht-Kj
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 13:35:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RV62p-00068I-JO
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 13:35:12 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RV62m-00064y-Kd; Mon, 28 Nov 2011 13:35:08 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1966D7281C35; Mon, 28 Nov 2011 19:34:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id aZnKNAhx3gSf; Mon, 28 Nov 2011 19:34:27 +0100 (CET)
Received: from flocke.weilnetz.de (p54ADA6BB.dip.t-dialin.net [84.173.166.187])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	534177281C2F; Mon, 28 Nov 2011 19:34:27 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RV61w-0003Jt-Tu; Mon, 28 Nov 2011 19:34:16 +0100
Message-ID: <4ED3D428.7030704@weilnetz.de>
Date: Mon, 28 Nov 2011 19:34:16 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
In-Reply-To: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix out of tree build
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
X-List-Received-Date: Mon, 28 Nov 2011 18:35:13 -0000

Am 22.11.2011 18:27, schrieb Stefano Stabellini:
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>
> diff --git a/Makefile b/Makefile
> index 168093c..885065f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -167,7 +167,7 @@ check-qjson: check-qjson.o $(qobject-obj-y)=20
> $(tools-obj-y)
> test-coroutine: test-coroutine.o qemu-timer-common.o async.o=20
> $(coroutine-obj-y) $(tools-obj-y)
>
> $(qapi-obj-y): $(GENERATED_HEADERS)
> -qapi-dir :=3D qapi-generated
> +qapi-dir :=3D $(SRC_PATH)/qapi-generated
> test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS +=3D -=
I=20
> $(qapi-dir)
> qemu-ga$(EXESUF): LIBS =3D $(LIBS_QGA)

This patch was committed to latest QEMU and breaks in-tree and=20
out-of-tree builds.
Without it, both kinds of builds work in my standard Debian configuration=
.

Regards,
Stefan Weil


gcc output (extract):

CC /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.o
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=20
In function =91qapi_free_GuestAgentInfoList=92:
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:39=
:=20
warning: implicit declaration of function =91visit_type_GuestAgentInfoLis=
t=92
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:39=
:=20
warning: nested extern declaration of =91visit_type_GuestAgentInfoList=92
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=20
In function =91qapi_free_GuestAgentInfo=92:
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:54=
:=20
warning: implicit declaration of function =91visit_type_GuestAgentInfo=92
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:54=
:=20
warning: nested extern declaration of =91visit_type_GuestAgentInfo=92
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=20
In function =91qapi_free_GuestFileReadList=92:
/home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:69=
:=20
warning: implicit declaration of function =91visit_type_GuestFileReadList=
=92


