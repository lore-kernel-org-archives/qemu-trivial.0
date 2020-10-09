Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQsen-00030U-0h
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2020 09:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQsel-0002yU-Q7
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 09:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQsej-0000rm-4k
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 09:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602250915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4870C/Yw8QYX4iOA712GslH8ICQW7umTbgnJLvu60O8=;
 b=UVJrpw9nX6GX01qyFls1kVuj5cnihIveKfrr4+kxaft3ZBqYxb7yE7ykFtoNc2j13mxhOt
 HZRhK8GeKRuAt0VKnoRfEf6vMkdrK9aDDYzroKOlbfSO+PfTHf1lgZ1wGZfWbCE2OkHaij
 jSzOOKwcZ5iJzmf5uOagjGjbtaNKE8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-JXuaPCYdNIeOTf0plgRMBQ-1; Fri, 09 Oct 2020 09:41:54 -0400
X-MC-Unique: JXuaPCYdNIeOTf0plgRMBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A38879519;
 Fri,  9 Oct 2020 13:41:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-251.ams2.redhat.com [10.36.114.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 814D65C1C7;
 Fri,  9 Oct 2020 13:41:51 +0000 (UTC)
Date: Fri, 9 Oct 2020 14:41:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chetan Pant <chetan4windows@gmail.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] Fixing Lesser GPL version number [1/5]
Message-ID: <20201009134148.GB25901@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201009063734.2627-1-chetan4windows@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201009063734.2627-1-chetan4windows@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
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
X-List-Received-Date: Fri, 09 Oct 2020 13:42:00 -0000

On Fri, Oct 09, 2020 at 06:37:34AM +0000, Chetan Pant wrote:

I'll take the following if you can split them up into a couple of
patches

> ---
>  authz/base.c                               | 2 +-
>  authz/list.c                               | 2 +-
>  authz/listfile.c                           | 2 +-
>  authz/pamacct.c                            | 2 +-
>  authz/simple.c                             | 2 +-

Split these into an "authz" patch.


>  block/crypto.c                             | 2 +-
>  block/crypto.h                             | 2 +-

Split these two into a "crypto" patch.



>  tests/io-channel-helpers.c                 | 2 +-
>  tests/io-channel-helpers.h                 | 2 +-

Split these into an "io" patch.

Also combine with the io/* cleanups in patch 2, and the
tests/test-io-* cleanups later.

>  tests/migration/guestperf-batch.py         | 2 +-
>  tests/migration/guestperf-plot.py          | 2 +-
>  tests/migration/guestperf.py               | 2 +-
>  tests/migration/guestperf/comparison.py    | 2 +-
>  tests/migration/guestperf/engine.py        | 2 +-
>  tests/migration/guestperf/hardware.py      | 2 +-
>  tests/migration/guestperf/plot.py          | 2 +-
>  tests/migration/guestperf/progress.py      | 2 +-
>  tests/migration/guestperf/report.py        | 2 +-
>  tests/migration/guestperf/scenario.py      | 2 +-
>  tests/migration/guestperf/shell.py         | 2 +-
>  tests/migration/guestperf/timings.py       | 2 +-
>  tests/migration/stress.c                   | 2 +-

Split these.

>  tests/test-authz-list.c                    | 2 +-
>  tests/test-authz-listfile.c                | 2 +-
>  tests/test-authz-pam.c                     | 2 +-
>  tests/test-authz-simple.c                  | 2 +-

Include in "authz" patch.

>  tests/test-crypto-afsplit.c                | 2 +-
>  tests/test-crypto-block.c                  | 2 +-
>  tests/test-crypto-cipher.c                 | 2 +-
>  tests/test-crypto-hash.c                   | 2 +-
>  tests/test-crypto-ivgen.c                  | 2 +-
>  tests/test-crypto-secret.c                 | 2 +-
>  tests/test-crypto-xts.c                    | 2 +-

SPlit into a "crypto" patch

>  tests/test-io-channel-buffer.c             | 2 +-
>  tests/test-io-channel-command.c            | 2 +-
>  tests/test-io-channel-file.c               | 2 +-
>  tests/test-io-channel-socket.c             | 2 +-
>  tests/test-io-task.c                       | 2 +-

Include in an "io" patch


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


