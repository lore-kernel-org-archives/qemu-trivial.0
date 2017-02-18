Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cf9HH-00067c-Qz
	for mharc-qemu-trivial@gnu.org; Sat, 18 Feb 2017 12:58:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1cf9HG-00066k-5V
	for qemu-trivial@nongnu.org; Sat, 18 Feb 2017 12:58:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1cf9HF-0003Ja-6J
	for qemu-trivial@nongnu.org; Sat, 18 Feb 2017 12:58:34 -0500
Received: from smtp2-g21.free.fr ([212.27.42.2]:54678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1cf9HA-0003Ey-Q1; Sat, 18 Feb 2017 12:58:28 -0500
Received: from [192.168.0.41] (unknown [82.227.227.196])
	by smtp2-g21.free.fr (Postfix) with ESMTP id EB2BE2003A3;
	Sat, 18 Feb 2017 18:58:10 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
	<8737gsl7o7.fsf@dusky.pond.sub.org>
	<4b140d8b-0745-6d7f-101f-25c3ca5f28c2@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <fd8fb30f-4e54-e119-0287-2459fd6c85ca@reactos.org>
Date: Sat, 18 Feb 2017 18:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <4b140d8b-0745-6d7f-101f-25c3ca5f28c2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.2
Subject: Re: [Qemu-trivial] [PATCH] vl: disable default cdrom when using
 explicitely scsi-hd
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
X-List-Received-Date: Sat, 18 Feb 2017 17:58:35 -0000

Hi,

Le 09/01/2017 =C3=A0 14:48, Paolo Bonzini a =C3=A9crit :
>
>
> On 09/01/2017 13:49, Markus Armbruster wrote:
>> Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:
>>
>>> 'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cdro=
m.
>>> Make it the same for 'scsi-hd'.
>>>
>>> That way, we can add/replace the device on lun=3D2 without using -nod=
efaults.
>>
>> Yes, but it might upset existing usage that relies on the default
>> CD-ROM.  In my opinion, making your needs explicit is better than
>> relying on defaults, but that doesn't mean we can change the defaults
>> unthinkingly.  Definitely not qemu-trivial.
>>
>> Opinions on the change?
>
> The original rationale for the change was "ide-hd has to suppress the
> default CD-ROM, or else you can't put one on secondary master without
> -nodefaults" but the same applies for scsi-hd vs. lun=3D1.
>
> So I'm not sure, but I lean towards accepting the patch.
 >
 > Paolo

Paolo, Markus, so what is the conclusion?
Accepting the patch, or refusing it?

Regards,

Herv=C3=A9

>
>>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>>> ---
>>>  vl.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/vl.c b/vl.c
>>> index d77dd86..da97fe2 100644
>>> --- a/vl.c
>>> +++ b/vl.c
>>> @@ -223,6 +223,7 @@ static struct {
>>>      { .driver =3D "ide-hd",               .flag =3D &default_cdrom  =
   },
>>>      { .driver =3D "ide-drive",            .flag =3D &default_cdrom  =
   },
>>>      { .driver =3D "scsi-cd",              .flag =3D &default_cdrom  =
   },
>>> +    { .driver =3D "scsi-hd",              .flag =3D &default_cdrom  =
   },
>>>      { .driver =3D "virtio-serial-pci",    .flag =3D &default_virtcon=
   },
>>>      { .driver =3D "virtio-serial",        .flag =3D &default_virtcon=
   },
>>>      { .driver =3D "VGA",                  .flag =3D &default_vga    =
   },
>>
>>
>


