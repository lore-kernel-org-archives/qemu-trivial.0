Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RyKtA-0004SV-K1
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2012 05:18:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RyKt3-00045S-Eg
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:18:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RyKt2-0001Zp-74
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:17:57 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:56338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RyKsv-0001Y4-Cy; Fri, 17 Feb 2012 05:17:49 -0500
Received: by pbbro12 with SMTP id ro12so4327065pbb.4
	for <multiple recipients>; Fri, 17 Feb 2012 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5T641N++0F54BM3LMEkvJ1V9jy8fvC6acRwHYhxMwAw=;
	b=AopZfBhwbiIZCrmydNVCu9goQj4TdkCubld9BVEnnbtBF8YhgsB7w1KKPkoBD4Bkb1
	0pk10irQtSUNNVkX/IjwblxhiNKuyGB3i16ytx4RUdM95t0ePerUu0dqK4wgY8pqHwAi
	pAb2MjSMAHViK9Pf+CQka0hAvY8XBHArEJPRA=
Received: by 10.68.193.232 with SMTP id hr8mr17157677pbc.158.1329473867940;
	Fri, 17 Feb 2012 02:17:47 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id u9sm4825174pbe.36.2012.02.17.02.17.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 02:17:46 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F3E2945.3000603@redhat.com>
Date: Fri, 17 Feb 2012 11:17:41 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Alexander Barabash <alexander_barabash@mentor.com>
References: <4F3D3F67.9050506@mentor.com>
In-Reply-To: <4F3D3F67.9050506@mentor.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Add object_property_get_child().
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
X-List-Received-Date: Fri, 17 Feb 2012 10:18:01 -0000

Besides the non-triviality of the patch, how is this different from
object_property_get_link?  Perhaps we should just rename that one to
object_property_get_obj, or add a function that is just a synonym.

> + */
> +Object *object_property_get_child(Object *obj, const char *name,
> +                                  struct Error **errp);
> +
> +/**
>   * object_property_set:
>   * @obj: the object
>   * @v: the visitor that will be used to write the property value.  This
> should
> diff --git a/qom/object.c b/qom/object.c
> index 2de6eaf..61e775b 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -297,12 +297,86 @@ static void object_property_del_all(Object *obj)
>      }
>  }
> 
> +/*
> + * To ensure correct format checking,
> + * this function should be used only via REPORT_OBJECT_ERROR() macro.
> + *
> + * The first argument after 'obj' should be of type 'const char *'.
> + * It is ignored, and replaced by the canonical path of 'obj'.
> + */
> +static void report_object_error(Error **errp, const char *fmt, Object
> *obj, ...)
> +    GCC_FMT_ATTR(2, 4);
> +static void report_object_error(Error **errp, const char *fmt, Object
> *obj, ...)
> +{
> +    gchar *path;
> +    va_list ap;
> +
> +    if (errp != NULL) {
> +        path = object_get_canonical_path(obj);
> +        va_start(ap, obj);
> +        va_arg(ap, const char *); /* Ignore the dummy string. */

Why do you need it at all?

> +        error_set(errp, fmt, path, &ap);
> +        va_end(ap);
> +        g_free(path);
> +    }
> +}
> +#define REPORT_OBJECT_ERROR(errp, fmt, obj, ...)                 \
> +    do {                                                         \
> +        report_object_error(errp, fmt, obj, "", ## __VA_ARGS__); \
> +    } while (0)
> +#define CHILD_PROPERTY_TYPE_PREFIX "child<"
> +#define CHILD_PROPERTY_TYPE_SUFFIX ">"
> +#define LINK_PROPERTY_TYPE_PREFIX "link<"
> +#define LINK_PROPERTY_TYPE_SUFFIX ">"
> +
> +static bool object_property_is_child(ObjectProperty *prop)
> +{
> +    return (strstart(prop->type, CHILD_PROPERTY_TYPE_PREFIX, NULL) != 0);
> +}
> +
> +static bool object_property_is_link(ObjectProperty *prop)
> +{
> +    return (strstart(prop->type, LINK_PROPERTY_TYPE_PREFIX, NULL) != 0);
> +}
> +
> +/* Go from LINK_PROPERTY_TYPE_PREFIX FOO LINK_PROPERTY_TYPE_SUFFIX to
> FOO.  */
> +static gchar *link_type_to_type(const gchar *type)
> +{
> +    return g_strndup(&type[sizeof(LINK_PROPERTY_TYPE_PREFIX) - 1],
> +                     strlen(type)
> +                     - (sizeof(LINK_PROPERTY_TYPE_PREFIX) - 1)
> +                     - (sizeof(LINK_PROPERTY_TYPE_SUFFIX) - 1));
> +}
> +
> +static Object *object_property_extract_child(ObjectProperty *prop,
> +                                             bool *p_is_invalid_type)
> +{
> +    if (p_is_invalid_type != NULL) {
> +        *p_is_invalid_type = false;
> +    }
> +    if (object_property_is_child(prop)) {
> +        return (Object *)prop->opaque;
> +    } else if (object_property_is_link(prop)) {
> +        if (prop->opaque != NULL) {
> +            return *(Object **)prop->opaque;
> +        } else {
> +            return NULL;
> +        }
> +    } else {
> +        if (p_is_invalid_type != NULL) {
> +            *p_is_invalid_type = true;
> +        }
> +        return NULL;
> +    }
> +}
> +

object_property_get_child should never be on a fast path.  We should
avoid as much as possible peeking in the opaque.  Instead, you should
just use a visitor like object_property_get_link does.

Everything starting here should be a separate patch.  But if you remove
object_property_extract_child, I doubt it makes as much sense to
refactor this.

>  static void object_property_del_child(Object *obj, Object *child, Error
> **errp)
>  {
>      ObjectProperty *prop;
> 
>      QTAILQ_FOREACH(prop, &obj->properties, node) {
> -        if (!strstart(prop->type, "child<", NULL)) {
> +        if (!object_property_is_child(prop)) {
>              continue;
>          }
> 
> @@ -799,6 +873,27 @@ Object *object_get_root(void)
>      return root;
>  }
> 
> +Object *object_property_get_child(Object *obj, const char *name,
> +                                  struct Error **errp) {
> +    Object *result = NULL;
> +    ObjectProperty *prop = object_property_find(obj, name);
> +    bool is_invalid_type;
> +
> +    if (prop == NULL) {
> +        REPORT_OBJECT_ERROR(errp, QERR_OBJECT_PROPERTY_NOT_FOUND, obj,
> name);
> +        return NULL;
> +    }
> +
> +    result = object_property_extract_child(prop, &is_invalid_type);
> +    if (is_invalid_type) {
> +        REPORT_OBJECT_ERROR(errp, QERR_OBJECT_PROPERTY_INVALID_TYPE,
> +                            obj, name, "child");
> +        return NULL;
> +    }
> +
> +    return result;
> +}
> +
>  static void object_get_child_property(Object *obj, Visitor *v, void
> *opaque,
>                                        const char *name, Error **errp)
>  {
> @@ -829,7 +924,10 @@ void object_property_add_child(Object *obj, const
> char *name,
>       */
>      assert(!object_is_type(obj, type_interface));
> 
> -    type = g_strdup_printf("child<%s>",
> object_get_typename(OBJECT(child)));
> +    type = g_strdup_printf(CHILD_PROPERTY_TYPE_PREFIX
> +                           "%s"
> +                           CHILD_PROPERTY_TYPE_SUFFIX,
> +                           object_get_typename(OBJECT(child)));
> 
>      object_property_add(obj, name, type, object_get_child_property,
>                          NULL, object_finalize_child_property, child,
> errp);
> @@ -878,8 +976,7 @@ static void object_set_link_property(Object *obj,
> Visitor *v, void *opaque,
>      if (strcmp(path, "") != 0) {
>          Object *target;
> 
> -        /* Go from link<FOO> to FOO.  */
> -        target_type = g_strndup(&type[5], strlen(type) - 6);
> +        target_type = link_type_to_type(type);
>          target = object_resolve_path_type(path, target_type, &ambiguous);
> 
>          if (ambiguous) {
> @@ -907,7 +1004,9 @@ void object_property_add_link(Object *obj, const
> char *name,
>  {
>      gchar *full_type;
> 
> -    full_type = g_strdup_printf("link<%s>", type);
> +    full_type = g_strdup_printf(LINK_PROPERTY_TYPE_PREFIX
> +                                "%s"
> +                                LINK_PROPERTY_TYPE_SUFFIX, type);
> 
>      object_property_add(obj, name, full_type,
>                          object_get_link_property,
> @@ -932,7 +1031,7 @@ gchar *object_get_canonical_path(Object *obj)
>          g_assert(obj->parent != NULL);
> 
>          QTAILQ_FOREACH(prop, &obj->parent->properties, node) {
> -            if (!strstart(prop->type, "child<", NULL)) {
> +            if (!object_property_is_child(prop)) {
>                  continue;
>              }
> 
> @@ -980,15 +1079,7 @@ static Object *object_resolve_abs_path(Object
> *parent,
>          return NULL;
>      }
> 
> -    child = NULL;
> -    if (strstart(prop->type, "link<", NULL)) {
> -        Object **pchild = prop->opaque;
> -        if (*pchild) {
> -            child = *pchild;
> -        }
> -    } else if (strstart(prop->type, "child<", NULL)) {
> -        child = prop->opaque;
> -    }
> +    child = object_property_extract_child(prop, NULL);
> 
>      if (!child) {
>          return NULL;
> @@ -1010,7 +1101,7 @@ static Object *object_resolve_partial_path(Object
> *parent,
>      QTAILQ_FOREACH(prop, &parent->properties, node) {
>          Object *found;
> 
> -        if (!strstart(prop->type, "child<", NULL)) {
> +        if (!object_property_is_child(prop)) {
>              continue;
>          }
> 
> 
> 
> 

Paolo

