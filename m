Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TunpH-0006ep-Ed
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 12:27:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TunpB-0006U3-0X
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 12:27:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Tunp5-0002oM-56
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 12:27:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Tunof-0002hv-J5; Mon, 14 Jan 2013 12:27:21 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0EHRJK9023955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 14 Jan 2013 12:27:19 -0500
Received: from blackfin.pond.sub.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0EHRI6V032083; Mon, 14 Jan 2013 12:27:19 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 45402200A9; Mon, 14 Jan 2013 18:27:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org> <50F437C5.4020905@suse.de>
Date: Mon, 14 Jan 2013 18:27:18 +0100
In-Reply-To: <50F437C5.4020905@suse.de> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
	=?utf-8?Q?'s?= message of "Mon, 14 Jan 2013 17:52:21 +0100")
Message-ID: <87hamjpte1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>,
	agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qom: Make
	object_resolve_path_component() path argument const
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
X-List-Received-Date: Mon, 14 Jan 2013 17:27:57 -0000

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 14.01.2013 13:19, schrieb Markus Armbruster:
>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>>=20
>>> This allows to navigate partial well-known paths from an object.
>>=20
>> Why does making the argument const allow such navigation?
>
> Without const, object_resolve_path_component(foo, "bar") results in a
> compile error (09/10 accesses "ide[1]" etc. to avoid exposing the full
> MacIOState).
>
> Apparently this function was so far only used on dynamically generated
> (non-const) arrays:
>
> qom/container.c:        child =3D object_resolve_path_component(obj,
> parts[i]);
> qom/object.c:    child =3D object_resolve_path_component(parent,
> parts[index]);

Makes sense, but isn't immediately obvious from your commit message.
What about:

    qom: Make object_resolve_path_component() path argument const

    Navigating well-known paths from an object like

        object_resolve_path_component(foo, "bar")

    is perfectly legitimate, but doesn't compile, because the second
    parameter lacks const.  Fix that.

