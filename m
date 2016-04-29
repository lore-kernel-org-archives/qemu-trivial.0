Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw3oA-0004Tl-7N
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 04:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aw3o1-0004Cf-Nz
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 04:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aw3nt-0001iE-P3
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 04:29:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aw3nf-0001ZM-C0; Fri, 29 Apr 2016 04:29:23 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BAB0627C1;
	Fri, 29 Apr 2016 07:53:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3T7qxGJ023454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 29 Apr 2016 03:53:00 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E0CFF1132D8A; Fri, 29 Apr 2016 09:52:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jan Vesely <jano.vesely@gmail.com>
Cc: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
References: <1458436706-20743-1-git-send-email-jano.vesely@gmail.com>
	<1460495386.7674.1.camel@gmail.com>
	<1461891273.4403.1.camel@gmail.com>
Date: Fri, 29 Apr 2016 09:52:58 +0200
In-Reply-To: <1461891273.4403.1.camel@gmail.com> (Jan Vesely's message of
	"Thu, 28 Apr 2016 20:54:33 -0400")
Message-ID: <878tzw97hh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 29 Apr 2016 07:53:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Check if struct
 fsxattr is available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 08:29:52 -0000

Jan Vesely <jano.vesely@gmail.com> writes:

> On Tue, 2016-04-12 at 17:09 -0400, Jan Vesely wrote:
>> On Sat, 2016-03-19 at 21:18 -0400, Jan Vesely wrote:
>> >=20
>> > Fixes build with new linux headers.
>> >=20
>> > Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
>> > ---
>> > linux-headers-4.5 and xfsprogs-3.2.4 in my case
>> >=20
>> > =C2=A0configure | 18 ++++++++++++++++++
>> > =C2=A01 file changed, 18 insertions(+)
>> >=20
>> > diff --git a/configure b/configure
>> > index b88d0db..bb64d6c 100755
>> > --- a/configure
>> > +++ b/configure
>> > @@ -4474,6 +4474,21 @@ if test "$fortify_source" !=3D "no"; then
>> > =C2=A0=C2=A0=C2=A0fi
>> > =C2=A0fi
>> > =C2=A0
>> > +########################################
>> > +# check if struct fsxattr is available
>> > +
>> > +have_fsxattr=3Dno
>> > +cat > $TMPC << EOF
>> > +#include <linux/fs.h>
>> > +struct fsxattr foo;
>> > +int main(void) {
>> > +=C2=A0=C2=A0return 0;
>> > +}
>> > +EOF
>> > +if compile_prog "" "" ; then
>> > +=C2=A0=C2=A0=C2=A0=C2=A0have_fsxattr=3Dyes
>> > +fi
>> > +
>> > =C2=A0##########################################
>> > =C2=A0# End of CC checks
>> > =C2=A0# After here, no more $cc or $ld runs
>> > @@ -5137,6 +5152,9 @@ fi
>> > =C2=A0if test "$have_ifaddrs_h" =3D "yes" ; then
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_IFADDRS_H=3Dy" >> $config_hos=
t_mak
>> > =C2=A0fi
>> > +if test "$have_fsxattr" =3D "yes" ; then
>> > +=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
>> > +fi
>> > =C2=A0if test "$vte" =3D "yes" ; then
>> > =C2=A0=C2=A0=C2=A0echo "CONFIG_VTE=3Dy" >> $config_host_mak
>> > =C2=A0=C2=A0=C2=A0echo "VTE_CFLAGS=3D$vte_cflags" >> $config_host_mak
>> gentle ping.
>> the docs say trivial patches are collected every week. yet the last
>> one
>> was in Feb.
>>=20
>
> gentle ping v2. Is there a maintainer for configure? get_maintainer.pl
> was not helpful.

This might be trivial if you explain what's broken without it in more
detail.  The explanation belongs into the commit message.

Now let's look for victims^Wreviewers:

    $ scripts/get_maintainer.pl -f configure=20
    get_maintainer.pl: No maintainers found, printing recent contributors.
    get_maintainer.pl: Do not blindly cc: them on patches!  Use common sens=
e.

    "Daniel P. Berrange" <berrange@redhat.com> (commit_signer:21/95=3D22%)
    Paolo Bonzini <pbonzini@redhat.com> (commit_signer:21/95=3D22%)
    Stefan Hajnoczi <stefanha@redhat.com> (commit_signer:15/95=3D16%)
    Gerd Hoffmann <kraxel@redhat.com> (commit_signer:11/95=3D12%)
    Peter Maydell <peter.maydell@linaro.org> (commit_signer:11/95=3D12%)
    qemu-devel@nongnu.org (open list:All patches CC here)

    $ scripts/get_maintainer.pl -f --git-since "5-years-ago" configure=20
    get_maintainer.pl: No maintainers found, printing recent contributors.
    get_maintainer.pl: Do not blindly cc: them on patches!  Use common sens=
e.

    Peter Maydell <peter.maydell@linaro.org> (commit_signer:135/686=3D20%)
    Anthony Liguori <aliguori@amazon.com> (commit_signer:119/686=3D17%)
    Stefan Hajnoczi <stefanha@redhat.com> (commit_signer:113/686=3D16%)
    Paolo Bonzini <pbonzini@redhat.com> (commit_signer:110/686=3D16%)
    Stefan Weil <sw@weilnetz.de> (commit_signer:78/686=3D11%)
    qemu-devel@nongnu.org (open list:All patches CC here)

    $ scripts/get_maintainer.pl --git-blame -f configure=20
    Peter Maydell <peter.maydell@linaro.org> (authored lines:611/5975=3D10%=
,commits:91/703=3D13%)
    Juan Quintela <quintela@redhat.com> (authored lines:486/5975=3D8%,commi=
ts:78/703=3D11%)
    "Daniel P. Berrange" <berrange@redhat.com> (authored lines:355/5975=3D6=
%)
    Anthony Liguori <anthony@codemonkey.ws> (commits:178/703=3D25%)
    Paolo Bonzini <pbonzini@redhat.com> (commits:90/703=3D13%)
    Stefan Hajnoczi <stefanha@linux.vnet.ibm.com> (commits:88/703=3D13%)
    qemu-devel@nongnu.org (open list:All patches CC here)

Suggest to copy Paolo Bonzini, Peter Maydell, Stefan Hajnoczi on your
respin.

