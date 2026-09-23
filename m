Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59E5C982EA
	for <qemu-trivial@archiver.kernel.org>; Wed, 23 Sep 2026 06:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x9Glj-0005mF-OS; Wed, 23 Sep 2026 02:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1x9Glh-0005lo-NS
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 02:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1x9Glg-0003k0-Bf
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 02:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790146066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWov/L9cslgVOMVieEo1JHzJMx3Y0tpPX0cMoNd9lWk=;
 b=N1tEHYIyAvIpLVeWAVzYnzZHKc04WuILkDizjzKRbwNCxWYM1ezrzlbMpLkPWO/X7EQhLi
 +1jYvIKtGmbf+oh1k56VfSAwfmcmY5Nf8UOfrokrN/IS1QyszyCPFaM1I25qB1BRoXwVNS
 KmPjjWRL3tkvXWe711dbydcaf9hbQmA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-c72J0fhSMjK9zJ9WwCOCsg-1; Wed,
 23 Sep 2026 02:47:42 -0400
X-MC-Unique: c72J0fhSMjK9zJ9WwCOCsg-1
X-Mimecast-MFC-AGG-ID: c72J0fhSMjK9zJ9WwCOCsg_1790146061
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D9945195605B; Wed, 23 Sep 2026 06:47:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 349FA18005B8; Wed, 23 Sep 2026 06:47:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D547B21E6A04; Wed, 23 Sep 2026 08:47:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Kashyap Chamarthy
 <kchamart@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,  Michael Tokarev <mjt@tls.msk.ru>,  Hanna
 Reitz <hreitz@redhat.com>,  Stefano Garzarella <sgarzare@redhat.com>,
 Jason Wang <jasowangio@gmail.com>,  Zhao Liu <zhao1.liu@intel.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?= <philmd@oss.qualcomm.com>,  qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Pierrick
 Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] qapi: convert simple intros for qga/qapi-schema.json
In-Reply-To: <20260921205147.1857168-5-jsnow@redhat.com> (John Snow's message
 of "Mon, 21 Sep 2026 16:51:42 -0400")
References: <20260921205147.1857168-1-jsnow@redhat.com>
 <20260921205147.1857168-5-jsnow@redhat.com>
Date: Wed, 23 Sep 2026 08:47:37 +0200
Message-ID: <87ld8sxy46.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: DESIG2HTxqpAfYZG8PirAGzy26s-F-DG0rp9TdJ7yos_1790146061
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

> These are all single-paragraph introductions immediately followed by a
> non-plaintext section, so no new insertion point is created by this
> conversion.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qga/qapi-schema.json | 40 ++++++++++++++++++----------------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 90110af5730..b592b14a011 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -205,9 +205,9 @@
>  
>  ##
>  # @guest-shutdown:
> -#
> -# Initiate guest-activated shutdown.  Note: this is an asynchronous
> -# shutdown request, with no guarantee of successful shutdown.
> +#     Initiate guest-activated shutdown.  Note: this is an
> +#     asynchronous shutdown request, with no guarantee of successful
> +#     shutdown.

Taking note of future work:

10. Review doc where the intro contains (variations of) "Note:".

>  #
>  # @mode: "halt", "powerdown" (default), or "reboot"
>  #
> @@ -266,10 +266,10 @@
>  
>  ##
>  # @guest-file-read:
> -#
> -# Read from an open file in the guest.  Data will be base64-encoded.
> -# As this command is just for limited, ad-hoc debugging, such as log
> -# file access, the number of bytes to read is limited to 48 MB.
> +#     Read from an open file in the guest.  Data will be
> +#     base64-encoded.  As this command is just for limited, ad-hoc
> +#     debugging, such as log file access, the number of bytes to read
> +#     is limited to 48 MB.
>  #
>  # @handle: filehandle returned by `guest-file-open`
>  #
> @@ -357,10 +357,9 @@
>  
>  ##
>  # @guest-file-seek:
> -#
> -# Seek to a position in the file, as with fseek(), and return the
> -# current file position afterward.  Also encapsulates ftell()'s
> -# functionality, with offset=0 and whence=1.
> +#     Seek to a position in the file, as with fseek(), and return the
> +#     current file position afterward.  Also encapsulates ftell()'s
> +#     functionality, with offset=0 and whence=1.

Not this patch's problem, but here goes anyway: numeric @whence values
like 1 are "available for historical reasons", the preferred value is
"cur".

>  #
>  # @handle: filehandle returned by `guest-file-open`
>  #

[...]


