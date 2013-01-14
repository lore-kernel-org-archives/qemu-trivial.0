Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TunHY-00036P-6M
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 11:53:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TunHQ-0002u5-Ap
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 11:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TunHJ-0000ru-SC
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 11:53:00 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36885 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TunGr-0000iU-Lg; Mon, 14 Jan 2013 11:52:25 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B85ACA39D2;
	Mon, 14 Jan 2013 17:52:24 +0100 (CET)
Message-ID: <50F437C5.4020905@suse.de>
Date: Mon, 14 Jan 2013 17:52:21 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358121304-21345-1-git-send-email-afaerber@suse.de>
	<1358121304-21345-2-git-send-email-afaerber@suse.de>
	<87k3rg2bzf.fsf@blackfin.pond.sub.org>
In-Reply-To: <87k3rg2bzf.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>,
	agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qom: Make
 object_resolve_path_component() path argument const
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
X-List-Received-Date: Mon, 14 Jan 2013 16:53:06 -0000

Am 14.01.2013 13:19, schrieb Markus Armbruster:
> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>=20
>> This allows to navigate partial well-known paths from an object.
>=20
> Why does making the argument const allow such navigation?

Without const, object_resolve_path_component(foo, "bar") results in a
compile error (09/10 accesses "ide[1]" etc. to avoid exposing the full
MacIOState).

Apparently this function was so far only used on dynamically generated
(non-const) arrays:

qom/container.c:        child =3D object_resolve_path_component(obj,
parts[i]);
qom/object.c:    child =3D object_resolve_path_component(parent,
parts[index]);

>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> Cc: Anthony Liguori <anthony@codemonkey.ws>
>> ---
>>  include/qom/object.h |    2 +-
>>  qom/object.c         |    2 +-
>>  2 Dateien ge=C3=A4ndert, 2 Zeilen hinzugef=C3=BCgt(+), 2 Zeilen entfe=
rnt(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index d43b289..1ef2f0e 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -900,7 +900,7 @@ Object *object_resolve_path_type(const char *path,=
 const char *typename,
>>   *
>>   * Returns: The resolved object or NULL on path lookup failure.
>>   */
>> -Object *object_resolve_path_component(Object *parent, gchar *part);
>> +Object *object_resolve_path_component(Object *parent, const gchar *pa=
rt);
>>  /**
>>   * object_property_add_child:
>> diff --git a/qom/object.c b/qom/object.c
>> index 351b88c..03e6f24 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
>>      return newpath;
>>  }
>> =20
>> -Object *object_resolve_path_component(Object *parent, gchar *part)
>> +Object *object_resolve_path_component(Object *parent, const gchar *pa=
rt)
>>  {
>>      ObjectProperty *prop =3D object_property_find(parent, part, NULL)=
;
>>      if (prop =3D=3D NULL) {
>=20
> Unrelated: do we really want to go along with glib's basic type typedef
> silliness?

Elsewhere I have adopted the exact GLib signature since typedefs can be
changed at any time. In particular the GCompareFunc using gconstpointer,
gint, etc. Not saying I find their GLib usage useful.

I admit I didn't review object_property_find(), which uses const char*.
So I wouldn't mind sending a v2 if non-g is preferred. Or Anthony or
Stefan could just edit the patch in my name before applying. :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

