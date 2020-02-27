Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7NVP-00065x-J9
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 13:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7NVN-00063d-9z
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:03:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7NVM-0000c3-CK
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:03:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7NVM-0000bt-95
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582826603;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXcoFIKfdayPp5Ufj0uzs8sJ+k93gtb12lIAf/a5BIY=;
 b=hSp1G7DfSP6gvXLy9hL/jQd2VJp4XIbx0VwK9ISRX9RaX18Mpx2ayDBV/XUr39J/xq5aN/
 /1jKKBgiNtU4d6HyVx0/FCBDXHNOWZ2Ab0RhN5JqCwLaFSfGed+dmdhRftVB6b+67Ag+pm
 IW0kBV5IEV0mVDNBjQDAWMOzFd+Ndo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-xEpoaVMmOxWd3FwjgR43ow-1; Thu, 27 Feb 2020 13:03:16 -0500
X-MC-Unique: xEpoaVMmOxWd3FwjgR43ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA55D100DFC4;
 Thu, 27 Feb 2020 18:03:14 +0000 (UTC)
Received: from redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AAF55DA7B;
 Thu, 27 Feb 2020 18:03:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>, <ehabkost@redhat.com>, <thuth@redhat.com>,
 <dgilbert@redhat.com>, <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH v2] test-vmstate: Fix memleaks in test_load_qlist
In-Reply-To: <20200220134103.26224-1-kuhn.chenqun@huawei.com> (kuhn chenqun's
 message of "Thu, 20 Feb 2020 21:41:03 +0800")
References: <20200220134103.26224-1-kuhn.chenqun@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 27 Feb 2020 19:03:12 +0100
Message-ID: <87k147di1r.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 27 Feb 2020 18:03:26 -0000

<kuhn.chenqun@huawei.com> wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>
> There is memleak in test_load_qlist().It's not a big deal,
> but test-vmstate will fail if sanitizers is enabled.
>
> In addition, "ret" is written twice with the same value
>  in test_gtree_load_iommu().
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


