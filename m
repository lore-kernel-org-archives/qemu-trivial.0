Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C3FC531C9
	for <qemu-trivial@archiver.kernel.org>; Fri, 24 Jul 2026 15:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wnHS2-00034j-Cf; Fri, 24 Jul 2026 11:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1wnHS1-00034R-Pb
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2026 11:04:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1wnHS0-0004Xp-Bx
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2026 11:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784905475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46ZsIDYt34E16W0A/VGT43344+q1awSOG22i+8Vq8GY=;
 b=cKYQA2lsfIQ6DcLHgX0bvZL/nqRGl+aAiLIbCZMFfLpxJ1kBluhSUIdieYcPzBO/f6KIJR
 cPCDKDiwkJGAsV+uLGFLkF7yO0gIV9kKZVUG6HBZ3ci3efygV9Rwwd2N6NSyFAC7Re8TAA
 tiCfLBwXlIgWc8kXPTAEiVLOZUU7U0g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-OOIjyxtONLWsfbBNF62Sgw-1; Fri,
 24 Jul 2026 11:04:31 -0400
X-MC-Unique: OOIjyxtONLWsfbBNF62Sgw-1
X-Mimecast-MFC-AGG-ID: OOIjyxtONLWsfbBNF62Sgw_1784905470
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7B7E71843FAF; Fri, 24 Jul 2026 15:04:30 +0000 (UTC)
Received: from localhost (unknown [10.2.16.94])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CEFCC1956063; Fri, 24 Jul 2026 15:04:29 +0000 (UTC)
Date: Fri, 24 Jul 2026 11:04:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org
Subject: Re: [PULL 0/7] Trivial patches for 2026-07-24
Message-ID: <20260724150410.GA77283@fedora>
References: <20260724094754.1053970-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IzdCyQlWqh48+vy2"
Content-Disposition: inline
In-Reply-To: <20260724094754.1053970-1-mjt@tls.msk.ru>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.419,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

--IzdCyQlWqh48+vy2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.1 for any user-visible changes.

--IzdCyQlWqh48+vy2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmpjfuoACgkQnKSrs4Gr
c8hhPgf+NyE0HB43Ln3PEg4p18sWARtTfAEnj61x8KQPRUNeM18RWba3m7NbV1Y1
4NE/SCD53qp7YE48yKhNoGq5ro8C/0dsCQl2WM3S2FFw7XP6g61KkOVGfORF6uCN
Xzdy0CHhl8zN8A48s0KuHTxjUJAokEoHPiMWI58CJJLrTMuzUqTECsMB5u9/p/bo
IuwdYRMakXEqwB8mWRBba64xD5lLUSIeVTcmSdlFkbRd2gt6K79BuLber/nr83FV
5fgqUPlXzVlh9uupMhBJJNLPk5j61N8mI5mq4ayq4YZffuJX2VQAqe22skQC3HD7
IvkJcV3BeqP+psTGF5af6XXVxcBs5Q==
=hezR
-----END PGP SIGNATURE-----

--IzdCyQlWqh48+vy2--


