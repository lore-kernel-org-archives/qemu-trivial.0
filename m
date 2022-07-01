Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o79P9-0000Vo-IW
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2022 01:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o79Ow-0000SY-Bc
 for qemu-trivial@nongnu.org; Fri, 01 Jul 2022 01:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o79Op-0008G4-EH
 for qemu-trivial@nongnu.org; Fri, 01 Jul 2022 01:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656654062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4JYgUt4VsCYequ59EFv4ge+AZqL6rhLTwGuz3ho02ys=;
 b=daHwYBDY+JA/P0lQsYap67hRojOFgzv/CdYpA0dVVnWv29++PZEyyD833YGAvb+w+cdgXI
 +mh6JFMxFO6pDaDZ9isq9/Ci/wieKlbeFdxpDOrGF09tnOKVEeAc5alE+YJXrrxYVeUXis
 GQMwnttXymQRoR63MPAkYN09y23xoUQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-gBPIrvv1OKyAS96QKxjldg-1; Fri, 01 Jul 2022 01:41:00 -0400
X-MC-Unique: gBPIrvv1OKyAS96QKxjldg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78D403815D2E;
 Fri,  1 Jul 2022 05:41:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DFCC40334D;
 Fri,  1 Jul 2022 05:41:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1204421E690D; Fri,  1 Jul 2022 07:40:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "mst@redhat.com"
 <mst@redhat.com>,  "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev>
Date: Fri, 01 Jul 2022 07:40:59 +0200
In-Reply-To: <20220701043032.GA28338@raphael-debian-dev> (Raphael Norwitz's
 message of "Fri, 1 Jul 2022 04:30:39 +0000")
Message-ID: <87wncx2xw4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 01 Jul 2022 05:41:19 -0000

Raphael Norwitz <raphael.norwitz@nutanix.com> writes:

> On Thu, Jun 30, 2022 at 10:52:19AM +0200, Markus Armbruster wrote:
>> We allocate VuVirtqElement with g_malloc() in
>> virtqueue_alloc_element(), but free it with free() in
>> vhost-user-blk.c.  Harmless, but use g_free() anyway.
>> 
>> One of the calls is guarded by a "not null" condition.  Useless,
>> because it cannot be null (it's dereferenced right before), and even
>
> NIT: if it

Yes.

>> it it could be, free() and g_free() do the right thing.  Drop the
>> conditional.
>> 
>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>
>> Fixes: Coverity CID 1490290
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>> Not even compile-tested, because I can't figure out how this thing is
>> supposed to be built.  Its initial commit message says "make
>> vhost-user-blk", but that doesn't work anymore.
>> 
>
> make contrib/vhost-user-blk/vhost-user-blk works for me.

Could we use a contrib/README with an explanation what "contrib" means,
and how to build and use the stuff there?

Thanks!


