Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffpne-0001yA-4t
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 12:59:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ffpnc-0001wz-9V
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ffpnb-00056d-4Z
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:59:36 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:54746
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1ffpnW-00052i-9i; Wed, 18 Jul 2018 12:59:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id CDE7ADADE84;
	Wed, 18 Jul 2018 18:59:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uyPFGUjU3PzY; Wed, 18 Jul 2018 18:59:25 +0200 (CEST)
Received: from [192.168.178.24] (pD9EC344D.dip0.t-ipconnect.de [217.236.52.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id E6CECDADE7A; 
	Wed, 18 Jul 2018 18:59:24 +0200 (CEST)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180712192603.11599-1-sw@weilnetz.de>
	<20180718162111.GR9812@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <255cc07f-8eb7-0839-2001-e6ead4f3d969@weilnetz.de>
Date: Wed, 18 Jul 2018 18:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180718162111.GR9812@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support
 pkg-config for zlib
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
X-List-Received-Date: Wed, 18 Jul 2018 16:59:37 -0000

Am 18.07.2018 um 18:21 schrieb Daniel P. Berrang=C3=A9:
> On Thu, Jul 12, 2018 at 09:26:03PM +0200, Stefan Weil wrote:
>> This is needed for builds with the mingw64-* packages from Cygwin,
>> but also works for Linux.
>>
>> Move the zlib test also more to the end because users should
>> get information on the really important missing packages
>> (which also require zlib) first.
>=20
> According to the zlib Changelog file pkgconfig support was added
> in 2006 !
>=20
> [quote]
> Changes in 1.2.3.1 (16 August 2006)
>=20
>   - Add pkgconfig support [Weigelt]
> [/quote]
>=20
> Given our target build platforms support guidelines
>=20
>   https://qemu.weilnetz.de/doc/qemu-doc.html#Supported-build-platforms
>=20
> we can safely say that all supported platforms will have a zlib
> that contains pkgconfig support, so......
>=20
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  configure | 40 +++++++++++++++++++++++-----------------
>>  1 file changed, 23 insertions(+), 17 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 2a7796ea80..dcaab01729 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2140,23 +2140,6 @@ EOF
>>    fi
>>  fi
>> =20
>> -#########################################
>> -# zlib check
>> -
>> -if test "$zlib" !=3D "no" ; then
>> -    cat > $TMPC << EOF
>> -#include <zlib.h>
>> -int main(void) { zlibVersion(); return 0; }
>> -EOF
>> -    if compile_prog "" "-lz" ; then
>> -        :
>> -    else
>> -        error_exit "zlib check failed" \
>> -            "Make sure to have the zlib libs and headers installed."
>> -    fi
>> -fi
>> -LIBS=3D"$LIBS -lz"
>> -
>>  ##########################################
>>  # lzo check
>> =20
>> @@ -3525,6 +3508,29 @@ if ! compile_prog "$glib_cflags -Werror" "$glib=
_libs" ; then
>>      fi
>>  fi
>> =20
>> +#########################################
>> +# zlib check
>> +
>> +if test "$zlib" !=3D "no" ; then
>> +    if $pkg_config --exists zlib; then
>> +        zlib_cflags=3D$($pkg_config --cflags zlib)
>> +        zlib_libs=3D$($pkg_config --libs zlib)
>> +        QEMU_CFLAGS=3D"$zlib_cflags $QEMU_CFLAGS"
>> +        LIBS=3D"$zlib_libs $LIBS"
>> +    else
>> +        cat > $TMPC << EOF
>> +#include <zlib.h>
>> +int main(void) { zlibVersion(); return 0; }
>> +EOF
>> +        if compile_prog "" "-lz" ; then
>> +            LIBS=3D"$LIBS -lz"
>> +        else
>> +            error_exit "zlib check failed" \
>> +                "Make sure to have the zlib libs and headers installe=
d."
>> +        fi
>> +    fi
>=20
> .... this fallback support for non-pkgconfig scenarios can be entirely
> deleted, just leaving the error_exit message.=20
>=20
>=20
> Regards,
> Daniel

I have no objection. Thank you for the investigation of the zlib
history. Removing old unneeded code is always good, but maybe that's
something which could be done after release 3.0.

Or would you suggest to do it now? Then I can either send an updated
patch (v2), or whoever pulls that patch can make that trivial modificatio=
n.

Cheers
Stefan


