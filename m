Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ar0eM-00072D-DK
	for mharc-qemu-trivial@gnu.org; Fri, 15 Apr 2016 06:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ar0eG-0006rW-PM
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 06:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ar0eF-0001uB-N6
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 06:06:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ar0e9-0001mg-77; Fri, 15 Apr 2016 06:06:41 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC7E96316E;
	Fri, 15 Apr 2016 10:06:40 +0000 (UTC)
Received: from [10.36.112.47] (ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3FA6aW8016089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Apr 2016 06:06:38 -0400
To: Markus Armbruster <armbru@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87mvp4xsbk.fsf@dusky.pond.sub.org> <570910D5.4030705@cn.fujitsu.com>
	<87a8kzkzlj.fsf@dusky.pond.sub.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5710BD28.1090301@redhat.com>
Date: Fri, 15 Apr 2016 12:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <87a8kzkzlj.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 15 Apr 2016 10:06:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev property: cleanup
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
X-List-Received-Date: Fri, 15 Apr 2016 10:06:53 -0000



On 12/04/2016 10:20, Markus Armbruster wrote:
> QOM replaced the static DeviceInfo.  The static qdev property arrays
> remain, but they're now stored into their DeviceClass's member props
> dynamically, by the TypeInfo's class_init() method.
>=20
> The qdev properties so stored get mapped to QOM properties in
> device_initfn().  Two, in fact: a legacy property and a static property=
.
> qdev_property_add_legacy() converts to the former, and
> qdev_property_add_static() converts to the latter.

So far so good. :)

> I don't understand the difference between "legacy" and "static" well
> enough to explain it.  I also don't really understand what other kinds
> of QOM properties exist.

The "legacy" properties are needed for "info qtree".  For example, a PCI
address "01.0" is the number 8 in the normal property, and the string
"01.0" in the legacy property.

The normal property does accept a string, and converts it into the
number, but if you want the "human-readable" string back you need to use
the legacy properties.

>> original: *The actual type of the property and the field depends on
>> the property type*
>>
>> Using two same word 'property' is ambiguous and hard for newbie to
>> distinguish. The 1st 'property' should mean a QOM property. and the
>> 2nd 'property', I think the original author`s meaning is: qdev
>> property.

The type of the QOM property depends on the PropertyInfo and it's stored
in prop->info->name.

QType is, generally speaking, a JSON type name (int, bool, string, list,
dictionary).  Instead, the QOM property type is more complex; it can be:
1) a QAPI type name 2) link<QOM-TYPE> 3) child<QOM-TYPE>.

QAPI type names in turns are a superset of JSON type names.  For example
the QType for an enumeration could be QTYPE_QSTRING (yes, it has
prop->qtype equal to QTYPE_QINT now, but that's an accident).  The QAPI
type name instead could be "LostTickPolicy".  In the future, the latter
would also be introspectable through the "query-qmp-schema".

There is no reason for prop->qtype to be QTYPE_QINT in the case of a
string.  It would be easy to fix.  For example you could remove
prop->qtype and add a new prop->info->qtype that contains one of
QTYPE_QINT, QTYPE_QBOOL or, for enumerations, QTYPE_QSTRING.

> I agree the wording of the comment is suboptimal.
>=20
> The thing being added is a static QOM property.  Its type and so forth
> are taken from the qdev property @prop.
>=20
>>           But, what is the qdev property *type*? cannot find 'type'
>> field in the definition except a *qtype*

It is prop->info->name: PropertyInfo is a description of the property,
and the name of the PropertyInfo becomes the type of the QOM property.

>> struct Property {
>>     const char   *name;
>>     PropertyInfo *info;
>>     ptrdiff_t    offset;
>>     uint8_t      bitnr;
>>     QType        qtype;
>>     int64_t      defval;
>>     int          arrayoffset;
>>     PropertyInfo *arrayinfo;
>>     int          arrayfieldsize;
>> };
>>
>> And *the actual type of the field* depends on the qtype

It doesn't depend on the qtype.  It is stored there for convenience.

> Here's my try rewording the comment (sticking to GTK-Doc conventions
> even though I dislike them):
>=20
> /**
>  * @qdev_property_add_static:
>  * @dev: Device to add the property to
>  * @prop: The qdev property definition
>  * @err: location to store error information
>  *
>  * Add a static QOM property to @dev for qdev property @prop.
>  * On error, store error in @errp.
>  */
>=20
> Paolo, is it correct?

Yes, it is.  You can add also "The type of the QOM property is derived
from prop->info", which is what Cao Jin really wanted to convey in his
patch.

Paolo

