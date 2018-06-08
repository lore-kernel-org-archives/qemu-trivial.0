Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRN16-0002Vm-7g
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 15:25:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fRN14-0002Tr-5q
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 15:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fRN13-0007bp-9C
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 15:25:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46462 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fRN0x-0007ZU-GZ; Fri, 08 Jun 2018 15:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F38218A3B7;
	Fri,  8 Jun 2018 19:25:34 +0000 (UTC)
Received: from [10.10.123.169] (ovpn-123-169.rdu2.redhat.com [10.10.123.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E53662017D03;
	Fri,  8 Jun 2018 19:25:33 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180608190145.10872-1-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
	<berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ef6bb32d-b5e0-f94b-327c-fbe6125b220a@redhat.com>
Date: Fri, 8 Jun 2018 14:25:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180608190145.10872-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 19:25:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 19:25:35 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH RESEND] Makefile: Remove qemu-version.h
 and qemu-options.def during 'make distclean'
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
X-List-Received-Date: Fri, 08 Jun 2018 19:25:43 -0000

On 06/08/2018 02:01 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> qemu-version.h and qemu-options.def are generated files
> that should be deleted during 'make distclean'.
>=20
> This solves building issues with out-of-tree builds from
> a source tree that has been built in (see d1bd2423a90):

Well, it prevents future repeats of the problem. It does not "fix"=20
existing incremental builds that already have the problem.  But I'm=20
still in favor of this change.


> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> resend: Cc Peter, removed dup line in comment
>=20
>   Makefile | 1 +
>   1 file changed, 1 insertion(+)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/Makefile b/Makefile
> index 023b3437ec..7ae453ffa2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -757,6 +757,7 @@ qemu-%.tar.bz2:
>   distclean: clean
>   	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-opt=
ions.texi qemu-img-cmds.texi qemu-monitor.texi qemu-monitor-info.texi
>   	rm -f config-all-devices.mak config-all-disas.mak config.status
> +	rm -f qemu-version.h qemu-options.def
>   	rm -f po/*.mo tests/qemu-iotests/common.env
>   	rm -f roms/seabios/config.mak roms/vgabios/config.mak
>   	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

