Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9dh-0004jq-1j
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9de-0004hi-QF
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:57:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9de-0003z8-3b
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:57:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34412)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gw9db-0003pR-SQ; Tue, 19 Feb 2019 12:57:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 396AE11DBB3;
	Tue, 19 Feb 2019 17:56:45 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838BD5D6AA;
	Tue, 19 Feb 2019 17:56:44 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
	<ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <77cf32b1-6a4a-33c5-4b3c-8ba3245a4b23@redhat.com>
Date: Tue, 19 Feb 2019 11:56:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 19 Feb 2019 17:56:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 17:57:03 -0000

On 2/19/19 11:38 AM, Philippe Mathieu-Daud=C3=A9 wrote:

>> +    if (a =3D=3D 1) {
>> +        /* Reads like: "If a equals 1" */
>=20
> I guess you found a bug in the documentation :)
>=20
> Since 8c06fbdf36bf4d the style asked is:
>=20
>     We now require Linux-kernel-style multiline comments:
>         /*
>          * line one
>          * line two
>          */
>=20
>> +        do_something();

We only require winged multiline comments when the comment is actually
multiline.  In this case, the comment is a one-liner, and is just fine
as written.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

