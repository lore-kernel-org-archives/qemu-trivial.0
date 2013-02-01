Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1INr-0007Hc-Gh
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2013 10:18:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1U1INo-0007Dw-F8
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 10:18:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1U1INm-0006mG-Ln
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 10:18:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1U1INm-0006lv-EM; Fri, 01 Feb 2013 10:18:26 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r11FIP3E022444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 1 Feb 2013 10:18:25 -0500
Received: from [10.3.228.85] (vpn-228-85.phx2.redhat.com [10.3.228.85])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r11FINrx008549; Fri, 1 Feb 2013 10:18:24 -0500
Message-ID: <510BDCBF.5040108@redhat.com>
Date: Fri, 01 Feb 2013 16:18:23 +0100
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130114 Thunderbird/17.0.2
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
	<510B90C9.8000309@suse.de>
In-Reply-To: <510B90C9.8000309@suse.de>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r11FIP3E022444
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Fri, 01 Feb 2013 15:18:29 -0000

On 01.02.2013 10:54, Andreas F=C3=A4rber wrote:
> Am 31.01.2013 11:15, schrieb Michal Privoznik:
>> Currently, we are enforcing the _FORTIFY_SOURCE=3D2 without any
>> previous detection if the macro has been already defined, e.g.
>> by environment, or is just enabled by compiler by default.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index b7635e4..97070eb 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3159,7 +3159,7 @@ if test "$gcov" =3D "yes" ; then
>>    CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
>>    LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
>>  elif test "$debug" =3D "no" ; then
>> -  CFLAGS=3D"-O2 -D_FORTIFY_SOURCE=3D2 $CFLAGS"
>> +  CFLAGS=3D"-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $CFLAGS"
>>  fi
>> =20
>> =20
>=20
> Should we maybe instead add a compile-test?
>=20
> #ifdef _FORTIFY_SOURCE
> #if _FORTIFY_SOURCE >=3D 2
> #error Environment already has _FORTIFY_SOURCE
> #endif
> #endif
>=20
> I admit I have no clue what the number means and whether there are more
> fortified levels.
>=20
> Cheers,
> Andreas
>=20

I don't think that's necessary. The 2nd level is the highest one [1] or [=
2].
It seems like in my case it's compiler who's defining the macro:

$ echo "int main() {return 0;}" | gcc -D_FORTIFY_SOURCE=3D2 -x c -
<command-line>:0:0: warning: "_FORTIFY_SOURCE" redefined [enabled by defa=
ult]
<stdin>:1:0: note: this is the location of the previous definition

in which case we must undefine it. However, if the _FORTIFY_SOURCE is
defined by environment, I think we should not override it. So maybe need
a different approach. Anyway, with current state I cannot compile. I am u=
sing
gcc version 4.7.2 (Gentoo 4.7.2 p1.3, pie-0.5.5)

Michal

1: http://gcc.gnu.org/ml/gcc-patches/2004-09/msg02055.html
2: http://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dlibssp/ssp/ssp.h.in


