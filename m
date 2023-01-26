Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL17H-0005hy-2Q
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2023 07:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL17F-0005hU-Av
 for qemu-trivial@nongnu.org; Thu, 26 Jan 2023 07:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL17D-0007bF-SZ
 for qemu-trivial@nongnu.org; Thu, 26 Jan 2023 07:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674735147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAjqVvnJiEaPWWQIorvHj1S74sQzg8vVLQpnV9Yxx6Q=;
 b=Et9K44khkQA2gDuy2K33FyJMvQAlswG8JEr27G/ExpM19SFavrwQoM4kaQjrm8vkff4pc3
 svjg+KIu4PtT0TMnclJybhzdaYaOBggyzKS92jXbnrCGmqrTA0c5MH9BnjF/pvX8jTmuG8
 F4nthKhIh6gZzkTDnuLSBLc5aGOAPac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-nj4V-kgmPni_uqP-3R4KZw-1; Thu, 26 Jan 2023 07:12:23 -0500
X-MC-Unique: nj4V-kgmPni_uqP-3R4KZw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA7D811E9C;
 Thu, 26 Jan 2023 12:12:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2937492C14;
 Thu, 26 Jan 2023 12:12:22 +0000 (UTC)
Date: Thu, 26 Jan 2023 12:12:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, wenchao.wang@intel.com,
 haxm-team@intel.com
Subject: Re: [PATCH v2] docs/about/deprecated: Mark HAXM in QEMU as deprecated
Message-ID: <Y9JuJEaylyKo93af@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230126121034.1035138-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126121034.1035138-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 26 Jan 2023 12:12:29 -0000

On Thu, Jan 26, 2023 at 01:10:34PM +0100, Thomas Huth wrote:
> The HAXM project has been retired (see https://github.com/intel/haxm#status),
> so we should mark the code in QEMU as deprecated (and finally remove it
> unless somebody else picks the project up again - which is quite unlikely
> since there are now whpx and hvf on these operating systems, too).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Added a message to hax_accel_init(), too
> 
>  docs/about/deprecated.rst | 6 ++++++
>  target/i386/hax/hax-all.c | 3 +++
>  2 files changed, 9 insertions(+)
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


