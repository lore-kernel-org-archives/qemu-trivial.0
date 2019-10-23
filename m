Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNEXM-0000Dg-4Y
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 07:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNEXJ-00008z-7G
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 07:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNEXH-0005k6-6D
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 07:10:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNEXF-0005iv-7f
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 07:10:39 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4BE9BB2DC2
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 11:10:36 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j14so10412474wrm.6
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 04:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VRFiJO6Qlu2vaCinOdmr2MBN1mbX17AzbJs78dTUux4=;
 b=WpYV49rfkHZcdnE5Y6aI9qmqyXBO7AOjI2PDha7iO5pWfE62BosHrBh4gC2rcL37fb
 Dz1VoygG96AdRW87qrUGc4bz6RjXZaxvfHuwynCjkbeRPKfOiOId79gROMiFCeZlw1Ju
 syX48nwGaRxwMTcRIC6D3Qm1JuWQZO2tJDJtU7rmp3A4vG5XtoT7LzaqXbcNWvwdv50W
 FiS95kNG8Q/yrZ9U30Df+gQj59QBWcHfbNSs2HFqlQq2Rbz0uiQF5E4fmJ7ZgnSyZQSA
 EgdNSmAp/ffINBB9qOwRMNtFPga3mSEVyIeoGTcgN2cNASSuOuCGpMqLr5NlYUNCwX3s
 c4pA==
X-Gm-Message-State: APjAAAUPjkWrQsoJBYRbdxAy6zOeBDu9YQeDikSlzplhaxsOi5ZiPJ/j
 hvB+jbIwTo5OceNHaRsnimAh+Oi3xBlcV6BwLaSOxjylS4N601HZRZJ6ZRsN/ngUWtmcZmWIXg+
 4FOiABrHRXW2WQTh2FA==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr7915413wrj.268.1571829034558; 
 Wed, 23 Oct 2019 04:10:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwz8T96XwdJfMaaoRIYeAkB00/JTFKTK6RwgASBuSQ/ONnqKz0nZID3fTJg7VhtmJ+/GfZDFw==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr7915404wrj.268.1571829034380; 
 Wed, 23 Oct 2019 04:10:34 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id p17sm18022566wrn.4.2019.10.23.04.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 04:10:33 -0700 (PDT)
Subject: Re: [PATCH] buildfix: update texinfo menu
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191023101956.19120-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d88a6ffb-9a58-51b7-c772-f3e646d3bb5f@redhat.com>
Date: Wed, 23 Oct 2019 13:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023101956.19120-1-kraxel@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 23 Oct 2019 11:10:42 -0000

Cc'ed trivial@

On 10/23/19 12:19 PM, Gerd Hoffmann wrote:
> Build error message:
> qemu-doc.texi:34: node `Top' lacks menu item for `Recently removed feat=
ures' despite being its Up target
>=20
> Fixes: 3264ffced3d0 ("dirty-bitmaps: remove deprecated autoload paramet=
er")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

> ---
>   qemu-doc.texi | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 3c5022050f0f..3ddf5c0a6865 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -44,6 +44,7 @@
>   * Security::
>   * Implementation notes::
>   * Deprecated features::
> +* Recently removed features::
>   * Supported build platforms::
>   * License::
>   * Index::
>=20

