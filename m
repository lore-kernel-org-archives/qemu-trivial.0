Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJrj4-0005mc-Jk
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 00:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJrj3-0005l0-Ak
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 00:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJrj1-0006d5-My
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 00:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615355378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2ZD0CnYYnvpZ4C2tO9qmmgnDsa49RFMqsOiQNWOEPo=;
 b=gmjvFRHQZ83w+AgBwpgLThpR/hVamKNCQ8loX0Dbp5bfnzRfiADm5kcGZiy+xu7Z9MKdhM
 nT3SVCJFQ1wokOHOpjX10E+ObZrKBVGbyR5LQ92xJrdgw8e/wV/bajO+S6bcRB1AsLwSKS
 nQSgupCGtgJmwrJTNsrAO8gy0ZidIbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-Yc1kkCy5M-uYaPQniMZnFw-1; Wed, 10 Mar 2021 00:49:36 -0500
X-MC-Unique: Yc1kkCy5M-uYaPQniMZnFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EFD71898283;
 Wed, 10 Mar 2021 05:49:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C245D5E1A7;
 Wed, 10 Mar 2021 05:49:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3313B1132C12; Wed, 10 Mar 2021 06:49:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [PATCH] docs: Fix removal text of -show-cursor
References: <20210310045821.1004396-1-thuth@redhat.com>
Date: Wed, 10 Mar 2021 06:49:30 +0100
In-Reply-To: <20210310045821.1004396-1-thuth@redhat.com> (Thomas Huth's
 message of "Wed, 10 Mar 2021 05:58:21 +0100")
Message-ID: <87wnufk179.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Wed, 10 Mar 2021 05:49:41 -0000

Thomas Huth <thuth@redhat.com> writes:

> We should say now when it was removed, not when it was deprecated.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/system/removed-features.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index f8db76d0b5..13f9dd3014 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -26,8 +26,8 @@ The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
>  The ``-realtime mlock=on|off`` argument has been replaced by the
>  ``-overcommit mem-lock=on|off`` argument.
>  
> -``-show-cursor`` option (since 5.0)
> -'''''''''''''''''''''''''''''''''''
> +``-show-cursor`` option (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''
>  
>  Use ``-display sdl,show-cursor=on``, ``-display gtk,show-cursor=on``
>  or ``-display default,show-cursor=on`` instead.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


