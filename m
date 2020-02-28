Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7cXo-0007MC-Oi
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 05:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j7cXm-0007M5-Nh
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j7cXl-0002Hz-Mz
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:06:54 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1j7cXl-0002H6-Gp; Fri, 28 Feb 2020 05:06:53 -0500
Received: by mail-wr1-x441.google.com with SMTP id l5so2277424wrx.4;
 Fri, 28 Feb 2020 02:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QcsX2Iifni8h7N5Wd79o/fV54m+uzfu3rFUKUk2JlQA=;
 b=hH5PxTLemaCYtpVRGZYWxWtnOvFUL7rbH5Qi/13c1YwNRbl4FBpDUuTnMTl/m/1jMV
 s+k6/n11zmrTruwYlGe63PMZwPMRNh2mVLrTY2YPfBSzCAU/55N5ZihU8Y8ks50TAAuc
 3c6iLyRjjxsdr5iw1JgxZcOhmJV63Nl+HRtlHvEI+hMHfEE0h/B0ZUQBc2zPywYLZSQt
 fjH4ukGiQgq7eiTNnslFYFqp6oFz3+wqtfmK8ZK/mcadRx3Yvh04LTsrBoEMMx1bC7zH
 ArPA+wdi/5TPOgdavaGpYFhFBE2Gd7q4+To5JW+UXXiyycQDpPZq/FKvLHgLgCEigCKy
 nDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QcsX2Iifni8h7N5Wd79o/fV54m+uzfu3rFUKUk2JlQA=;
 b=lDb+QvIRzq//HdsNYv9RNjvMpM0IF0i7ate7fKJ4PCcBFfinikXj3fM4RCZ4WpYRNU
 EvtCa5xXWsmDy+FvQOpnww5SMu9DOObXnDhucAgykSd8KcDVLp58BBYQ5bOIlLOe543D
 /M0d7hBI0fQ8pMzOhAbe2Qj5zq8DJ8Levka+LXUrYPujN19bp9Ni6wXlmZxJDXKCM7Ef
 QQ0u66YJduRvklvKbXdCMRV/gKVXlVjzT9Vj72cIF3qfvwNNBRZw8GNRAqvnuEM7WC2Q
 KTgacl9y6X/sOJXGZq4koTafjZFl9bjFGqHOlRZNRTq8fHrtMqI8bg9XnCyBptffdc9q
 sZVQ==
X-Gm-Message-State: APjAAAVnmQLWjNLQJhjCh/LU4/RTsdjPsV98JJ8VMWDjbPG5RZqw2QsA
 ykQjasBuPzIQK7AI3MtwLGA3hEMDLyd0EP/q3uw=
X-Google-Smtp-Source: APXvYqwWJbOX6qehrMq0Aju+p/SCkGPRTmp4tJ3aEupW4W479dG/pdnHnJhCdyfH9YooPOE4Oq5aCwBXkGywGosHbuU=
X-Received: by 2002:a05:6000:4a:: with SMTP id
 k10mr3932452wrx.381.1582884411686; 
 Fri, 28 Feb 2020 02:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200227190942.8834-1-philmd@redhat.com>
 <20200228094652.GB1657361@redhat.com>
In-Reply-To: <20200228094652.GB1657361@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 28 Feb 2020 11:06:38 +0100
Message-ID: <CAJ+F1CL-fbX=dXpopMMT1o-WH1JhrqrzpM55J9cGoGDNpDq=AQ@mail.gmail.com>
Subject: Re: [PATCH] qom/object: Comment to use g_slist_free on
 object_class_get_list result
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu trival <qemu-trivial@nongnu.org>, 
 Pan Nengyuan <pannengyuan@huawei.com>, QEMU <qemu-devel@nongnu.org>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2020 10:06:56 -0000

Hi

On Fri, Feb 28, 2020 at 10:47 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Feb 27, 2020 at 08:09:42PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Document the list returned by object_class_get_list() must be
> > released with g_slist_free() to avoid memory leaks.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  include/qom/object.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 29546496c1..5517b56508 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -984,6 +984,9 @@ void object_class_foreach(void (*fn)(ObjectClass *k=
lass, void *opaque),
> >   * @include_abstract: Whether to include abstract classes.
> >   *
> >   * Returns: A singly-linked list of the classes in reverse hashtable o=
rder.
> > + *
> > + * The returned list must be released with g_slist_free()
> > + * when no longer required.
>
> I'd suggest
>
>   "The returned list, but not its elements, must be released with
>    g_slist_free() or g_autoptr when no longer required"

As gobject-introspection annotations: "Returns: (transfer container)
(element-type ObjectClass): A list of #ObjectClass"

>
> >   */
> >  GSList *object_class_get_list(const char *implements_type,
> >                                bool include_abstract);
> > @@ -995,6 +998,9 @@ GSList *object_class_get_list(const char *implement=
s_type,
> >   *
> >   * Returns: A singly-linked list of the classes in alphabetical
> >   * case-insensitive order.
> > + *
> > + * The returned list must be released with g_slist_free()
> > + * when no longer required.
> >   */
> >  GSList *object_class_get_list_sorted(const char *implements_type,
> >                                bool include_abstract);
> > --
> > 2.21.1
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>


--=20
Marc-Andr=C3=A9 Lureau

