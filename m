Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAPMC-00009W-Q0
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 21:01:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gAPMA-00007o-4M
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 21:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gAPM9-0006A9-CU
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 21:01:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gAPM3-00068T-Bo; Wed, 10 Oct 2018 21:01:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8ED0A30001D7;
	Thu, 11 Oct 2018 01:01:29 +0000 (UTC)
Received: from [10.10.121.240] (ovpn-121-240.rdu2.redhat.com [10.10.121.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6DCD80D96;
	Thu, 11 Oct 2018 01:01:28 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20181010222944.29304-1-f4bug@amsat.org>
	<20181010222944.29304-3-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ffec53e7-9471-bb6f-d438-11a531e748dc@redhat.com>
Date: Wed, 10 Oct 2018 20:01:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181010222944.29304-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 11 Oct 2018 01:01:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 2/2] mailmap: Split 'prefered emails'
 from 'original git import' section
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
X-List-Received-Date: Thu, 11 Oct 2018 01:01:39 -0000

On 10/10/18 5:29 PM, Philippe Mathieu-Daud=C3=A9 wrote:

In the subject: s/prefered/preferred/

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   .mailmap | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>=20

> +
> +# This section is to track prefered (or last up to date) email for peo=
ple

and again

> +# that uses (or had use) various emails.

that use (or have used)

> +# Example can be people changing from companies, or companies changing=
 their
> +# name.

Examples include people changing companies, or companies changing their=20
name.

> +Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgt=
ec.com>
> +Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.i=
bm.com>
> +James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> +Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
> +Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
> +Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> +
> +
>   # Next, translate a few commits where mailman rewrote the From: line =
due
>   # to strict SPF, although we prefer to avoid adding more entries like=
 that.
>   Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qemu-devel <qemu=
-devel@nongnu.org>
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

