Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqu8m-0001Bp-Lz
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jun 2021 05:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqu8l-0001BI-C5
 for qemu-trivial@nongnu.org; Wed, 09 Jun 2021 05:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqu8g-0000Qo-Nv
 for qemu-trivial@nongnu.org; Wed, 09 Jun 2021 05:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623229481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9H8xTumUX4s18wQ0TMGvkXpjyRdzzIBBPYCnC6PvHg=;
 b=gbdFLZkMax0SUpi/9gr3DYp+p98wzb/+NGaDUAXoldTYtdUKRMD5bUahZrIu1I1rbejqZT
 akhj2WtYUxGTCJRWKUIQhu4mAsqB1dcNneWMX3UKV/Td1jt+AD8a2pXuOTqajUysvd11uy
 ZwZczppy6EshqhmRFmoOY+ct4Rpqt0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-7pcaAjbMPJqPuZbgwPOVVg-1; Wed, 09 Jun 2021 05:04:39 -0400
X-MC-Unique: 7pcaAjbMPJqPuZbgwPOVVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC76801B12;
 Wed,  9 Jun 2021 09:04:38 +0000 (UTC)
Received: from redhat.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9894010016F4;
 Wed,  9 Jun 2021 09:04:36 +0000 (UTC)
Date: Wed, 9 Jun 2021 11:04:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: Prevent compiler warning on block.c
Message-ID: <YMCEI3dEmkLmT2RN@redhat.com>
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
 <9ef22266-25e1-36df-52e9-ad5244a648dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9ef22266-25e1-36df-52e9-ad5244a648dc@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
X-List-Received-Date: Wed, 09 Jun 2021 09:04:47 -0000

Am 09.06.2021 um 09:12 hat Thomas Huth geschrieben:
> On 05/05/2021 10.05, Vladimir Sementsov-Ogievskiy wrote:
> > 05.05.2021 10:59, Miroslav Rezanina wrote:
> > > Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced
> > > uninitialized
> > > variable to_cow_parent in bdrv_replace_node_common function that is
> > > used only when
> > > detach_subchain is true. It is used in two places. First if block
> > > properly initialize
> > > the variable and second block use it.
> > > 
> > > However, compiler treats this two blocks as two independent cases so
> > > it thinks first
> > > block can fail test and second one pass (although both use same
> > > condition). This cause
> > > warning that variable can be uninitialized in second block.
> > > 
> > > To prevent this warning, initialize the variable with NULL.
> > > 
> > > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> > > ---
> > > diff --git a/block.c b/block.c
> > > index 874c22c43e..3ca27bd2d9 100644
> > > --- a/block.c
> > > +++ b/block.c
> > > @@ -4851,7 +4851,7 @@ static int
> > > bdrv_replace_node_common(BlockDriverState *from,
> > >       Transaction *tran = tran_new();
> > >       g_autoptr(GHashTable) found = NULL;
> > >       g_autoptr(GSList) refresh_list = NULL;
> > > -    BlockDriverState *to_cow_parent;
> > > +    BlockDriverState *to_cow_parent = NULL;
> > >       int ret;
> > > 
> > >       if (detach_subchain) {
> > > 
> > 
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> This just popped up again here:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02067.html
> 
> Kevin, Max, could you please pick it up to get this problem fixed?

Thanks for pinging, seems the intended refactoring hasn't happened.

I've applied this one to my block branch now.

Kevin


