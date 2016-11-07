Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3lzZ-0004Su-4C
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 10:37:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c3lzX-0004RE-90
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 10:37:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c3lzW-0008L6-ME
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 10:37:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1c3lzS-0008JG-Gs; Mon, 07 Nov 2016 10:37:42 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A05088F507;
	Mon,  7 Nov 2016 15:37:41 +0000 (UTC)
Received: from [10.36.112.35] (ovpn-112-35.ams2.redhat.com [10.36.112.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7FbbXg020926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Nov 2016 10:37:40 -0500
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	qemu-devel@nongnu.org
References: <20161107122238.32205-1-marcandre.lureau@redhat.com>
	<CAJ+F1CKtFyby1YwaM6=dhkCX_7fT2aAU3F+omJBe+geOq4UhtA@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6b85399-cbdb-3430-67ee-c14a426e25f9@redhat.com>
Date: Mon, 7 Nov 2016 16:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKtFyby1YwaM6=dhkCX_7fT2aAU3F+omJBe+geOq4UhtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 07 Nov 2016 15:37:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: remove libtool
 left-over
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
X-List-Received-Date: Mon, 07 Nov 2016 15:37:48 -0000



On 07/11/2016 13:45, Marc-Andr=C3=A9 Lureau wrote:
>=20
>      *.o
>     -*.lo
>     -*.la
>      *.pc
>      .libs
>      .sdk
>=20
>=20
> It looks like we could also remove *.pc & .libs

Yup.  v2?

Paolo

