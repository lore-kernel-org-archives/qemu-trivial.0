Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ4pp-0000Yi-7I
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 04:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQ4pn-0000XO-SY
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 04:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQ4pm-0000u4-57
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 04:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602059401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xJvWVSBojrU+JxbQ9cfafTRQDAWon1AhlTTOBiFFfYk=;
 b=WeogHaBWIAsqhNmkqrjJeFc0elL2FbhQnxsJAjMJ10UHy00ZmVkCWyZko0baxrBruwffcv
 RyC1mz6QvPEjGHucueVNf0wyhtJNwCI1SCiEH/Ivd56vmuSnkEGh23LGoXgla3a2liO/N+
 07V1+eDhpNddesTQXvpzshTzNS9WUL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-s8g159XDPQSlutRZaTHKkw-1; Wed, 07 Oct 2020 04:29:57 -0400
X-MC-Unique: s8g159XDPQSlutRZaTHKkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69577801FDB;
 Wed,  7 Oct 2020 08:29:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-68.ams2.redhat.com [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586F878800;
 Wed,  7 Oct 2020 08:29:54 +0000 (UTC)
Date: Wed, 7 Oct 2020 09:29:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] cirrus: Fixing and speedup the msys2/mingw CI
Message-ID: <20201007082951.GE2505881@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201007024135.1885-1-luoyonggang@gmail.com>
 <20201007024135.1885-3-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201007024135.1885-3-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 07 Oct 2020 08:30:04 -0000

These kind of changes are not appropriate for QEMU trivial.

On Wed, Oct 07, 2020 at 10:41:35AM +0800, Yonggang Luo wrote:
> Using a prepared https://github.com/lygstate/qemu/releases/download/v5.1.0/msys2-x86_64.tar.xz
> for speed up the msys2/mingw prepare speed on the cirrus CI.

I appreciate the desire to speed up CI, but relying on the contents of
a arbitrary blob provided by a user as the build environment is not
satisfatory for QEMU's CI.  The project has no visibility, control
or tracking over what is in that blob.

Any caches need to be managed by the CI system, and populated by
the defined CI job logic.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


