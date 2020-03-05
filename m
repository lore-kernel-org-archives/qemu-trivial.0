Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9qiG-0006XO-Fd
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 08:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9qiD-0006Wb-Rb
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:38:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9qiC-0007jH-B5
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:38:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45178
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9qiC-0007gy-6M
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583415531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPHH8mW0biUif/wcEtnaW3iI515wvlFzH+LPakX53NQ=;
 b=My91TENfIZ+0HN4a5rSOIAXpvCDGdgNLXoH/T7Epmfpt6woTd3KKD5F0BvoJ4oazVAne6t
 6mQXv/j7OTfujlPw0Suq0Acv/sOeVMQ0+6ha7RaBXPrF4Y1sbxfdxpizY8qcvWOrnNXXHW
 zfvrJ8zoceCgsDpU1QZ5/4Vyp2Q5JbU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-KraLn9mSMQaMzep8J8-PkQ-1; Thu, 05 Mar 2020 08:38:47 -0500
X-MC-Unique: KraLn9mSMQaMzep8J8-PkQ-1
Received: by mail-wr1-f71.google.com with SMTP id o9so2316423wrw.14
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 05:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OLW08cT74B6c6FcSqTjhCMVIlW3TGZ96x2uEB+fBE3Y=;
 b=GHBGt9bQrqn2ZVSBRiFNE6KQBMw3pI6YgoKDLTRxI+EVvJEx0vP/JcL/pdwJXw9288
 TfzVJlvYmXcXNg33G7De73pVzXdcmjAYle4/bv2BtCeju/kB+qzvHuqgOux6QlVxHoLu
 qI7RBkyO4JfhWq3uBH4GLfek5SESuaFmN0zBCJsS9O/Hb0s6ZgTd2UxFK0HTWsSwsqdA
 rS+HizNXrYuj24TTWsybHiAvgsMXthw3dcFYikqr2ZceyRu30/rHPpdueLeEh+vHgsjP
 ij2ZF+zxDQkcdLH936AOWvWtfUgM5/UtVmO6XDR2BQdAIoPqf0cM3DLqF3Kcd5kouyTz
 IhFg==
X-Gm-Message-State: ANhLgQ3e5I/5GJ7oQXZMwAdr6D45WsIdlY8ovuGx/bYjRA0JEcM6Nnfh
 ng+hlEaZpljhLqw+DtacXUpsXqV8Wpy80HGpqSac9fTj8adAIuh9eq3jDgyfADMSDiWssYO0wec
 uBiYDpxiYOu9z7aurlg==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr10144921wrw.319.1583415526344; 
 Thu, 05 Mar 2020 05:38:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvBNWs60kENM6S7JQjqmsyt/pT6TR6QT07quSc2AnrK3APygqd2E0Nh4XgSMB6EbXWWc27W3Q==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr10144893wrw.319.1583415526083; 
 Thu, 05 Mar 2020 05:38:46 -0800 (PST)
Received: from steredhat (host34-204-dynamic.43-79-r.retail.telecomitalia.it.
 [79.43.204.34])
 by smtp.gmail.com with ESMTPSA id h20sm23748217wrc.47.2020.03.05.05.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:38:45 -0800 (PST)
Date: Thu, 5 Mar 2020 14:38:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 1/9] hw/audio/fmopl: Fix a typo twice
Message-ID: <20200305133842.sjalzixcx5j5qimw@steredhat>
References: <20200305124525.14555-1-philmd@redhat.com>
 <20200305124525.14555-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200305124525.14555-2-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 05 Mar 2020 13:38:55 -0000

On Thu, Mar 05, 2020 at 01:45:17PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/audio/fmopl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index 9f50a89b4a..173a7521f2 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -1066,7 +1066,7 @@ static void OPLResetChip(FM_OPL *OPL)
>  =09}
>  }
> =20
> -/* ----------  Create one of vietual YM3812 ----------       */
> +/* ----------  Create one of virtual YM3812 ----------       */
>  /* 'rate'  is sampling rate and 'bufsiz' is the size of the  */
                               ^
If you need to respin, what do you think about removing also "and 'bufsiz' =
is
the size of the"?

With or without:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>  FM_OPL *OPLCreate(int clock, int rate)
>  {
> @@ -1115,7 +1115,7 @@ FM_OPL *OPLCreate(int clock, int rate)
>  =09return OPL;
>  }
> =20
> -/* ----------  Destroy one of vietual YM3812 ----------       */
> +/* ----------  Destroy one of virtual YM3812 ----------       */
>  void OPLDestroy(FM_OPL *OPL)
>  {
>  #ifdef OPL_OUTPUT_LOG
> --=20
> 2.21.1
>=20


