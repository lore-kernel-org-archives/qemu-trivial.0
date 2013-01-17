Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tvw2u-0005nP-1h
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 15:26:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Tvw2r-0005gP-RF
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Tvw2q-0007F5-Fe
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:26:41 -0500
Received: from mail-da0-f46.google.com ([209.85.210.46]:39625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Tvw2k-0007Dj-3C; Thu, 17 Jan 2013 15:26:34 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so1266378dak.19
	for <multiple recipients>; Thu, 17 Jan 2013 12:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=xQ/F18c3gh3/3bdyJuSHBmIbuo47LjjtDxB6Jtqfvp8=;
	b=o6850mTELxl89KSt9msd95cE/3FJREkeURni9XovbcL/OAMYqsluCZpJixl2a+P8ak
	fXuK2zocPBfa8N4oZPRHKl2rae1MMBxLevyZ6tmBqi7m2aznfrouRWGkfeMdz108UDpC
	VGvo5hrnTmQ5lI0D/OeZqpllfEDT2Rr85IIap/NUKBApDgJwcrVsex5nCR8hRTv1AZ1w
	UAfOqgqVD9YaWqwH93pp/GADCYKjUDgMRawn4BFAfORHnGIV1x0pVZOgUfZ+aTp/1rgp
	5qc1MYR0XfVepETrgWTgApp32p+TLYY1bj2O/POvqGvQGuqY26BGuqyivj2jvFsBH/Zv
	bvXQ==
X-Received: by 10.68.239.232 with SMTP id vv8mr16927679pbc.53.1358454393137;
	Thu, 17 Jan 2013 12:26:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.208.168 with HTTP; Thu, 17 Jan 2013 12:26:12 -0800 (PST)
In-Reply-To: <87a9sboagf.fsf_-_@blackfin.pond.sub.org>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org>
	<50F437C5.4020905@suse.de> <87a9sboagf.fsf_-_@blackfin.pond.sub.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Thu, 17 Jan 2013 20:26:12 +0000
Message-ID: <CAAu8pHsXqN5c6KyBnMUajsdpAk8JQ2UhsTYj0yp9zJ-C_ir18w@mail.gmail.com>
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
 typedef silliness? (was: [PATCH 01/10] qom: Make
 object_resolve_path_component() path argument const)
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
X-List-Received-Date: Thu, 17 Jan 2013 20:26:43 -0000

On Mon, Jan 14, 2013 at 7:01 PM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> [Thread hijack, dropping cc: qemu-trivial, qemu-ppc]
>
> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>
>> Am 14.01.2013 13:19, schrieb Markus Armbruster:
>>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
> [...]
>>>> diff --git a/qom/object.c b/qom/object.c
>>>> index 351b88c..03e6f24 100644
>>>> --- a/qom/object.c
>>>> +++ b/qom/object.c
>>>> @@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
>>>>      return newpath;
>>>>  }
>>>>
>>>> -Object *object_resolve_path_component(Object *parent, gchar *part)
>>>> +Object *object_resolve_path_component(Object *parent, const gchar *pa=
rt)
>>>>  {
>>>>      ObjectProperty *prop =3D object_property_find(parent, part, NULL)=
;
>>>>      if (prop =3D=3D NULL) {
>>>
>>> Unrelated: do we really want to go along with glib's basic type typedef
>>> silliness?
>>
>> Elsewhere I have adopted the exact GLib signature since typedefs can be
>> changed at any time. In particular the GCompareFunc using gconstpointer,
>> gint, etc. Not saying I find their GLib usage useful.
>
> No, these typedefs cannot be changed.
>
> Firstly, their exact definitions are documented[*], therefore can be
> relied on.
>
> Secondly, mountains of code rely on the exact definitions, and would
> break left and right if they were changed.
>
> They're a textbook example of a perfectly useless pseudo-abstraction.

CONST, WORD, PWORD, DWORD, FLOAT etc. in a certain platform...

>
> [...]
>
>
> [*] http://developer.gnome.org/glib/stable/glib-Basic-Types.html
>

