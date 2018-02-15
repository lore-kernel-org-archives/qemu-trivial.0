Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emCdW-0003Dm-9T
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2018 01:03:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emCdU-0003Aq-6y
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 01:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emCdT-0005AL-5c
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 01:03:12 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1emCdO-00057J-In; Thu, 15 Feb 2018 01:03:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 585609BB57;
	Thu, 15 Feb 2018 06:02:48 +0000 (UTC)
Received: from [10.36.116.121] (ovpn-116-121.ams2.redhat.com [10.36.116.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F7E21411B6;
	Thu, 15 Feb 2018 06:02:42 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
	<9a9ac3ae-5974-f462-7321-9ae2ad5b78ae@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <933068e0-7928-389b-f927-15df79506bc6@redhat.com>
Date: Thu, 15 Feb 2018 07:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9a9ac3ae-5974-f462-7321-9ae2ad5b78ae@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 15 Feb 2018 06:02:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 15 Feb 2018 06:02:58 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add missing
 space when using --with-pkgversion
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
X-List-Received-Date: Thu, 15 Feb 2018 06:03:13 -0000

On 14.02.2018 21:23, Eric Blake wrote:
> On 02/14/2018 11:31 AM, Thomas Huth wrote:
>> When running configure with --with-pkgversion=3Dfoo there is no
>> space anymore between the version number and the parentheses:
>>
>> $ m68k-softmmu/qemu-system-m68k -version
>> QEMU emulator version 2.11.50(foo)
>>
>> Fix it by moving the space from the configure script to the Makefile.
>>
>> Fixes: 67a1de0d195a6185c39b436159c9ffc7720bf979
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1673373
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> =C2=A0 Makefile=C2=A0 | 2 +-
>> =C2=A0 configure | 2 +-
>> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 4ec7a3c..41adbc9 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -369,7 +369,7 @@ qemu-version.h: FORCE
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cd $(SRC_PATH)=
; \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf '#define=
 QEMU_PKGVERSION '; \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test -n "$(P=
KGVERSION)"; then \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf '"$(PKGVERSION)"\n'; \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf '" ($(PKGVERSION))"\n'; \
>=20
> I would argue that putting a space here is awkward; wouldn't it instead
> be easier to have all CLIENTS of QEMU_PKGVERSION in the source code
> assume that the macro does NOT have a leading space, and to supply a
> space themselves?
>=20
> That is, change THESE locations:
>=20
> bsd-user/main.c:=C2=A0=C2=A0=C2=A0 printf("qemu-" TARGET_NAME " version=
 " QEMU_VERSION
> QEMU_PKGVERSION
> linux-user/main.c:=C2=A0=C2=A0=C2=A0 printf("qemu-" TARGET_NAME " versi=
on "
> QEMU_VERSION QEMU_PKGVERSION
> qemu-img.c:#define QEMU_IMG_VERSION "qemu-img version " QEMU_VERSION
> QEMU_PKGVERSION \
> qemu-io.c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 printf("%s version " QEMU_VERSION QEMU_PKGVERSION
> "\n"
> qemu-nbd.c:"%s " QEMU_VERSION QEMU_PKGVERSION "\n"
> qga/main.c:"QEMU Guest Agent " QEMU_VERSION QEMU_PKGVERSION "\n"
> scsi/qemu-pr-helper.c:"%s " QEMU_VERSION QEMU_PKGVERSION "\n"
> ui/cocoa.m:=C2=A0=C2=A0=C2=A0 @"QEMU emulator version %s%s", QEMU_VERSI=
ON,
> QEMU_PKGVERSION];
> vl.c:=C2=A0=C2=A0=C2=A0 printf("QEMU emulator version " QEMU_VERSION QE=
MU_PKGVERSION "\n"
>=20
> to instead supply the missing space, and have configure/Makefile always
> generate without a leading space.
>=20
>> +++ b/configure
>> @@ -1162,7 +1162,7 @@ for opt do
>> =C2=A0=C2=A0=C2=A0 ;;
>> =C2=A0=C2=A0=C2=A0 --disable-blobs) blobs=3D"no"
>> =C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0 --with-pkgversion=3D*) pkgversion=3D" ($optarg)"
>> +=C2=A0 --with-pkgversion=3D*) pkgversion=3D"$optarg"
>=20
> Hmm - here you're changing who supplies the ().=C2=A0 But that argues t=
hat
> maybe the callsites should supply " (" and ")" themselves.

Yeah, that's likely the saner way to do this. The question is: What
about the query-version QMP command? Should it report parentheses or
not? I think I'd look nicer if it reports "package": "foo" instead of
"package": "(foo)" - but we maybe could break some users who expect
parentheses there (no matter whether there is a preceding space or not)?

 Thomas

