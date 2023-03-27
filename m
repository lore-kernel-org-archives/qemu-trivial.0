Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgr8l-0005tJ-0S
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2023 14:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgr8j-0005tB-S4
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 14:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgr8i-00052i-7w
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 14:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679940015;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMow9gapqtDvzYqWJlCsTHm7SgPkzBTT+J8HjzScVy0=;
 b=WGJGXs1jMWGaynduVkYiCTZn1Rct6OIB6QyrZlFVbQW+vuffpKD361jYjyEVcluUVYSRRF
 isWLZGOVepjEUqTSzH152a+wScWwCudAP/LmkWE+EWlHZIz6fubyBOeq7Cq/rCInw4+y3f
 qOsABqbJbPXSKoU9xhBGFBP1h6LiTFU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-g_dtQIp9M3-Jg9GKcpyrjg-1; Mon, 27 Mar 2023 14:00:13 -0400
X-MC-Unique: g_dtQIp9M3-Jg9GKcpyrjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 814E42800486;
 Mon, 27 Mar 2023 18:00:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAC1B202701E;
 Mon, 27 Mar 2023 18:00:12 +0000 (UTC)
Date: Mon, 27 Mar 2023 19:00:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: casantos@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH V3] meson: install keyboard maps only if necessary
Message-ID: <ZCHZqnhPpWmtmVoW@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230327172147.196607-1-casantos@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327172147.196607-1-casantos@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Mar 2023 18:00:18 -0000

On Mon, Mar 27, 2023 at 02:21:47PM -0300, casantos@redhat.com wrote:
> From: Carlos Santos <casantos@redhat.com>
> 
> They are required only for system emulation (i.e. have_system is true).
> 
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


