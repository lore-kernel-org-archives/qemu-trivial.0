Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6sa-00087d-Mn
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 12:13:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fb6sZ-00085V-5X
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fb6sY-0007Kc-7S
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:13:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fb6sS-0007Bx-La; Thu, 05 Jul 2018 12:13:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34AF0406E8CD;
	Thu,  5 Jul 2018 16:13:04 +0000 (UTC)
Received: from [10.10.124.57] (ovpn-124-57.rdu2.redhat.com [10.10.124.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08DE976C9;
	Thu,  5 Jul 2018 16:13:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
References: <20180705155811.20366-1-f4bug@amsat.org>
	<20180705155811.20366-5-f4bug@amsat.org>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <af8abd7f-d72d-0445-298c-4ff91fccdb5e@redhat.com>
Date: Thu, 5 Jul 2018 11:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180705155811.20366-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 05 Jul 2018 16:13:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 05 Jul 2018 16:13:04 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 4/7]
 tests/bios-tables-test: Remove an useless cast
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
X-List-Received-Date: Thu, 05 Jul 2018 16:13:12 -0000

On 07/05/2018 10:58 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Patch created mechanically by rerunning:

In the subject: s/an useless/a useless/

(English is weird; we use "a" when the 'u' is pronounced hard as in=20
"unicorn", and "an" when the 'u' is soft as in "umbrella")

>=20
>    $  spatch --sp-file scripts/coccinelle/typecast.cocci \
>              --macro-file scripts/cocci-macro-file.h \
>              --dir . --in-place
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

