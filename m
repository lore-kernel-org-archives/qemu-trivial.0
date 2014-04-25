Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdiPz-00038S-2o
	for mharc-qemu-trivial@gnu.org; Fri, 25 Apr 2014 11:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WdiPr-0002wb-Ig
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 11:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WdiPl-0005LU-0r
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 11:51:55 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42748 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WdiPY-0005FT-08; Fri, 25 Apr 2014 11:51:36 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0B3FDAB12;
	Fri, 25 Apr 2014 15:51:34 +0000 (UTC)
Message-ID: <535A8485.7020809@suse.de>
Date: Fri, 25 Apr 2014 17:51:33 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>, 
	Hani Benhabiles <kroosec@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
	<20140425114033.50333f11@redhat.com>
In-Reply-To: <20140425114033.50333f11@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qmp: Remove unused variable.
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
X-List-Received-Date: Fri, 25 Apr 2014 15:52:01 -0000

Am 25.04.2014 17:40, schrieb Luiz Capitulino:
> On Tue, 22 Apr 2014 22:44:03 +0100
> Hani Benhabiles <kroosec@gmail.com> wrote:
>=20
>> Signed-off-by: Hani Benhabiles <hani@linux.com>
>> ---
>>  qmp.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/qmp.c b/qmp.c
>> index 87a28f7..44a6e17 100644
>> --- a/qmp.c
>> +++ b/qmp.c
>> @@ -194,11 +194,10 @@ void qmp_system_wakeup(Error **errp)
>>  ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>>  {
>>      Object *obj;
>> -    bool ambiguous =3D false;
>>      ObjectPropertyInfoList *props =3D NULL;
>>      ObjectProperty *prop;
>> =20
>> -    obj =3D object_resolve_path(path, &ambiguous);
>> +    obj =3D object_resolve_path(path, NULL);
>>      if (obj =3D=3D NULL) {
>>          error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>>          return NULL;
>=20
> I'm under the impression that this check in object_resolve_partial_path=
():
>=20
>         if (ambiguous && *ambiguous) {
>             return NULL;
>         }
>=20
> Uses 'ambiguous' internally. In that case, this change could have a sid=
e effect.
>=20
> But I'm not sure, I think it would be good to get a reviewed-by from
> a QOM expert.

Your understanding matches mine. I would propose to instead use the
variable in error reporting:

if (ambiguous) {
    error_setg(errp, "Path '%s' is ambiguous.", path);
} else {
    error_set(errp, QERR_DEVICE_NOT_FOUND, path);
}

My reasoning is that an ambiguous path might deliver unpredictable
results (whichever it encounters first), across QEMU versions at least.

But I'd like to hear Paolo's opinion, too, since he was involved in
loosening requirements on paths.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

