Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEpQY-000294-Qq
	for mharc-qemu-trivial@gnu.org; Tue, 01 Feb 2022 04:26:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpQS-00023u-7F
 for qemu-trivial@nongnu.org; Tue, 01 Feb 2022 04:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpQQ-0004RL-G9
 for qemu-trivial@nongnu.org; Tue, 01 Feb 2022 04:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643707569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfL5vTqdakW0303JU2kdrZB3ZkZ2ZKyAPGr7vcyNlWU=;
 b=SrODexXdSMHMZquqsaeaf4poSKPa67VFRrykF6+N62AUXVtHzgsfNy852ucGDIDryTeAw/
 zyfwgII97f7KD+IN5aIp1rDbxVLJZISmYm+2TJuO35RbWOF2/6lwSodHJ9/ygpqzsR2sTS
 3DNP6isvOGduLmIwEviJfpmC6AuFo94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-_vw1F5gZMnm6bDAU3nU5uA-1; Tue, 01 Feb 2022 04:26:06 -0500
X-MC-Unique: _vw1F5gZMnm6bDAU3nU5uA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3009192D789;
 Tue,  1 Feb 2022 09:26:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E7925E4B7;
 Tue,  1 Feb 2022 09:26:03 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:26:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Message-ID: <Yfj8qc4NeJw7UQy+@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220201085554.85733-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201085554.85733-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 09:26:13 -0000

On Tue, Feb 01, 2022 at 09:55:54AM +0100, Thomas Huth wrote:
> When running "make lcitool-refresh" in an out-of-tree build, it
> currently fails with an error message from git like this:
> 
>  fatal: not a git repository (or any parent up to mount point /)
>  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> 
> Fix it by changing to the source directory first before updating
> the submodule.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/lcitool/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


