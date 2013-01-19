Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwUUf-0008Sn-9W
	for mharc-qemu-trivial@gnu.org; Sat, 19 Jan 2013 04:13:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TwUUb-0008II-NC
	for qemu-trivial@nongnu.org; Sat, 19 Jan 2013 04:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TwUUa-00007O-1j
	for qemu-trivial@nongnu.org; Sat, 19 Jan 2013 04:13:37 -0500
Received: from mail-da0-f46.google.com ([209.85.210.46]:63047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TwUUX-00006r-7P; Sat, 19 Jan 2013 04:13:33 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so1970725dak.19
	for <multiple recipients>; Sat, 19 Jan 2013 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=FTkUe5fXGI9pSLdAKi9wEbrrGOBAy0xnNJ07O1EoTVg=;
	b=Uy0vhoqRCCRv6s9EFssUvaEBlhEMOisBMtcBrWuLB9YEnmTTD31DKWSeSahPGkoFUK
	jWwaZV3aL1LhCR5eMOEzIES9cyqNbmbZ4km2otH+Cb0FgsNuMzuPq/2DQuZ7YX/LG+vD
	pAS5+qr0T+kQQXahEkoLJ6nYQlpjlrYZHQEVMX9dVMtOOIjttGRSjpjijbmUh6EflhvV
	4iGIsv+DyrwfQsN8EH1rzGh+DBErgZPHp2NpYHT8avX8IxsdCE0tAZPuoqIpy4GjrpLt
	uNDiDOS2xSWPElBFU1+R7ypTA9jWk9nP3uzUZuGBwa9sUg/y7WtA+CiECnUSbaV/LNFV
	boRQ==
X-Received: by 10.68.245.167 with SMTP id xp7mr12994736pbc.75.1358586810898;
	Sat, 19 Jan 2013 01:13:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.208.168 with HTTP; Sat, 19 Jan 2013 01:13:09 -0800 (PST)
In-Reply-To: <871uditsdx.fsf@blackfin.pond.sub.org>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org>
	<50F437C5.4020905@suse.de> <87a9sboagf.fsf_-_@blackfin.pond.sub.org>
	<CAAu8pHsXqN5c6KyBnMUajsdpAk8JQ2UhsTYj0yp9zJ-C_ir18w@mail.gmail.com>
	<871uditsdx.fsf@blackfin.pond.sub.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 19 Jan 2013 09:13:09 +0000
Message-ID: <CAAu8pHugkpf6_xfpijQ9LwYHEDOQL_QA+Zt+cht9bySq_HGy8w@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.46
Cc: qemu-trivial <qemu-trivial@nongnu.org>, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] Go along with glib's basic type
	typedef silliness?
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
X-List-Received-Date: Sat, 19 Jan 2013 09:13:40 -0000

On Fri, Jan 18, 2013 at 3:36 PM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> Blue Swirl <blauwirbel@gmail.com> writes:
>
>> On Mon, Jan 14, 2013 at 7:01 PM, Markus Armbruster <armbru@redhat.com> w=
rote:
>>> [Thread hijack, dropping cc: qemu-trivial, qemu-ppc]
>>>
>>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>>>
>>>> Am 14.01.2013 13:19, schrieb Markus Armbruster:
>>>>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>>> [...]
>>>>>> diff --git a/qom/object.c b/qom/object.c
>>>>>> index 351b88c..03e6f24 100644
>>>>>> --- a/qom/object.c
>>>>>> +++ b/qom/object.c
>>>>>> @@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
>>>>>>      return newpath;
>>>>>>  }
>>>>>>
>>>>>> -Object *object_resolve_path_component(Object *parent, gchar *part)
>>>>>> +Object *object_resolve_path_component(Object *parent, const gchar *=
part)
>>>>>>  {
>>>>>>      ObjectProperty *prop =3D object_property_find(parent, part, NUL=
L);
>>>>>>      if (prop =3D=3D NULL) {
>>>>>
>>>>> Unrelated: do we really want to go along with glib's basic type typed=
ef
>>>>> silliness?
>>>>
>>>> Elsewhere I have adopted the exact GLib signature since typedefs can b=
e
>>>> changed at any time. In particular the GCompareFunc using gconstpointe=
r,
>>>> gint, etc. Not saying I find their GLib usage useful.
>>>
>>> No, these typedefs cannot be changed.
>>>
>>> Firstly, their exact definitions are documented[*], therefore can be
>>> relied on.
>>>
>>> Secondly, mountains of code rely on the exact definitions, and would
>>> break left and right if they were changed.
>>>
>>> They're a textbook example of a perfectly useless pseudo-abstraction.
>>
>> CONST, WORD, PWORD, DWORD, FLOAT etc. in a certain platform...
>
> MY EYES, MY EYES, WHAT DID YOU DO TO MY EYES!!!

Leishmaniasis Capslockititis Fenestrae? :-D

>
> [...]

