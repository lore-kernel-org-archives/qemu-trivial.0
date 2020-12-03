Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kksPr-000357-5w
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2020 12:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksPj-000321-00
 for qemu-trivial@nongnu.org; Thu, 03 Dec 2020 12:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksPe-0005F5-EA
 for qemu-trivial@nongnu.org; Thu, 03 Dec 2020 12:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rz2H2g6BTxf3boA5vJnUsLsMTEHCCesGpvJKSvMoL4I=;
 b=XEub11m2RmuKNoiww4BXtveiNo2HME2cU/3uuyuHZOHOwgOOxRabFoqWlqD6zxPI2ThP/r
 H1L593u3FQUpXwpqGsdJXTDKshHlWqq+CJN6hhnb1ONP696IhHkwe2blhAMnzVZAsfBWik
 QghN9pdU3i6kdFZNTIcluov08hd2O58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Cqj3tDCMM7OkXGOUwVnUqw-1; Thu, 03 Dec 2020 12:28:56 -0500
X-MC-Unique: Cqj3tDCMM7OkXGOUwVnUqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB3E801F95;
 Thu,  3 Dec 2020 17:28:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C73D71A890;
 Thu,  3 Dec 2020 17:28:53 +0000 (UTC)
Date: Thu, 3 Dec 2020 18:28:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
 armbru@redhat.com, kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH v2 0/4] Use lock guard macros in block
Message-ID: <20201203172851.GB5409@merkur.fritz.box>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
X-List-Received-Date: Thu, 03 Dec 2020 17:29:08 -0000

Am 03.12.2020 um 08:50 hat Gan Qixin geschrieben:
> v1->v2:
> 
> -Patch1:
>     Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
> message.
> 
> -Patch2:
>     Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
> message.
> 
> -Patch3:
>     Delete the .c suffix in the commit.
>     Changes suggested by Kevin Wolf: Fix wrong indentation format.
>     
> -Patch4:
>     Delete the .c suffix in the commit.
>     Changes suggested by Kevin Wolf: Replace QEMU_LOCK_GUARD with
> WITH_QEMU_LOCK_GUARD, and delete the redundant qemu_mutex_unlock().

Thanks, applied to the block branch.

Kevin


