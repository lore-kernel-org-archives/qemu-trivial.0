Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q2Y4o-0000kZ-PD
	for mharc-qemu-trivial@gnu.org; Fri, 26 May 2023 10:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1q2Su6-0006os-SV
 for qemu-trivial@nongnu.org; Fri, 26 May 2023 04:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1q2Su5-0001es-7d
 for qemu-trivial@nongnu.org; Fri, 26 May 2023 04:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685090067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sve2om7RrKpcKyHvI7A5VBcW1R9KNZiUj/Q3JKV1QvM=;
 b=iZBzXNifrKjxRRViuU08sSKdbuF9ythi8tEyGO6REH8YWwDYYOodyI+21vxfg4hsksLFg+
 eK0h1bjnq00WtdSvDXTwpUwNr4GJD1BvvNAe6+qpU38TYPRxeqERyWa3pQQ2/L3eh4Y89b
 b9qQO+ZJXO0pwAHsUt6KtBC0HzcaX8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-IRA_RptiMsmxscyNNGYQKQ-1; Fri, 26 May 2023 04:34:25 -0400
X-MC-Unique: IRA_RptiMsmxscyNNGYQKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BB2D101A53B;
 Fri, 26 May 2023 08:34:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FEB9492B0A;
 Fri, 26 May 2023 08:34:24 +0000 (UTC)
Date: Fri, 26 May 2023 10:35:46 +0200
From: Sergio Lopez <slp@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 2/4] hw/i386/microvm: Simplify using object_dynamic_cast()
Message-ID: <mcmo5r4cc6bqqv34d37s6q2h6sed3kreqfnqirmhva5mqdropj@m5lugtszgtwy>
References: <20230523061207.48818-1-philmd@linaro.org>
 <20230523061207.48818-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3izuds56ow3gees7"
Content-Disposition: inline
In-Reply-To: <20230523061207.48818-3-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 May 2023 10:05:52 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 May 2023 08:34:31 -0000


--3izuds56ow3gees7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 08:12:05AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use object_dynamic_cast() to determine if 'dev' is a TYPE_VIRTIO_MMIO.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> ---
>  hw/i386/microvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--3izuds56ow3gees7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmRwb18ACgkQ9GknjS8M
AjVDyw//fo6ScodOM4wvuFPR98KovH9kkzHDysA0v6PMX5ZpJy7ObCfX33F1ItfE
M5ouDIhS4WvTMyezdcXpQ3Dz3Ii2xUbgav0PmJZeFJESsIMhBZy9i6Vz0PKTxfhB
tnZDLKLBUazzjyyv6I6aa+9B6Yr+lQHNYPGZfLgikPDcy+f86Njv8tQ01iMHpNmk
FtEMY9GfS0ZkzKK2gSuGw2SvnVNe/rZYQmuCLy6vbZ94TAxVITH/EHiCgkUM07jO
5zT63Zd4n/R5h2sPhkg1k2Wxek/rQE08h/6bkS7HxVr2rG8cSU69/KgUl8//T+db
a5d+N26FRNWqLe7tHezwotO2orJ2PQkGhVk2ASV3QqQMbLGAmHo2VHGgEYeJ8yb2
Opnrraicfs0bo4pCPJt4VsCmUDIiCUzV78t/dMfvHVuCisT98mOFXtCTZ7Afhzxj
8Xkz4+mSAvEkMbVHCs6gow3nA0sxI0pc/tJ5XyIY1Y3gJBTIGh5vAZFk+4ag8ba/
h7kGrVWpPhxaayAqW99sPk+CfDqf/CkQkjy733uaoCANeYoKRNTycdrFYyKzmyOB
rio0MYXObj1T5FSEAHcYZLyvXQHjBsyyN2KM80w6r8ee4Ebcv7MvxJ0VNmmYjqxC
AcLVHooB78eoO2vJnnASUSZp1YuzKBs1lZR3APMuk1XzEgH4XVQ=
=JZNu
-----END PGP SIGNATURE-----

--3izuds56ow3gees7--


