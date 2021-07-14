Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3aJj-0008EC-Ju
	for mharc-qemu-trivial@gnu.org; Wed, 14 Jul 2021 04:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3aJh-0008Dw-Mp
 for qemu-trivial@nongnu.org; Wed, 14 Jul 2021 04:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3aJe-0002tm-Gm
 for qemu-trivial@nongnu.org; Wed, 14 Jul 2021 04:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626251545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1nIlE1W+P94owWf4qZGTo93XBKv0wGUHpgbArq+Jj0=;
 b=Of2DjfwqapteWkEGYFwjtbM24TtVm+g4ASe8rmkttHpZaDAU65NmhIjeKb6W6gjqpTTSGz
 TJvDT/y8L4FBnv+1SB87rWJfcYJpIebczFRpqBVvvcbid3R4Yr5GN7ktWBcFgFFR6A6T9u
 xGUui0JOXkXrw6G7h66vbn0/h+Fzcy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-Pc5k7Pk0ODOBJ4XeotsQfw-1; Wed, 14 Jul 2021 04:32:22 -0400
X-MC-Unique: Pc5k7Pk0ODOBJ4XeotsQfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46C3091270;
 Wed, 14 Jul 2021 08:32:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53DB810372DC;
 Wed, 14 Jul 2021 08:32:19 +0000 (UTC)
Date: Wed, 14 Jul 2021 09:32:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] configure: Drop obsolete check for the alloc_size
 attribute
Message-ID: <YO6hDoZ4w1vuaBb+@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210714072855.785566-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714072855.785566-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
X-List-Received-Date: Wed, 14 Jul 2021 08:32:30 -0000

On Wed, Jul 14, 2021 at 09:28:55AM +0200, Thomas Huth wrote:
> We recently bumped our requirement for Clang to at least version 6.0.
> And according to:
> 
>  https://releases.llvm.org/6.0.0/tools/clang/docs/AttributeReference.html
> 
> Clang v6.0 supports the alloc_size attribute. Thus we can drop this
> check in the configure script now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 12 ------------
>  1 file changed, 12 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


