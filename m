Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhFxU-0004kv-5h
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2013 05:12:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UhFxJ-0004XQ-Lc
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 05:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UhFxC-0000F3-Og
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 05:12:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:59225 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UhFx1-0000De-Dn; Tue, 28 May 2013 05:12:15 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 28BFCA5396;
	Tue, 28 May 2013 11:12:14 +0200 (CEST)
Message-ID: <51A474EC.6070604@suse.de>
Date: Tue, 28 May 2013 11:12:12 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
	<1369698583-32533-1-git-send-email-aik@ozlabs.ru>
	<51A470A9.8000502@redhat.com>
In-Reply-To: <51A470A9.8000502@redhat.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] qemu: fix out of tree
	cross compile
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
X-List-Received-Date: Tue, 28 May 2013 09:12:42 -0000

Am 28.05.2013 10:54, schrieb Paolo Bonzini:
> Il 28/05/2013 01:49, Alexey Kardashevskiy ha scritto:
>> The symlink to "asm" platform linux headers is made in the build tree =
by
>> the configure script but gcc is not told to look for them there.
>>
>> The patch fixes this.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> The previous patch did not remove the old line adding includes. Early =
morning,
>> lack of focus :)
>>
>> ---
>>  configure |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 5ae7e4a..eca2a20 100755
>> --- a/configure
>> +++ b/configure
>> @@ -547,7 +547,7 @@ Haiku)
>>    if [ "$cpu" =3D "i386" -o "$cpu" =3D "x86_64" ] ; then
>>      audio_possible_drivers=3D"$audio_possible_drivers fmod"
>>    fi
>> -  QEMU_INCLUDES=3D"-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
>> +  QEMU_INCLUDES=3D"-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-header=
s $QEMU_INCLUDES"
>>  ;;
>>  esac
>> =20
>>
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Hm, I see no other case of adding $(pwd) to QEMU_INCLUDES - shouldn't
this just be -Ilinux-headers?

And might it make sense to give the build directory precedence over the
source directory?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

