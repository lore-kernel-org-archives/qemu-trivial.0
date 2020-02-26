Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j73B2-0003lm-2B
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 15:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j73Az-0003jD-I0
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 15:21:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j73Ay-00051W-BM
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 15:21:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48468
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j73Ay-0004zU-77
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 15:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582748459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucajfixNPAZHitKtwg3MvaodwjJFnax0QB5I1m2QMVY=;
 b=HHJ2hxgQjG09Hqj82zD8OtJLH+ZGvWz2ZsYqSJycRb10lUbyVsz6NBgwaeyKQaj7hEGS/d
 ChzOwJ/x/AVsggINM1k4+fYHOjopqPVxr62glaTzB31kpZV7jNuQc7OGoLWV4vDkyfxKAZ
 WahCSBUpU5gAnzp9BXy4TVTR/t0Gauk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-zkEbKDdxOTq1Vwj86BHH2Q-1; Wed, 26 Feb 2020 15:20:57 -0500
X-MC-Unique: zkEbKDdxOTq1Vwj86BHH2Q-1
Received: by mail-qt1-f200.google.com with SMTP id c22so276503qtn.23
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 12:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yzwLbxoVf1qt7EqxO7WDwE95pIYCWjl3zAKr5js9Lo0=;
 b=gVVOFVFrHi18ErnKAV/OlpQG8WXLj9aIGNw1LMjCaSgFu1429jB+Oaft+y+hxWyGvQ
 qHjj+2K06Fgfhg/O6ju4vL/AuvlWArsJOhhqKwabcM4HHeIoc4I8/YQmgwWqrVDQKdYD
 sXyjEKod945VuseTmmClSZWvv10AwaDz9A1CgrAiB30LJaoTvsu9pHLU3dTI2Zr94XRU
 NAYp3BqHnAiwRsuz4jE+D6nnysIVY6Oos83q7KVYsJjb409uhuhY4HhmWfPyF4sT7oGd
 aCIOmqen5nCQcHB/IbmTjXUDq6/2POshp4LG2Vz9/o/JZUP/DYXaRPBIv7mnDBSLX9EX
 6tPg==
X-Gm-Message-State: APjAAAWkReksgrrBBtsuNi0DYckOnlbUZYjdjwPsa5UKbZKB8+TXUh/g
 /9AHj9qBkwFqPWYcgGYps9dnn3tXGIv5lKqhnppS93zjU4vBPI+K4GYUrR+W4GA2bSg/isaRqqQ
 uE6y+po8RHm29lFU6bg==
X-Received: by 2002:a05:620a:1f1:: with SMTP id
 x17mr1073084qkn.302.1582748457227; 
 Wed, 26 Feb 2020 12:20:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/DD8IA9fAd8RJRh1YdJxGIyGDxFGS43zTaVutKMQkYnhppZV7xvC19bG+Rpo+oV6ix71giA==
X-Received: by 2002:a05:620a:1f1:: with SMTP id
 x17mr1073044qkn.302.1582748456928; 
 Wed, 26 Feb 2020 12:20:56 -0800 (PST)
Received: from xz-x1 (CPEf81d0fb19163-CMf81d0fb19160.cpe.net.fido.ca.
 [72.137.123.47])
 by smtp.gmail.com with ESMTPSA id 133sm1762022qkh.109.2020.02.26.12.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 12:20:56 -0800 (PST)
Date: Wed, 26 Feb 2020 15:20:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Yi Sun <yi.y.sun@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [PATCH v2] hw/i386/intel_iommu: Simplify
 vtd_find_as_from_bus_num() logic
Message-ID: <20200226202054.GA180973@xz-x1>
References: <20200226201030.22583-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200226201030.22583-1-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 26 Feb 2020 20:21:02 -0000

On Wed, Feb 26, 2020 at 09:10:30PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> The vtd_find_as_from_bus_num() function was introduced (in commit
> dbaabb25f) in a code format that could return an incorrect pointer,
> which was later fixed by commit a2e1cd41ccf.
> We could have avoid this by writing the if() statement differently.
> Do it now, in case this function is re-used. The code is easier to
> review (harder to miss bugs).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Since v2: Re-worded commit description, patch sent without -w.
>=20
> This patch is easier to review with 'git-diff -w' (--ignore-all-space):
>=20
> @@ -987,14 +987,17 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, =
uint32_t level)
>  static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_=
num)
>  {
>      VTDBus *vtd_bus =3D s->vtd_as_by_bus_num[bus_num];
> -    if (!vtd_bus) {
> +    GHashTableIter iter;
> +
> +    if (vtd_bus) {
> +        return vtd_bus;
> +    }
> +
>      /*
>       * Iterate over the registered buses to find the one which
>       * currently hold this bus number, and update the bus_num
>       * lookup table:
>       */
> -        GHashTableIter iter;
> -
>      g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
>      while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
>          if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
> @@ -1002,9 +1005,8 @@ static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUS=
tate *s, uint8_t bus_num)
>              return vtd_bus;
>          }
>      }
> -        vtd_bus =3D NULL;
> -    }
> -    return vtd_bus;
> +
> +    return NULL;
>  }

(However we'll need to read below after all... :)

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


