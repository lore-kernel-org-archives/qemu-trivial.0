Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIoaR-0008Nd-Ll
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2022 05:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoaQ-0008Ff-15
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 05:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoaO-0003H1-5l
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 05:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiizLmig3EbT5YKTcsy+JVwIAYLea8LSQ0AgDqfG7GM=;
 b=dotllTYP1hGiBrfIhUvgq4i31bxSgp3NFUCAlpQabVdPX3SaVIT+qYGWJ2LoxN6zaebYlV
 Madalx08tbQvq/ZHhqIvhw5rZb9PTA8QCt2q3tncCXvxuNDKB+at0hix2/OqtVZSWn28HY
 3+IRnH0tOH+U6ICE98wRXZf7yE2MfWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-8q5X6Ws-PvK4hL0FOdEgnA-1; Tue, 02 Aug 2022 05:53:10 -0400
X-MC-Unique: 8q5X6Ws-PvK4hL0FOdEgnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D495F101A586;
 Tue,  2 Aug 2022 09:53:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4A11C15D4F;
 Tue,  2 Aug 2022 09:53:08 +0000 (UTC)
Date: Tue, 2 Aug 2022 10:53:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] docs/about/removed-features: Move the -soundhw into the
 right section
Message-ID: <Yuj0AiqK/BuUTDzj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220802075611.346835-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802075611.346835-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Aug 2022 09:53:14 -0000

On Tue, Aug 02, 2022 at 09:56:11AM +0200, Thomas Huth wrote:
> The note about the removal of '-soundhw' has been accidentally added
> to the section of removed "linux-user mode CPUs" ... it should reside
> in the section about removed "System emulator command line arguments"
> instead.
> 
> Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/removed-features.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


