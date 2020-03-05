Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9r2l-0002W3-At
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 09:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9r2i-0002Uz-Bo
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 09:00:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9r2g-0003Rl-4w
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 09:00:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43974
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9r2f-0003R2-Vs
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 09:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583416801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bI0iCfiamLeEOlmfWmRkJ5EiM2hPPw5h7iy2jORdykg=;
 b=Pb4rQo64TrkFBn4JbRyH8YyYGijaZH12Y635tXqdpG/QUO7RLSrNbOesOL1lSSxdkF9Q2N
 /foKzjIjrdyyhpNXNh+P+Ten6bERNSgxg7eGROqIwEd0daYpQsmxFV4F+AKoM1FmBcH8a8
 701lAQmbmcmfBJZYZleOI7GkLs7UrQ8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-vNv82f8NPUCxHZ_Pxs3JHA-1; Thu, 05 Mar 2020 08:59:59 -0500
X-MC-Unique: vNv82f8NPUCxHZ_Pxs3JHA-1
Received: by mail-wm1-f70.google.com with SMTP id w12so1619002wmc.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 05:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u8jd0a0+Xax7mUAYuC9xZiQiejfDA6QnsCIrTtfC9sU=;
 b=t0TIUCzT2RJtAC283Yi6OpXwEihtMlyeLmkttDQXXVxWxPla5Aq7qJhkfJJIsHa6BV
 /hbcuSVAQvtKRsdssn43dWqDMNBg2UGlEmeRwjbbEf9JXubsMe5YFJPRlzAv+g1x+sw0
 lRYgZY9XrYRaYW6IAtRPamh9Gr2EMo6DyIw+MgXoTBTkS0h2/FYDg4gNa+nLBXqEc3B2
 2nx0xwat6B/NcbOhecaLf57JKUrGlIPEN4nTA7nJ8JZOo27shnCXei0csoCPWe+JW+yD
 LBE2Uhg4dVJNPEe7esrD7JikTSWHdfsK2MEehcZmpGZ5RxyNuMVBxCpIJtM6rGhvon3a
 oOvw==
X-Gm-Message-State: ANhLgQ0FbyqNB7zy5ItGOyRURtgO5qD/NTfIM/0MytkqVepfdZJUmXDV
 KVYSNUX4AyntvSmDy5sEG0YeWdLZN5cwL9uF+OF0tCcok5DXHzqGYlmAU8qarg22eExgG/7a828
 IGTnvwGOhugWC3dMVfQ==
X-Received: by 2002:adf:d4d1:: with SMTP id w17mr4133191wrk.206.1583416797995; 
 Thu, 05 Mar 2020 05:59:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtjEL1EUYiWx20HGAbu7L3jUMDJx1yfopfkBinXSHcbx3hKoL/XDiW6l4gy3l9mbC3NbrZKUA==
X-Received: by 2002:adf:d4d1:: with SMTP id w17mr4133167wrk.206.1583416797769; 
 Thu, 05 Mar 2020 05:59:57 -0800 (PST)
Received: from steredhat (host34-204-dynamic.43-79-r.retail.telecomitalia.it.
 [79.43.204.34])
 by smtp.gmail.com with ESMTPSA id n11sm11090406wrw.11.2020.03.05.05.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:59:57 -0800 (PST)
Date: Thu, 5 Mar 2020 14:59:55 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: Re: [PATCH v2 2/9] hw/audio/fmopl: Move ENV_CURVE to .heap to save
 32KiB of .bss
Message-ID: <20200305135955.balxqnfpmxvsee5b@steredhat>
References: <20200305124525.14555-1-philmd@redhat.com>
 <20200305124525.14555-3-philmd@redhat.com>
 <20200305134403.sagzdlf5iyk2iufs@steredhat>
 <20200305134837.ucdb6blcguyfrh6d@steredhat>
 <467b8f3a-7d11-8a10-009f-5e1affadea69@redhat.com>
MIME-Version: 1.0
In-Reply-To: <467b8f3a-7d11-8a10-009f-5e1affadea69@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 05 Mar 2020 14:00:05 -0000

On Thu, Mar 05, 2020 at 02:50:47PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 3/5/20 2:48 PM, Stefano Garzarella wrote:
> > On Thu, Mar 05, 2020 at 02:44:03PM +0100, Stefano Garzarella wrote:
> > > On Thu, Mar 05, 2020 at 01:45:18PM +0100, Philippe Mathieu-Daud=E9 wr=
ote:
> > > > This buffer is only used by the adlib audio device. Move it to
> > > > the .heap to release 32KiB of .bss (size reported on x86_64 host).
> > > >=20
> > > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > ---
> > > >   hw/audio/fmopl.c | 4 +++-
> > > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> > > > index 173a7521f2..356d4dfbca 100644
> > > > --- a/hw/audio/fmopl.c
> > > > +++ b/hw/audio/fmopl.c
> > > > @@ -186,7 +186,7 @@ static int32_t *VIB_TABLE;
> > > >   /* envelope output curve table */
> > > >   /* attack + decay + OFF */
> > > > -static int32_t ENV_CURVE[2*EG_ENT+1];
> > > > +static int32_t *ENV_CURVE;
> > > >   /* multiple table */
> > > >   #define ML 2
> > > > @@ -1090,6 +1090,7 @@ FM_OPL *OPLCreate(int clock, int rate)
> > > >   =09OPL->clock =3D clock;
> > > >   =09OPL->rate  =3D rate;
> > > >   =09OPL->max_ch =3D max_ch;
> > > > +    ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
> >=20
> > Should we use g_new0() ?
>=20
> No because the array is filled before being used. I can add a note about
> this.
>=20

Thanks for the clarification!
Yes, if you need to respin, maybe it's better.

Thanks,
Stefano


