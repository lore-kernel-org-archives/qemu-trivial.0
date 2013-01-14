Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TupIg-0000Ac-0D
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 14:02:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TupIY-00006x-NU
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 14:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TupIS-0001tt-TP
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 14:02:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TupHw-0001oe-IX; Mon, 14 Jan 2013 14:01:40 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0EJ1c60029249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 14 Jan 2013 14:01:38 -0500
Received: from blackfin.pond.sub.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0EJ1ba4002315; Mon, 14 Jan 2013 14:01:38 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B5DA8200A9; Mon, 14 Jan 2013 20:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org> <50F437C5.4020905@suse.de>
Date: Mon, 14 Jan 2013 20:01:36 +0100
In-Reply-To: <50F437C5.4020905@suse.de> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
	=?utf-8?Q?'s?= message of "Mon, 14 Jan 2013 17:52:21 +0100")
Message-ID: <87a9sboagf.fsf_-_@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>,
	agraf@suse.de
Subject: [Qemu-trivial] Go along with glib's basic type typedef silliness?
	(was: [Qemu-devel] [PATCH 01/10] qom: Make
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
X-List-Received-Date: Mon, 14 Jan 2013 19:02:24 -0000

[Thread hijack, dropping cc: qemu-trivial, qemu-ppc]

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 14.01.2013 13:19, schrieb Markus Armbruster:
>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
[...]
>>> diff --git a/qom/object.c b/qom/object.c
>>> index 351b88c..03e6f24 100644
>>> --- a/qom/object.c
>>> +++ b/qom/object.c
>>> @@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
>>>      return newpath;
>>>  }
>>>=20=20
>>> -Object *object_resolve_path_component(Object *parent, gchar *part)
>>> +Object *object_resolve_path_component(Object *parent, const gchar *par=
t)
>>>  {
>>>      ObjectProperty *prop =3D object_property_find(parent, part, NULL);
>>>      if (prop =3D=3D NULL) {
>>=20
>> Unrelated: do we really want to go along with glib's basic type typedef
>> silliness?
>
> Elsewhere I have adopted the exact GLib signature since typedefs can be
> changed at any time. In particular the GCompareFunc using gconstpointer,
> gint, etc. Not saying I find their GLib usage useful.

No, these typedefs cannot be changed.

Firstly, their exact definitions are documented[*], therefore can be
relied on.

Secondly, mountains of code rely on the exact definitions, and would
break left and right if they were changed.

They're a textbook example of a perfectly useless pseudo-abstraction.

[...]


[*] http://developer.gnome.org/glib/stable/glib-Basic-Types.html

