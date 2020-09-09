Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFzB7-0001cY-K7
	for mharc-qemu-trivial@gnu.org; Wed, 09 Sep 2020 08:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzB5-0001bQ-KD
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 08:26:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21933
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzB3-0005pp-Vg
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 08:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599654377;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSqRgAV0ehH8hUHy4AlNfCU3TiaNCo+3taKI8hLOfq0=;
 b=eNZYC/KeYc6KsRygXWmTb/f/h/HFvZC5fWI+1wZwWEBM65ILgAext6+qIFJlGUkb7QfdNu
 +4C4t34g6XjADb/4q/SVo/bmFOTxEy1XKV5ytMsqifVfnvY4vEH7h2zSJTFXQ35l14Ej2L
 vdJ40DyUW/mrklcx/xrhxU2lW5V0qfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-UEO9klbBNi6mU4P0TjdhmA-1; Wed, 09 Sep 2020 08:23:44 -0400
X-MC-Unique: UEO9klbBNi6mU4P0TjdhmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED321007293;
 Wed,  9 Sep 2020 12:23:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 497D38246E;
 Wed,  9 Sep 2020 12:23:42 +0000 (UTC)
Date: Wed, 9 Sep 2020 13:23:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] tests: Fixes building test-util-filemonitor.c on
 msys2/mingw
Message-ID: <20200909122339.GR1011023@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200905203425.1470-1-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200905203425.1470-1-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 09 Sep 2020 12:26:19 -0000

On Sun, Sep 06, 2020 at 04:34:25AM +0800, Yonggang Luo wrote:
> Fixes the following compiling error:
> ../tests/test-util-filemonitor.c: In function 'test_file_monitor_events':
> ../tests/test-util-filemonitor.c:620:17: error: too many arguments to function 'mkdir'
>   620 |             if (mkdir(pathsrc, 0700) < 0) {
>       |                 ^~~~~
> In file included from C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/unistd.h:10,
>                  from C:/work/xemu/qemu/include/qemu/osdep.h:93,
>                  from ../tests/test-util-filemonitor.c:21:
> C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/io.h:282:15: note: declared here
>   282 |   int __cdecl mkdir (const char *) __MINGW_ATTRIB_DEPRECATED_MSVC2005;
>       |               ^~~~~
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  tests/test-util-filemonitor.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


