Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJAj9-0007WR-Iu
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2022 05:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJAj4-0007Qy-85
 for qemu-trivial@nongnu.org; Wed, 03 Aug 2022 05:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJAj2-00050y-J7
 for qemu-trivial@nongnu.org; Wed, 03 Aug 2022 05:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659519096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ga2qvE5hvYXaOOUEWu5UveHK9caqgqNK2x0uMRJjP08=;
 b=dyIucGWW3Kytwh7EjpvzBsEpigwXeAl0/MblzDdP8gn0iLe6Db8kSkJngUc0CprUhYtGSV
 kydUfwZ4pw0cMEkPkdjqFZvk32xbhg3d56AVeTFwS94WA3tUUcK0gFv5IMbSDG7lAFIMlY
 NQzr/MRAhZr4hGzREeY1ZEKjo7XhAnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-4FKATuDaOPCHnM5GrGdopA-1; Wed, 03 Aug 2022 05:31:34 -0400
X-MC-Unique: 4FKATuDaOPCHnM5GrGdopA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49D3685A581;
 Wed,  3 Aug 2022 09:31:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5256492C3B;
 Wed,  3 Aug 2022 09:31:33 +0000 (UTC)
Date: Wed, 3 Aug 2022 10:31:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] README.rst: fix link formatting
Message-ID: <YupAc8oMt7PN7bor@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220803090250.136556-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220803090250.136556-1-cohuck@redhat.com>
[To: Cornelia Huck <cohuck@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 09:31:39 -0000

On Wed, Aug 03, 2022 at 11:02:50AM +0200, Cornelia Huck wrote:
> Make the links render correctly.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  README.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


