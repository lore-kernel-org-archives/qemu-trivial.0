Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aoUQU-0002ry-FI
	for mharc-qemu-trivial@gnu.org; Fri, 08 Apr 2016 07:18:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aoUQP-0002hp-43
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2016 07:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aoUQN-0003a9-1f
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2016 07:18:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aoUQF-0003Vn-05; Fri, 08 Apr 2016 07:17:55 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 566D06542C;
	Fri,  8 Apr 2016 11:17:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u38BHqpR030502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 8 Apr 2016 07:17:53 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9A76C11C6D99; Fri,  8 Apr 2016 13:17:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	peter.maydell@linaro.org
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Date: Fri, 08 Apr 2016 13:17:51 +0200
In-Reply-To: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com> (Cao
	jin's message of "Thu, 24 Mar 2016 18:14:21 +0800")
Message-ID: <87mvp4xsbk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 08 Apr 2016 11:17:54 +0000 (UTC)
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
X-List-Received-Date: Fri, 08 Apr 2016 11:18:09 -0000

[Wasn't delivered correctly by eggs.gnu.org, resending]

The subsystem tag should be just "qdev:".  Suggest "qdev: Clean up
around properties".

Cao jin <caoj.fnst@cn.fujitsu.com> writes:

> include:
> 1. remove unnecessary declaration of static function
> 2. fix inconsistency between comment and function name, and typo OOM->QOM
> 2. update comment of function
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> A question about legacy property: I don`t see legacy property is really
> used in the code, so, why still add legacy property to object?
>
> since it has no maintainer, so the cc list is by intuition...
>
>  hw/core/qdev.c               | 14 ++++++--------
>  include/hw/qdev-properties.h |  4 ++--
>  2 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index db41aa1..743b71b 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -58,9 +58,6 @@ const char *qdev_fw_name(DeviceState *dev)
>      return object_get_typename(OBJECT(dev));
>  }
>  
> -static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
> -                                     Error **errp);
> -
>  static void bus_remove_child(BusState *bus, DeviceState *child)
>  {
>      BusChild *kid;
> @@ -908,12 +905,12 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
>  }
>  
>  /**
> - * @qdev_add_legacy_property - adds a legacy property
> + * @qdev_property_add_legacy - adds a legacy property

Style#1:

    function_name - headline

We generally use the imperative mood: "add a legacy property".

>   *
>   * Do not use this is new code!  Properties added through this interface will
>   * be given names and types in the "legacy" namespace.
>   *
> - * Legacy properties are string versions of other OOM properties.  The format
> + * Legacy properties are string versions of other QOM properties.  The format
>   * of the string depends on the property type.
>   */
>  static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
> @@ -937,10 +934,11 @@ static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>  }
>  
>  /**
> - * @qdev_property_add_static - add a @Property to a device.
> + * @qdev_property_add_static
> + * add a QOM property to @dev via its qdev Property @prop

Style#2:

    function_name
    headline

>   *
> - * Static properties access data in a struct.  The actual type of the
> - * property and the field depends on the property type.
> + * Static properties access data in a struct. The actual type of ObjectProperty
> + * and the struct field depends on the @qtype type.
>   */

Not sure this part is an improvement.  What's wrong with the current text?

>  void qdev_property_add_static(DeviceState *dev, Property *prop,
>                                Error **errp)
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0586cac..8c4481b 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -197,8 +197,8 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
>                                      Property *prop, const char *value);
>  
>  /**
> - * @qdev_property_add_static - add a @Property to a device referencing a
> - * field in a struct.
> + * @qdev_property_add_static - add a ObjectProperty to @dev via its qdev
> + * property @prop, referencing a field in the struct.
>   */

Style#3:

    function_name - sentence spanning multiple
    lines.

Pick one style and stick to it.

The rest of qdev-properties.h appears to use GTK-Doc style (which I
personally dislike, but that doesn't matter here).  See
https://developer.gnome.org/gtk-doc-manual/stable/documenting_symbols.html

If both declaration and definition have a comment, as they do here, they
should match exactly.

>  void qdev_property_add_static(DeviceState *dev, Property *prop, Error **errp);

