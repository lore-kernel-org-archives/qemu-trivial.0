Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJIa9-00034V-FX
	for mharc-qemu-trivial@gnu.org; Mon, 08 Mar 2021 11:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIa4-00032D-Fq
 for qemu-trivial@nongnu.org; Mon, 08 Mar 2021 11:18:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIa2-00008c-Je
 for qemu-trivial@nongnu.org; Mon, 08 Mar 2021 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615220281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27FLt98suhgdTcsgCqCuM4B9NABcBHC0ApsTxKJupRw=;
 b=HLuOfXRvQmuzqkGEoKT6F/71sFtMG23iLxl3DC0icK+Sg8tdj8BwjfM4zq4p6Rk7VSOc+T
 eXqPmRz6B1lNZ0qrt0x7O7PTRUv0XxmRuNSVAJQO8/YnRf4StOOv4KcbFDZ9gQhOU0xcQb
 NhR7TGO1GmY/0wU6mQEiucZX4MdP9I8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-D9gcAGTAOGSbdtH7kLg68A-1; Mon, 08 Mar 2021 11:17:57 -0500
X-MC-Unique: D9gcAGTAOGSbdtH7kLg68A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409A3817471;
 Mon,  8 Mar 2021 16:17:56 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 262A560C4A;
 Mon,  8 Mar 2021 16:17:48 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:17:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 2/5] scripts/tracetool: Replace the word 'whitelist'
Message-ID: <YEZOJ5qT2uMSocsq@stefanha-x1.localdomain>
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+WEDDJ+ilCoVMlUx"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Mar 2021 16:18:05 -0000

--+WEDDJ+ilCoVMlUx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 07:46:41PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
>=20
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.m=
d
>=20
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  scripts/tracetool/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+WEDDJ+ilCoVMlUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGTicACgkQnKSrs4Gr
c8hGtQf+MfJfpFvLXQqT4pCcHfju8wovU4ynqWRs6FWQiv3qR0SbnRtXq4rw5RuM
HK1Oa4AiaxQyin74RaU4CIKXCm9T1WFjwNWwa+IXJFfsAgm7iZ0X8erhN56L9Hr3
LFEzfWT7Czvi7xwAkt6lk5ERtoFVjJGBRJSzoI+4KsH1VEG+Bk3nsbUNAIkiJXKh
LRF/dS6m90DmCFVAxb6CZuSgaTI5ziX0J2kunXYwTzyctuicmyJx2YdTW1eLfspa
+ECGdMOAYTgeulQZUoO7M02s+wERr27/dZXTEYVk1PcsvJb9WjJKEcLJFcP4mOPH
fyLzJmzuDKu67/FK5w+5pgizQhCvfQ==
=70yb
-----END PGP SIGNATURE-----

--+WEDDJ+ilCoVMlUx--


