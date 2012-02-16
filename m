Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5p9-0001i0-2Z
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 13:12:55 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5p1-0001G6-Bp
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5ow-0002A4-Lo
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:12:47 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:51622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Ry5ok-00028g-78; Thu, 16 Feb 2012 13:12:30 -0500
Received: by qafi31 with SMTP id i31so2614551qaf.4
	for <multiple recipients>; Thu, 16 Feb 2012 10:12:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.102.75 with SMTP id f11mr2401463qco.49.1329415949521; Thu,
	16 Feb 2012 10:12:29 -0800 (PST)
Received: by 10.229.35.1 with HTTP; Thu, 16 Feb 2012 10:12:29 -0800 (PST)
In-Reply-To: <4F3D3F26.8010402@mentor.com>
References: <4F3D3F26.8010402@mentor.com>
Date: Thu, 16 Feb 2012 18:12:29 +0000
Message-ID: <CAFEAcA-B=nrJYwx9yYiAVOWSsKyD+UtvcXn-K3Q7mMj-9tCVTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Alexander Barabash <alexander_barabash@mentor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQlYjB7T0OrcKV3iMvtlDMknWQj+OnIXhTTLrg6hxLQepkB0ox5HSitIP2+XF3CzQF1o7+C/
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [TRIVIAL] Replace
	object_delete() with object_unref().
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
X-List-Received-Date: Thu, 16 Feb 2012 18:12:53 -0000

Object model lifecycle changes aren't trivial IMHO.
[no comment on actual patch contents implied]

-- PMM

On 16 February 2012 17:38, Alexander Barabash
<alexander_barabash@mentor.com> wrote:
>
> =C2=A0 =C2=A0Replace object_delete() with object_unref().
>
> =C2=A0 =C2=A0In the existing implementation, object_delete()
> =C2=A0 =C2=A0calls object_unref(), then frees the object's storage.
> =C2=A0 =C2=A0Running object_delete() on an object with reference count
> =C2=A0 =C2=A0different from one (1) causes program failure.
>
> =C2=A0 =C2=A0In the existing implementation, object_unref()
> =C2=A0 =C2=A0finalizes the object when its reference count becomes zero (=
0).
>
> =C2=A0 =C2=A0In the new implementation, object_unref()
> =C2=A0 =C2=A0finalizes and frees the object's storage when the reference =
count becomes
> zero (0).
>
> =C2=A0 =C2=A0One usage of object_delete() replaced by object_unref().
>
> =C2=A0 =C2=A0Signed-off-by: Alexander Barabash <alexander_barabash@mentor=
.com>
>
> diff --git a/hw/qdev.c b/hw/qdev.c
> index f0eb3a7..891981a 100644
> --- a/hw/qdev.c
> +++ b/hw/qdev.c
> @@ -247,7 +247,7 @@ void qdev_init_nofail(DeviceState *dev)
> =C2=A0/* Unlink device from bus and free the structure. =C2=A0*/
> =C2=A0void qdev_free(DeviceState *dev)
> =C2=A0{
> - =C2=A0 =C2=A0object_delete(OBJECT(dev));
> + =C2=A0 =C2=A0object_unref(OBJECT(dev));
> =C2=A0}
>
> =C2=A0void qdev_machine_creation_done(void)
> diff --git a/include/qemu/object.h b/include/qemu/object.h
> index 69cc2ab..e7e32fe 100644
> --- a/include/qemu/object.h
> +++ b/include/qemu/object.h
> @@ -415,8 +415,9 @@ struct InterfaceInfo
> =C2=A0* object_new:
> =C2=A0* @typename: The name of the type of the object to instantiate.
> =C2=A0*
> - * This function will initialize a new object using heap allocated memor=
y.
> =C2=A0This
> - * function should be paired with object_delete() to free the resources
> + * This function will initialize a new object using heap allocated memor=
y.
> + * The object's reference count will be set to one (1) upon successful
> completion.
> + * This function should be paired with object_unref() to free the resour=
ces
> =C2=A0* associated with the object.
> =C2=A0*
> =C2=A0* Returns: The newly allocated and instantiated object.
> @@ -427,8 +428,9 @@ Object *object_new(const char *typename);
> =C2=A0* object_new_with_type:
> =C2=A0* @type: The type of the object to instantiate.
> =C2=A0*
> - * This function will initialize a new object using heap allocated memor=
y.
> =C2=A0This
> - * function should be paired with object_delete() to free the resources
> + * This function will initialize a new object using heap allocated memor=
y.
> + * The object's reference count will be set to one (1) upon successful
> completion.
> + * This function should be paired with object_unref() to free the resour=
ces
> =C2=A0* associated with the object.
> =C2=A0*
> =C2=A0* Returns: The newly allocated and instantiated object.
> @@ -436,15 +438,6 @@ Object *object_new(const char *typename);
> =C2=A0Object *object_new_with_type(Type type);
>
> =C2=A0/**
> - * object_delete:
> - * @obj: The object to free.
> - *
> - * Finalize an object and then free the memory associated with it. =C2=
=A0This
> should
> - * be paired with object_new() to free the resources associated with an
> object.
> - */
> -void object_delete(Object *obj);
> -
> -/**
> =C2=A0* object_initialize_with_type:
> =C2=A0* @obj: A pointer to the memory to be used for the object.
> =C2=A0* @type: The type of the object to instantiate.
> @@ -573,8 +566,10 @@ void object_ref(Object *obj);
> =C2=A0* qdef_unref:
> =C2=A0* @obj: the object
> =C2=A0*
> - * Decrease the reference count of a object. =C2=A0A object cannot be fr=
eed as
> long
> + * Decrease the reference count of a object. =C2=A0A object is not freed=
 as long
> =C2=A0* as its reference count is greater than zero.
> + * Once an object's reference count gets to zero (0),
> + * the object is finalized and the memory associated with it is freed.
> =C2=A0*/
> =C2=A0void object_unref(Object *obj);
>
> diff --git a/qom/object.c b/qom/object.c
> index 0cbd9bb..2de6eaf 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -328,7 +328,7 @@ static void object_deinit(Object *obj, TypeImpl *type=
)
> =C2=A0 =C2=A0 while (obj->interfaces) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface *iface_obj =3D obj->interfaces->dat=
a;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj->interfaces =3D g_slist_delete_link(obj->=
interfaces,
> obj->interfaces);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0object_delete(OBJECT(iface_obj));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(iface_obj));
> =C2=A0 =C2=A0 }
>
> =C2=A0 =C2=A0 if (type_has_parent(type)) {
> @@ -369,13 +369,6 @@ Object *object_new(const char *typename)
> =C2=A0 =C2=A0 return object_new_with_type(ti);
> =C2=A0}
>
> -void object_delete(Object *obj)
> -{
> - =C2=A0 =C2=A0object_unref(obj);
> - =C2=A0 =C2=A0g_assert(obj->ref =3D=3D 0);
> - =C2=A0 =C2=A0g_free(obj);
> -}
> -
> =C2=A0static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
> =C2=A0{
> =C2=A0 =C2=A0 assert(target_type);
> @@ -583,6 +576,7 @@ void object_unref(Object *obj)
> =C2=A0 =C2=A0 /* parent always holds a reference to its children */
> =C2=A0 =C2=A0 if (obj->ref =3D=3D 0) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_finalize(obj);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(obj);
> =C2=A0 =C2=A0 }
> =C2=A0}
>
>
>

