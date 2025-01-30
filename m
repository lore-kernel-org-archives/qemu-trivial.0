Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdU8N-0001l2-4x
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 07:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tdU8L-0001kI-F4
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 07:59:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tdU8J-0005qn-UT
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 07:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738241938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QMIJmEy25hnd8Rb0FyXTd9BfZsXdSt+6dIHFsKIq5Gw=;
 b=eRKgCbqs+TeATnLaSXOAKZmJQOv8TDwTvrlu+yrYB+MAen8jlpb3ykcsNFCl0p0k0/fjI4
 kRsDDAlSyeSILltHcZMza8VEuMOBUTcCbjFpGiiOBoAWJynqdCO4oPcM3LhByYT0r4i/D+
 wjSYJ9/UjXE8aRFC5htipW36HQxbX5s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-y_7PvVz9Ovybd2CQj8ybvA-1; Thu,
 30 Jan 2025 07:58:55 -0500
X-MC-Unique: y_7PvVz9Ovybd2CQj8ybvA-1
X-Mimecast-MFC-AGG-ID: y_7PvVz9Ovybd2CQj8ybvA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B048F1956083; Thu, 30 Jan 2025 12:58:53 +0000 (UTC)
Received: from localhost (unknown [10.2.16.33])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 26C8B18008C8; Thu, 30 Jan 2025 12:58:50 +0000 (UTC)
Date: Thu, 30 Jan 2025 07:58:50 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] overall: Remove unnecessary g_strdup_printf() calls
Message-ID: <20250130125850.GA212825@fedora>
References: <20250130105743.1355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LKDsY9poPnfzWlMH"
Content-Disposition: inline
In-Reply-To: <20250130105743.1355-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 30 Jan 2025 12:59:01 -0000


--LKDsY9poPnfzWlMH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 11:57:43AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Replace g_strdup_printf("%s", value) -> g_strdup(value)
> to avoid unnecessary string formatting.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> ---
>  crypto/hash-afalg.c | 2 +-
>  hw/ppc/spapr_caps.c | 2 +-
>  plugins/loader.c    | 2 +-
>  target/i386/cpu.c   | 2 +-
>  trace/simple.c      | 2 +-
>  ui/console.c        | 4 +---
>  ui/gtk.c            | 3 +--
>  util/module.c       | 2 +-
>  8 files changed, 8 insertions(+), 11 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LKDsY9poPnfzWlMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmebd4kACgkQnKSrs4Gr
c8hq2AgAn34wJG4WgjJPg0YAl8+JxfXLwK4TknpyYYF9xeqVldDqsJG9FFgy7wI1
+lWgPzbqCSHA09oophlE9yqgISagfq7kvN6fpEB+EtlKtB/voV7Gi2LyqXT/UYzR
+r2VBcywk/nKrLu22ulQ0GVG7vR0JuVAhEI+J/2YiHiR/PDwCsNQNl+txI/2gp88
RMpZSIig6dmrRFEU4BSlj4VJCphmgn3wM2fCAfM5EH7VxqQCrgqoQIo0KgB0uH6Z
bdO7HZdg5E489+JZV7s4gXzCivua4hmwRwpQD2McuM+JBRezweq/HoeTyQlOCo1Z
7GQurB9XG2fy2J0AMCwEfeZK0Wqqog==
=arh6
-----END PGP SIGNATURE-----

--LKDsY9poPnfzWlMH--


