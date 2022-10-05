Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1og5Aj-0000ZH-MT
	for mharc-qemu-trivial@gnu.org; Wed, 05 Oct 2022 10:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5Ae-0000Re-Et
 for qemu-trivial@nongnu.org; Wed, 05 Oct 2022 10:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5Aa-0006fT-Jg
 for qemu-trivial@nongnu.org; Wed, 05 Oct 2022 10:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664979284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1xp3m0B3raXTA2Ul7qlJxxgpFD8rAJ0UOTbRFN1h7k=;
 b=QQN+FYHOTon7NFh7Cbikh22LPqrFh12AbF7LubRi6hC0mIKeR0UVrTA50vTDs8zSwa3W+E
 GmN+jXJD5n/35rnRaMG22ivto6WUqKsdnMgnA7UssRHZZStQCqhg7m03uWRHLLEt4yTipr
 o6/Ukj6i3gfInfbdiXff+8fOUFjR0Ow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-LWIeERb0PaCxmAz2_a17VA-1; Wed, 05 Oct 2022 10:14:40 -0400
X-MC-Unique: LWIeERb0PaCxmAz2_a17VA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C5D29DD9A5;
 Wed,  5 Oct 2022 14:14:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB94B483EFB;
 Wed,  5 Oct 2022 14:14:39 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:14:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/8] Trivial branch for 7.2 patches
Message-ID: <Yz2RTkfl45oU59xp@fedora>
References: <20221003221345.1324140-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KbIwE7KlM2J+t8dv"
Content-Disposition: inline
In-Reply-To: <20221003221345.1324140-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 05 Oct 2022 14:14:49 -0000


--KbIwE7KlM2J+t8dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--KbIwE7KlM2J+t8dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9kU4ACgkQnKSrs4Gr
c8icnwf/XuiY4oAGo2fthpGBrfsAJpJGZJ0uJrOVz9jjbcuqEmxSQfb5shKyezEb
3Glj4slky9tkK3RzeItXNXev8NIpU2icrGTbLyLwB+fjDnVuL3vfG4lBXHZiw6cf
82yjhhyn7jnn20Jv1IrOXn/IhBe6FKattkpblcWHMtuvKO+aoZUrW5bTOZnuxYwd
g8yyhyVcrDgRmNMoxLQ74uU74Z+8+y5h9X8o2D5kGsepNFUmyH8YOkPQHALMt5xy
aU4q5PEX/TnjTxU1yyzPdfYK7FGcLXfIE1GZfadbTvIaB7hpf03tfGrygqJ+5Gl7
9zmRp8y0L10o3naEf0A3AMl6xb4nMw==
=gmhX
-----END PGP SIGNATURE-----

--KbIwE7KlM2J+t8dv--


