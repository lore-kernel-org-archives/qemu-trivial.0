Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jo0vQ-0002oV-12
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2020 04:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jo0vO-0002iI-CB
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 04:38:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43310
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jo0vM-0002bz-2q
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 04:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vB0+TGMPvFpsPFAl/NhmlTbqS5r69JrqhbMCAxJyx7I=;
 b=EKQRdFIQJt6STghHlV+83rDfq/bYPdVL0bx2+odV0+Duq9f7QBlA5EW/Wk6NYCCpbUC70b
 lp4EsytI69xG+TUhchdmrTE9YfTHZU6cq0j6VK+0HlFb9pKn12oQ7iizaMApZZ9XgB7i+1
 HeXXBcabWvoFxYiVKAcIprvWL1Okf0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-TNHw6JGcPdeDor-Hxn31yA-1; Wed, 24 Jun 2020 04:38:25 -0400
X-MC-Unique: TNHw6JGcPdeDor-Hxn31yA-1
Received: by mail-wr1-f69.google.com with SMTP id p10so2196651wrn.19
 for <qemu-trivial@nongnu.org>; Wed, 24 Jun 2020 01:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hIFhjT6uyZvlAAekKGA251eEdikZuCrpA9NtomezBN0=;
 b=VOBH6dvJ4pixlGwgVZjWYfGTW000lVkytJSChucPlNqdarDLgplU/cTeuRinKO6mNN
 tPF8n4LYY6iC0lSrs3JNhrDCya0kA3HFu7uZecoD1jdg1USyW8u8P+TKrCJnlagKuMEz
 U3apNyFjgxm8HjW3VInI49vUeDOFv/58RJgaqO5HB2IJuDeDDHY61AMeEDQF08XG7LBy
 wvfxFTky+Ff8jkvhgsDH4tGdlu1QMwTNgX4tu2mtrvW8yvPwY5c61fyUpGnBkpLIY3F0
 Mf62lxT8n9KH8s4I2z3RajiURpYVVbhU6S3I9tdxUi84Kzfg4F4nWZZNsBw0Q+vo9Tco
 FAlw==
X-Gm-Message-State: AOAM531UUkXHI0wAmGh1315/+kk1jtSpW7UX++p2wnm643UAbyckuv2U
 zodQk/rJWIAdLJYxheQZKeX4r2os00IAJE6iSByrfsvNv5vfuvJ/DeX5/sRYKOeLh6EB0yhZvc9
 OTWu4P18PTdWikvdGTQ==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr17041838wrm.193.1592987904314; 
 Wed, 24 Jun 2020 01:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqu5YLR4WmNogiz7GRuotM+N0WgB8Bn92lXTIRcdpURNx5VTGFwz+cjZ+UKL5TJCRuU5MfjA==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr17041808wrm.193.1592987904042; 
 Wed, 24 Jun 2020 01:38:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:466:71c0:918b:168e:d1a7:f3b9?
 ([2a01:e0a:466:71c0:918b:168e:d1a7:f3b9])
 by smtp.gmail.com with ESMTPSA id p17sm6897836wma.47.2020.06.24.01.38.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 01:38:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] trivial: Remove extra character in configure help
From: Christophe de Dinechin <dinechin@redhat.com>
In-Reply-To: <20200624083337.912846-1-dinechin@redhat.com>
Date: Wed, 24 Jun 2020 10:38:21 +0200
Cc: qemu-trivial@nongnu.org,
 GitLab via <qemu-devel@nongnu.org>
Message-Id: <CC0192CB-4A6A-467C-B8A6-E4C418C79A52@redhat.com>
References: <20200624083337.912846-1-dinechin@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Wed, 24 Jun 2020 08:38:30 -0000

Please ignore. The =3DB appears intentional, even if it offsets the whole h=
elp text.

Maybe replace with =3DL to indicate a list is expected?

> On 24 Jun 2020, at 10:33, Christophe de Dinechin <dinechin@redhat.com> wr=
ote:
>=20
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
> configure | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index ba88fd1824..c7a6a5adfe 100755
> --- a/configure
> +++ b/configure
> @@ -1787,7 +1787,7 @@ Advanced options (experts only):
>   --block-drv-ro-whitelist=3DL
>                            set block driver read-only whitelist
>                            (affects only QEMU, not qemu-img)
> -  --enable-trace-backends=3DB Set trace backend
> +  --enable-trace-backends=3D Set trace backend
>                            Available backends: $trace_backend_list
>   --with-trace-file=3DNAME   Full PATH,NAME of file to store traces
>                            Default:trace-<pid>
> --=20
> 2.26.2
>=20
>=20


