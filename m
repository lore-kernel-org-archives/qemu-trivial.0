Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVAsS-0006MQ-65
	for mharc-qemu-trivial@gnu.org; Tue, 28 Sep 2021 07:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAsI-0006I5-BD
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 07:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAsA-0002im-Os
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 07:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826925;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aDV3znnrvUlSX5pqXy4vuh6c7Chi9D+jwremKfAdmE=;
 b=hZdh+uR3pSoF7xoOHIXzGghiLXjekkROUxeKHG/dVyf3IQhCxO/qn2S+1bwSEP8oVSFdh+
 LpcdCr0nM31lUcQgzD8Bhz2kWlG4WXWrzdhQ0KfVgu/e3EcBGOx8l2qtprrYMYosdspUmU
 /rr/oZwDMF3tNgGVzOiWZ/6vq3mskSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-xZsRPNptOKa4-fMiZUtQYQ-1; Tue, 28 Sep 2021 07:02:02 -0400
X-MC-Unique: xZsRPNptOKa4-fMiZUtQYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDFD81084689;
 Tue, 28 Sep 2021 11:02:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 234885C1D0;
 Tue, 28 Sep 2021 11:01:58 +0000 (UTC)
Date: Tue, 28 Sep 2021 12:01:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/2] qemu-options: Add missing "sockets=2" to CLI "-smp 2"
Message-ID: <YVL2JDoQ2XNvmo+H@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-3-wangyanan55@huawei.com>
 <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
 <0508934a-f4d5-a7ed-310a-065aa823fb08@huawei.com>
MIME-Version: 1.0
In-Reply-To: <0508934a-f4d5-a7ed-310a-065aa823fb08@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Sep 2021 11:02:18 -0000

On Tue, Sep 28, 2021 at 06:58:20PM +0800, wangyanan (Y) wrote:
> 
> On 2021/9/28 18:46, Philippe Mathieu-Daudé wrote:
> > On 9/28/21 11:31, Yanan Wang wrote:
> > > There is one example of -smp CLI in qemu-options.hx currently
> > > using "-smp 2" and assuming that there will be 2 sockets.
> > > However now the actually calculation logic of missing sockets
> > > and cores is not immutable, we should use more explicit CLIs
> > > like "-smp 2,sockets=2" if we want multiple sockets.
> > > 
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   qemu-options.hx | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/qemu-options.hx b/qemu-options.hx
> > > index dcd9595650..ff8917c5e1 100644
> > > --- a/qemu-options.hx
> > > +++ b/qemu-options.hx
> > > @@ -395,7 +395,7 @@ SRST
> > >           -m 2G \
> > >           -object memory-backend-ram,size=1G,id=m0 \
> > >           -object memory-backend-ram,size=1G,id=m1 \
> > > -        -smp 2 \
> > > +        -smp 2,sockets=2,maxcpus=2 \
> > Is the addition of "maxcpus=2" intentional?
> Yes, but it's not necessary IMO. I just wanted to keep consistency
> with other numa config examples in the Doc. Should I remove it ?

I think it makes sense to be explicit, because the numa config
works in terms of maxcpus when splitting cpus between nodes


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


