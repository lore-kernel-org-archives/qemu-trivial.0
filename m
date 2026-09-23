Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28667C98302
	for <qemu-trivial@archiver.kernel.org>; Wed, 23 Sep 2026 06:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x9GQX-0000wv-Gr; Wed, 23 Sep 2026 02:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1x9GQW-0000wO-5S
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 02:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1x9GQT-0001XK-JT
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 02:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790144751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6+F4+jUQoClXz48M732OtJ/zHWlIztkbGrIr7jsg7Q=;
 b=YppGB4SxZsNfazm9jJnulIlJVt7zX2j8jrjn+ybrILyetjExs5I5GUtT0gZSdobDBEdBi6
 CIejcNZkBctz2ZIC//nradv1MXdlG6h3kIkzPao49KTEh/rHfzVmf8pKCibsLDo4/lRqNx
 I+qK+f5AjATkadxvvYpz1xwXqN/Nz/o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-ajqx_LPgN1GDDogCIJ-BHQ-1; Wed,
 23 Sep 2026 02:25:45 -0400
X-MC-Unique: ajqx_LPgN1GDDogCIJ-BHQ-1
X-Mimecast-MFC-AGG-ID: ajqx_LPgN1GDDogCIJ-BHQ_1790144744
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2114A180130E; Wed, 23 Sep 2026 06:25:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 20B7318002B7; Wed, 23 Sep 2026 06:25:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AACC721E6A04; Wed, 23 Sep 2026 08:25:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Kostiantyn
 Kostiuk <kkostiuk@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>,  Michael Roth <michael.roth@amd.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Jason Wang <jasowangio@gmail.com>,
 qemu-trivial@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Stefano Garzarella <sgarzare@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v2 5/8] qapi: split intros at natural cutoff points for
 qga/qapi-schema.json
In-Reply-To: <20260922205605.501602-6-jsnow@redhat.com> (John Snow's message
 of "Tue, 22 Sep 2026 16:56:02 -0400")
References: <20260922205605.501602-1-jsnow@redhat.com>
 <20260922205605.501602-6-jsnow@redhat.com>
Date: Wed, 23 Sep 2026 08:25:40 +0200
Message-ID: <87h5jgzdp7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: prBJ9DdS3qOCvMVhLVfwZt1jrJeLNA3IWqAqElehhmk_1790144744
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

John Snow <jsnow@redhat.com> writes:

> Note that these intro conversions introduce a new intro/details split
> point. This new split point may or may not change the rendered output
> depending on if any documentation is auto-generated and inserted for
> this definition.
>
> This has tangible effects on how @guest-fsfreeze-status documentation
> is rendered, while the other two appear unchanged.

Doesn't say how it changes, and it's not visible in the patch.  Suggest

  How @guest-fsfreeze-status documentation is rendered improves
  slightly: "Note:" moves from above "Return" to below.  The other
  conversions don't change rendered documentation.

>
> Signed-off-by: John Snow <jsnow@redhat.com>


