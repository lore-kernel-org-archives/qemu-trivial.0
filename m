Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aptZ1-0007IM-46
	for mharc-qemu-trivial@gnu.org; Tue, 12 Apr 2016 04:20:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aptYv-00076X-MO
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 04:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aptYr-0003XK-G0
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 04:20:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aptYj-0003Uu-G7; Tue, 12 Apr 2016 04:20:29 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DBC664D09;
	Tue, 12 Apr 2016 08:20:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3C8KP6B016685
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 12 Apr 2016 04:20:26 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D763011386D5; Tue, 12 Apr 2016 10:20:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87mvp4xsbk.fsf@dusky.pond.sub.org> <570910D5.4030705@cn.fujitsu.com>
Date: Tue, 12 Apr 2016 10:20:24 +0200
In-Reply-To: <570910D5.4030705@cn.fujitsu.com> (Cao jin's message of "Sat, 9
	Apr 2016 22:25:25 +0800")
Message-ID: <87a8kzkzlj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 12 Apr 2016 08:20:28 +0000 (UTC)
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
X-List-Received-Date: Tue, 12 Apr 2016 08:20:46 -0000

Cao jin <caoj.fnst@cn.fujitsu.com> writes:

> On 04/08/2016 07:17 PM, Markus Armbruster wrote:
>
>>> - * Static properties access data in a struct.  The actual type of the
>>> - * property and the field depends on the property type.
>>> + * Static properties access data in a struct. The actual type of ObjectProperty
>>> + * and the struct field depends on the @qtype type.
>>>    */
>>
>> Not sure this part is an improvement.  What's wrong with the current text?
>>
>
> In a word: little hard for newbies like me to understand. (I think
> comments are for newbies). see my feeling about the comment:
>
> As per my understanding, property has 2 kinds, former qdev property
> and the latest QOM property.

I'm afraid I don't really understand this stuff anymore myself.  The
code tries to explain itself in comments, but that's too scattered
reading to be of much help when you try to figure out how things fit
together.  Perhaps a usable overview is buried somewhere in one of
Andreas's KVM Forum talks on the subject.  We really need an
introduction and overview of QOM and its major applications such as qdev
in docs/.

Here's my best guess how things work.  Paolo, please correct mistakes.

Before QOM, qdev properties were fully static: defined in an array
member of (static) DeviceInfo.

QOM properties are dynamic: defined in code.

QOM replaced the static DeviceInfo.  The static qdev property arrays
remain, but they're now stored into their DeviceClass's member props
dynamically, by the TypeInfo's class_init() method.

The qdev properties so stored get mapped to QOM properties in
device_initfn().  Two, in fact: a legacy property and a static property.
qdev_property_add_legacy() converts to the former, and
qdev_property_add_static() converts to the latter.

I don't understand the difference between "legacy" and "static" well
enough to explain it.  I also don't really understand what other kinds
of QOM properties exist.

>                              For me, the original description is too
> ambiguous about 'property'.
>
> original: *The actual type of the property and the field depends on
> the property type*
>
> Using two same word 'property' is ambiguous and hard for newbie to
> distinguish. The 1st 'property' should mean a QOM property. and the
> 2nd 'property', I think the original author`s meaning is: qdev
> property.

I agree the wording of the comment is suboptimal.

The thing being added is a static QOM property.  Its type and so forth
are taken from the qdev property @prop.

>           But, what is the qdev property *type*? cannot find 'type'
> field in the definition except a *qtype*
>
> struct Property {
>     const char   *name;
>     PropertyInfo *info;
>     ptrdiff_t    offset;
>     uint8_t      bitnr;
>     QType        qtype;
>     int64_t      defval;
>     int          arrayoffset;
>     PropertyInfo *arrayinfo;
>     int          arrayfieldsize;
> };
>
> And *the actual type of the field* depends on the qtype, take bitmap
> field for example, bitmap field in a structure is always a *int*, but
> when convert to QOM property, it is treated as a *bool*, see
> DEFINE_PROP_BIT, DEFINE_PROP_BIT64, its qtype are QTYPE_QBOOL.
>
> But I am little confused also now, I think my modification isn`t perfect
> 1. see how qdev_property_add_static invoke object_property_add, it
> pass prop->info->name as its QOM property type
>
> 2. when structure field is enum, QOM property will treat it as
> string(not depends on qtype now), see code:
>
> else if (prop->info->enum_table) {
>     object_property_set_str(obj, prop->info->enum_table[prop->defval],
>                             prop->name, &error_abort);
>
> I will do more analyse before v2.

Here's my try rewording the comment (sticking to GTK-Doc conventions
even though I dislike them):

/**
 * @qdev_property_add_static:
 * @dev: Device to add the property to
 * @prop: The qdev property definition
 * @err: location to store error information
 *
 * Add a static QOM property to @dev for qdev property @prop.
 * On error, store error in @errp.
 */

Paolo, is it correct?

Cao jin, is it an improvement?

