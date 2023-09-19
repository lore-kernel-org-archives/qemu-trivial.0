Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qidBN-0003DH-5A
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2023 12:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qidBK-00035R-1O
 for qemu-trivial@nongnu.org; Tue, 19 Sep 2023 12:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qidBE-0002MA-14
 for qemu-trivial@nongnu.org; Tue, 19 Sep 2023 12:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695139346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEmpz+ipSYT8Diy5oGMyRLBFZ3QVbIqRknS1eF4CyW0=;
 b=TAkNO48gmh9XQjiJ3yLyHeTRDbbM7POSKJRt2cuEVOg9Yja3jwJJtMy2L78fu0Tccl91Gg
 OTdFuCS4rHO5Guwxs+rp0ZgRhqNrEmhoyADFPtOmpCqKwG6mMkTeD2nE4lKWZUOQozq8FX
 4Kj2irjQMms9ORgfoSMI7TWePhbkNyc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-meYZBn2ONNuVC_0WU7iHfg-1; Tue, 19 Sep 2023 12:02:12 -0400
X-MC-Unique: meYZBn2ONNuVC_0WU7iHfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2B0811E8F;
 Tue, 19 Sep 2023 16:01:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39BC840C2009;
 Tue, 19 Sep 2023 16:01:42 +0000 (UTC)
Date: Tue, 19 Sep 2023 18:01:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] block: mark aio_poll as non-coroutine
Message-ID: <ZQnF5QNZCB1TRlax@redhat.com>
References: <20230908075458.527013-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908075458.527013-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Sep 2023 16:02:34 -0000

Am 08.09.2023 um 09:54 hat Paolo Bonzini geschrieben:
> It is forbidden to block on the event loop during a coroutine, as that
> can cause deadlocks due to recursive locking.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, applied to the block branch.

Kevin


