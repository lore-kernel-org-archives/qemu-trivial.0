Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVddh-0002E9-9V
	for mharc-qemu-trivial@gnu.org; Thu, 22 Oct 2020 12:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVddf-0002CO-9D
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 12:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVddd-0006h2-Iz
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 12:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603384828;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfwQS7i5hYiRXSJdIzTc6bN2t3392Wb4rHQBbp25mSk=;
 b=WdYM9tkKHaGIyQpRDBjkHaN3HPC/1aQVzBdHhGOUvlfSbwOCTbEQcg9yh3Fcb++3WDfeEB
 lNLuPg0zQpL7qiheMECk6amrhpJUL17a1H3gRd8bOxVn32jO38FM+oZX0YiFlgWnCs7jLf
 4c/a+DiKPp7+bjW2aXTko2l68IgAhwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-6gDh0QYCO16mU0K7kObcjw-1; Thu, 22 Oct 2020 12:40:26 -0400
X-MC-Unique: 6gDh0QYCO16mU0K7kObcjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F989804001;
 Thu, 22 Oct 2020 16:40:25 +0000 (UTC)
Received: from redhat.com (ovpn-115-44.ams2.redhat.com [10.36.115.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2EFB1972A;
 Thu, 22 Oct 2020 16:40:23 +0000 (UTC)
Date: Thu, 22 Oct 2020 17:40:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [PATCH] CHANGELOG: remove disused file
Message-ID: <20201022164020.GF428835@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201022162843.1841780-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201022162843.1841780-1-jsnow@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 22 Oct 2020 16:40:32 -0000

On Thu, Oct 22, 2020 at 12:28:43PM -0400, John Snow wrote:
> There's no reason to keep this here; the versions described are
> ancient. Everything here is still mirrored on
> https://wiki.qemu.org/ChangeLog/old if anyone is curious; otherwise, use
> the git history.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  Changelog | 580 ------------------------------------------------------
>  1 file changed, 580 deletions(-)
>  delete mode 100644 Changelog

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


