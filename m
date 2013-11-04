Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdQsi-0004Uo-1N
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2013 15:36:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VdQsc-0004R7-6o
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 15:36:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VdQsV-0007TW-8h
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 15:36:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1VdQsU-0007Sb-Gz; Mon, 04 Nov 2013 15:36:02 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA4KZvco009739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 4 Nov 2013 15:35:58 -0500
Received: from lacos-laptop.usersys.redhat.com (vpn1-6-80.ams2.redhat.com
	[10.36.6.80])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rA4KZtn9005666; Mon, 4 Nov 2013 15:35:56 -0500
Message-ID: <527805D2.3000107@redhat.com>
Date: Mon, 04 Nov 2013 21:38:42 +0100
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130912 Thunderbird/17.0.9
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9-YvQPprbt1+KCG0ov44-gbvaPx-gtX4yyd5fzfcX3UA@mail.gmail.com>
In-Reply-To: <CAFEAcA9-YvQPprbt1+KCG0ov44-gbvaPx-gtX4yyd5fzfcX3UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rA4KZvco009739
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: Fix compiler warnings
	with -Werror=sign-compare
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
X-List-Received-Date: Mon, 04 Nov 2013 20:36:15 -0000

On 11/04/13 21:07, Peter Maydell wrote:
> On 4 November 2013 19:51, Stefan Weil <sw@weilnetz.de> wrote:
>> With -Werror=3Dsign-compare (not enabled by default), gcc shows these =
errors:
>>
>> ui/gtk.c: In function =E2=80=98gtk_release_modifiers=E2=80=99:
>> ui/gtk.c:288:19: error:
>>  comparison between signed and unsigned integer expressions [-Werror=3D=
sign-compare]
>> ui/gtk.c: In function =E2=80=98gd_key_event=E2=80=99:
>> ui/gtk.c:746:19: error:
>>  comparison between signed and unsigned integer expressions [-Werror=3D=
sign-compare]
>=20
> If this warning is going to complain about entirely
> safe and idiomatic code like
>=20
>    int i;
>    static const int some_array[] =3D {
>        0x2a, 0x36, 0x1d, 0x9d, 0x38, 0xb8, 0xdb, 0xdd,
>    };
>=20
>    for (i =3D 0; i < ARRAY_SIZE(some_array); i++) {
>        ...
>    }

(Entirely safe, and completely non-idiomatic: "i" should be size_t, as
that is the type of the sizeof operator's result.)

Laszlo
/me apologizes for the raging pedantry

