Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iV942-0005B5-VU
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2019 01:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iV93y-0005Ak-Mp
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 01:57:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iV93w-0007vu-9g
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 01:57:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42658
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iV93u-0007uw-Rc
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 01:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573714621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTgs9h1Qgyj1oIDYbHnE9js5kpA64+YRNAe7/qddthQ=;
 b=i5mTSRLehDAzJ0sIyufgeYN6GZVrarlUHlLg39wyW/D5bf9KrDko1ix7hOHqXOo3NGtoSB
 OxlAE/cY4uYkTZBPC5nz749qbPQ1ZKQ++mNQp2dhb9F6Iar6yYRs9OsteUxIm+mVXKEy6Q
 oh+Oc/K+a1lG1FYeu4zpFlEsBDYYGhE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-y7qk38dIPtuz_KrS_ga1Iw-1; Thu, 14 Nov 2019 01:55:34 -0500
Received: by mail-oi1-f197.google.com with SMTP id n30so2580773oij.9
 for <qemu-trivial@nongnu.org>; Wed, 13 Nov 2019 22:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aTgs9h1Qgyj1oIDYbHnE9js5kpA64+YRNAe7/qddthQ=;
 b=CbZBIc8z7SszIPDUtX6KWuW2b8Y/qY6/lTSG7NXQU+JgXFceU3+wTLzK9cyKwr148r
 PSzJs1IS6KrKjuyoe0aDCOCSmWH40KXL4NgHIHO5WQixRgVEVd95Ozidd0fYV2UpzLMs
 EBWmdvElfo9PPEunOjAiICpzUcNJk5GMDVFPydQTKOsytecjXKgWV4qyHwC3q6Ck+w8o
 p3OxQeinaFfpMo6Lr0R24jhKkcelC51BuZvkszu1RgxmhONewJbzlfzY3/AONeRSNcST
 e65mHQEH/SRmYt016rRApNEcVdE6Ews9KoYDcnFaPNKQKKTthNjaJO0WoCE3E0BQZIHk
 b80A==
X-Gm-Message-State: APjAAAVhREs6nUOeLFXZlP/iHngTCQcMWYQLS85C1eXoNPZxeuL+LMxt
 Fm0wPNHnufEXMNzMhG8ADEhX/xFDeb4v4YyNGslHFb24qXkghsyT3TDJv625xqXD5SNhxx5q6XL
 kQ+jYuoz5uiZAc02PY+Os5bG9bCxCZqoiJg==
X-Received: by 2002:a05:6830:164a:: with SMTP id
 h10mr5797347otr.62.1573714534030; 
 Wed, 13 Nov 2019 22:55:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIwG9Bqt+UjqWEJpwAL9zIZF9Gx/3IPseGIPb2bggBNco854GHBl3rLEGHuBuUI8I6hzo6DEcqeC4AI7y5PQU=
X-Received: by 2002:a05:6830:164a:: with SMTP id
 h10mr5797336otr.62.1573714533814; 
 Wed, 13 Nov 2019 22:55:33 -0800 (PST)
MIME-Version: 1.0
References: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
In-Reply-To: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 14 Nov 2019 10:55:22 +0400
Message-ID: <CAMxuvazypNCcEXLhVOk74DYLQt8tGesbDYAEpwzWqR1PArnQAQ@mail.gmail.com>
Subject: Re: [PATCH] tests: fix modules-test 'duplicate test case' error
To: Cole Robinson <crobinso@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
X-MC-Unique: y7qk38dIPtuz_KrS_ga1Iw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 14 Nov 2019 06:57:08 -0000

On Thu, Nov 14, 2019 at 1:09 AM Cole Robinson <crobinso@redhat.com> wrote:
>
> ./configure --enable-sdl --audio-drv-list=3Dsdl --enable-modules
>
> Will generate two identical test names: /$arch/module/load/sdl
> Which generates an error like:
>
> (tests/modules-test:23814): GLib-ERROR **: 18:23:06.359: duplicate test c=
ase path: /aarch64//module/load/sdl
>
> Add the subsystem prefix in the name as well, so instead we get:
>
> /$arch/module/load/audio-sdl
> /$arch/module/load/ui-sdl
>
> Signed-off-by: Cole Robinson <crobinso@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/modules-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/modules-test.c b/tests/modules-test.c
> index d1a6ace218..88217686e1 100644
> --- a/tests/modules-test.c
> +++ b/tests/modules-test.c
> @@ -64,7 +64,8 @@ int main(int argc, char *argv[])
>      g_test_init(&argc, &argv, NULL);
>
>      for (i =3D 0; i < G_N_ELEMENTS(modules); i +=3D 2) {
> -        char *testname =3D g_strdup_printf("/module/load/%s", modules[i =
+ 1]);
> +        char *testname =3D g_strdup_printf("/module/load/%s%s",
> +                                         modules[i], modules[i + 1]);
>          qtest_add_data_func(testname, modules + i, test_modules_load);
>          g_free(testname);
>      }
> --
> 2.23.0
>


