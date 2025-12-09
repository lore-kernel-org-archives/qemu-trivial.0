Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7673AD3B7EA
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Dec 2025 10:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vSvGz-0001pD-3V; Tue, 09 Dec 2025 05:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1vSvGx-0001oE-H0
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 05:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1vSvGw-0008Bx-0g
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 05:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765277325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7yhsqNH2tI6BoXjM3PtLawF1akUkgB71nz4PXlaXpwE=;
 b=H5PTz0YcLJscKGKA2UlrKO3W0zzA5ysNiJUduydn2ef1SFVO8/rRWrhJwvAkpjmdZZUCFt
 NWKh8sJC5kF/828ygku5EpGYg3idQfqVieiQrPCgLJRa4A7Bn5esfssb/ojUdzPluZKlRv
 ZWS7X2lYwjCI36GIR5wRG27oljxK9hc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-fqxJCo9kM3-JZE6IMv5Ahg-1; Tue,
 09 Dec 2025 05:48:41 -0500
X-MC-Unique: fqxJCo9kM3-JZE6IMv5Ahg-1
X-Mimecast-MFC-AGG-ID: fqxJCo9kM3-JZE6IMv5Ahg_1765277320
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62DE51956057; Tue,  9 Dec 2025 10:48:40 +0000 (UTC)
Received: from redhat.com (unknown [10.45.224.109])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE71030001BB; Tue,  9 Dec 2025 10:48:37 +0000 (UTC)
Date: Tue, 9 Dec 2025 11:48:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/qemu-iotests: Fix check for existing file in
 _require_disk_usage()
Message-ID: <aTf-gwwtYo7ULDCc@redhat.com>
References: <20251208075320.35682-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208075320.35682-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 08.12.2025 um 08:53 hat Thomas Huth geschrieben:
> From: Thomas Huth <thuth@redhat.com>
> 
> Looks like the "$" has been forgotten here to get the contents of
> the FILENAME variable.
> 
> Fixes: c49dda7254d ("iotests: Filter out ZFS in several tests")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


