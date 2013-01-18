Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwE0B-00076m-Du
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 10:37:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TwE07-0006sy-SH
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TwE04-0000NP-5O
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:37:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:61305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TwDzr-0000LZ-8S; Fri, 18 Jan 2013 10:36:47 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0IFaiA8024109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 18 Jan 2013 10:36:44 -0500
Received: from blackfin.pond.sub.org (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0IFahMG010320; Fri, 18 Jan 2013 10:36:44 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E425B200A9; Fri, 18 Jan 2013 16:36:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Blue Swirl <blauwirbel@gmail.com>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org> <50F437C5.4020905@suse.de>
	<87a9sboagf.fsf_-_@blackfin.pond.sub.org>
	<CAAu8pHsXqN5c6KyBnMUajsdpAk8JQ2UhsTYj0yp9zJ-C_ir18w@mail.gmail.com>
Date: Fri, 18 Jan 2013 16:36:42 +0100
In-Reply-To: <CAAu8pHsXqN5c6KyBnMUajsdpAk8JQ2UhsTYj0yp9zJ-C_ir18w@mail.gmail.com>
	(Blue Swirl's message of "Thu, 17 Jan 2013 20:26:12 +0000")
Message-ID: <871uditsdx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
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
X-List-Received-Date: Fri, 18 Jan 2013 15:37:05 -0000

Blue Swirl <blauwirbel@gmail.com> writes:

> On Mon, Jan 14, 2013 at 7:01 PM, Markus Armbruster <armbru@redhat.com> wr=
ote:
>> [Thread hijack, dropping cc: qemu-trivial, qemu-ppc]
>>
>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>>
>>> Am 14.01.2013 13:19, schrieb Markus Armbruster:
>>>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>> [...]
>>>>> diff --git a/qom/object.c b/qom/object.c
>>>>> index 351b88c..03e6f24 100644
>>>>> --- a/qom/object.c
>>>>> +++ b/qom/object.c
>>>>> @@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
>>>>>      return newpath;
>>>>>  }
>>>>>
>>>>> -Object *object_resolve_path_component(Object *parent, gchar *part)
>>>>> +Object *object_resolve_path_component(Object *parent, const gchar *p=
art)
>>>>>  {
>>>>>      ObjectProperty *prop =3D object_property_find(parent, part, NULL=
);
>>>>>      if (prop =3D=3D NULL) {
>>>>
>>>> Unrelated: do we really want to go along with glib's basic type typedef
>>>> silliness?
>>>
>>> Elsewhere I have adopted the exact GLib signature since typedefs can be
>>> changed at any time. In particular the GCompareFunc using gconstpointer,
>>> gint, etc. Not saying I find their GLib usage useful.
>>
>> No, these typedefs cannot be changed.
>>
>> Firstly, their exact definitions are documented[*], therefore can be
>> relied on.
>>
>> Secondly, mountains of code rely on the exact definitions, and would
>> break left and right if they were changed.
>>
>> They're a textbook example of a perfectly useless pseudo-abstraction.
>
> CONST, WORD, PWORD, DWORD, FLOAT etc. in a certain platform...

MY EYES, MY EYES, WHAT DID YOU DO TO MY EYES!!!

[...]

