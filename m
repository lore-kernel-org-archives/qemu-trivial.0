Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUSbp-0005cd-Dp
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUSbo-0005bs-1u
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 06:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUSbm-0000cM-7h
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 06:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603104101;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPvvkGtFAk7jJB28VlhS8s1Gq5q1/zl+n8vmkgrW6U4=;
 b=UuxqME6gUY7UHIfhgCzBGfFqQ2vU1prf7rhm7IGJaEbaFBFWeCB8tDcMbrSoSbpOkTIXKW
 QHD0o/T4/Znrd4zc/J4xdWiLIuapAO02O+C5+Cb3DuvLgzYln4e5i/s9Ne6S3jeFWoXLNH
 GacTaBqaDAzZw4jsujB0xtNE9fdBFGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Bgif6YCCOi66VGgPV36hOw-1; Mon, 19 Oct 2020 06:41:39 -0400
X-MC-Unique: Bgif6YCCOi66VGgPV36hOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 809B0107464A;
 Mon, 19 Oct 2020 10:41:38 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 757375C1A3;
 Mon, 19 Oct 2020 10:41:37 +0000 (UTC)
Date: Mon, 19 Oct 2020 11:41:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chetan Pant <chetan4windows@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/30] crypt: Fix Lesser GPL version number
Message-ID: <20201019104134.GG236912@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201014134248.14146-1-chetan4windows@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Oct 2020 10:41:44 -0000

On Wed, Oct 14, 2020 at 01:42:48PM +0000, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  tests/test-crypto-afsplit.c | 2 +-
>  tests/test-crypto-block.c   | 2 +-
>  tests/test-crypto-cipher.c  | 2 +-
>  tests/test-crypto-hash.c    | 2 +-
>  tests/test-crypto-ivgen.c   | 2 +-
>  tests/test-crypto-secret.c  | 2 +-
>  tests/test-crypto-xts.c     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


