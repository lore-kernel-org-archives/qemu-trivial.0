Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhFAf-0004rQ-OH
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:26:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFAX-0004iQ-Cb
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFAP-0000Uo-P8
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:26:41 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33623 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WhFA7-0000GL-Df; Mon, 05 May 2014 05:26:15 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B1CDDAC4F;
	Mon,  5 May 2014 09:26:14 +0000 (UTC)
Message-ID: <53675935.7010105@suse.de>
Date: Mon, 05 May 2014 11:26:13 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>, 
	qemu-devel@nongnu.org
References: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
	<5364AAEE.7000500@msgid.tls.msk.ru>
	<5367560A.8010000@msgid.tls.msk.ru>
In-Reply-To: <5367560A.8010000@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: Report path ambiguity error.
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
X-List-Received-Date: Mon, 05 May 2014 09:26:49 -0000

Am 05.05.2014 11:12, schrieb Michael Tokarev:
> 03.05.2014 12:38, Michael Tokarev wrote:
> []
>> --- a/qmp.c
>> +++ b/qmp.c
>> @@ -200,7 +200,9 @@ ObjectPropertyInfoList *qmp_qom_list(const char *p=
ath, Error **errp)
>>
>>      obj =3D object_resolve_path(path, &ambiguous);
>>      if (obj =3D=3D NULL) {
>> -        error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>> +        error_set(errp,
>> +                  ambiguous ? "Path '%s' is ambiguous" : QERR_DEVICE_=
NOT_FOUND,
>> +                  path);
>>          return NULL;
>>      }
>=20
> I've applied this version.

Please undo. error_set() unlike error_setg() expects an ErrorClass
argument before the string. QERR_* macro contains *two* comma-separated
values, so it is on top filling in the device-not-found message as path
in the ambiguous case.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

