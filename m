Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iURtE-0003Go-MK
	for mharc-qemu-trivial@gnu.org; Tue, 12 Nov 2019 03:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iURtA-0003DM-KP
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iURt9-0007XN-HF
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:51:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iURt9-0007Vv-Dl
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573548662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/RvMuKipRpPpiNkOqI72IfHT9GibEFu55jXd29JQOY=;
 b=TaRh7vFzjf0w5Z4JuaZWJWYLDGwygBAPXsLdKd/yeFjD24sHWXr+fWSt4Kb6fcp9N8H7iA
 ucPPnc4JlV7Td3U8nVcV3fezpbG31zQjdVHu9GwR55WspzquwaXbFgWEVAwpm2DSWgsVBx
 8L1zoM8Kc+u5w+ysghsLWzV66Ot4MeA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-3JpSZ54IPxucrPDTTHbTSA-1; Tue, 12 Nov 2019 03:50:59 -0500
Received: by mail-wm1-f71.google.com with SMTP id h191so1135153wme.5
 for <qemu-trivial@nongnu.org>; Tue, 12 Nov 2019 00:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JXq5q5nipawCI6hrIPeaH4pQMRhVGB8dTJVEqmrsRYE=;
 b=hIVJLQvAtY1qbsZ35GFDWY0giOccAwxc80onYbfyd7X3Y6T+i4hSXmnjH0zh2QISNK
 Jk8lmbhKav5U092fvR9Vwz36zOYYKMyiIvNBHXPWsHv/KNB3haAwekRqPyyRbb2yTHRo
 2tcx5FhxWb0/pSU68SmXtK1czAp4iOLn5SMl8upTGwd/hvzKUuQXuF5ds4fiFIXI3ISo
 UNTHltChs1co+vmtrerzj/3uFKaR/z1qUG9lL4rqwvQtsGvFOUe0N++BTr0LdKnLcgsQ
 ytcL/jWOs7JFKlDHyLouoSDmOgiilBWzXnmfk72ZUdNoLPTzKrNA0QX9c75SsGqgAJhE
 pFEQ==
X-Gm-Message-State: APjAAAXpjd2JKQXwIT2HJNIboDh6LE5DQaREb+CI8UxRS+ort7L4sbNS
 GfZfNenYd9xgXQJOd0HCwWoR6awjm88yNHp+uRCoQeAc2iHj3MAHsFlh1PLBviixYklinLObV2J
 vBIGjRmoAZRvpDwJNTA==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr1644063wro.322.1573548658373; 
 Tue, 12 Nov 2019 00:50:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxS1IVHMm1VruqXL8hXZMOrISjiUfKhM3IH0wzeKV2tZkk1z6S1mIn/QCoZ7tlL2NCF5jBKaQ==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr1644031wro.322.1573548658011; 
 Tue, 12 Nov 2019 00:50:58 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id u18sm11182611wrp.14.2019.11.12.00.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 00:50:57 -0800 (PST)
Date: Tue, 12 Nov 2019 09:50:55 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] scripts: Detect git worktrees for get_maintainer.pl
 --git
Message-ID: <20191112085055.2ghx2g2kshtfl6hv@steredhat>
References: <20191112034532.69079-1-aik@ozlabs.ru>
MIME-Version: 1.0
In-Reply-To: <20191112034532.69079-1-aik@ozlabs.ru>
X-MC-Unique: 3JpSZ54IPxucrPDTTHbTSA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Tue, 12 Nov 2019 08:51:06 -0000

On Tue, Nov 12, 2019 at 02:45:32PM +1100, Alexey Kardashevskiy wrote:
> Recent git versions support worktrees where .git is not a directory but
> a file with a path to the .git repository; however the get_maintainer.pl
> script only recognises the .git directory, let's fix it.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  scripts/get_maintainer.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano


> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 71415e3c7061..27991eb1cfb4 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -81,7 +81,7 @@ my %VCS_cmds;
> =20
>  my %VCS_cmds_git =3D (
>      "execute_cmd" =3D> \&git_execute_cmd,
> -    "available" =3D> '(which("git") ne "") && (-d ".git")',
> +    "available" =3D> '(which("git") ne "") && (-e ".git")',
>      "find_signers_cmd" =3D>
>  =09"git log --no-color --follow --since=3D\$email_git_since " .
>  =09    '--format=3D"GitCommit: %H%n' .
> --=20
> 2.17.1
>=20
>=20

--=20


