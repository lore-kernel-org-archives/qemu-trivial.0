Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtpWK-0005Um-Vd
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2020 05:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtpWJ-0005UT-Jd
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2020 05:40:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtpWH-0005uS-2Z
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2020 05:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594374035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zbsAehH5+P7R9qu9oGq+H9orZQd7S2ufuoDC+RoHI5o=;
 b=acrQfzizdXqV1A+Vqw1Ua54rW6cmjGTZZO6Sj3169YSdfCwMtLQU7nOvlp8R4pJA7kutmJ
 GZeVxDVVcd6DL8JO7hVGUCWXaKBh6ijv1pp5vcbhNbLhlq6xtpKzjT4Rkg/99fP4WNUT/x
 QSDxa6nfFFaV3Hy5rt4zuCXvGmxBVeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-w0BkHcYIPdq5am3E2sN5Sg-1; Fri, 10 Jul 2020 05:40:31 -0400
X-MC-Unique: w0BkHcYIPdq5am3E2sN5Sg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EDCF1080;
 Fri, 10 Jul 2020 09:40:30 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-57.ams2.redhat.com [10.36.114.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0425BAC3;
 Fri, 10 Jul 2020 09:40:27 +0000 (UTC)
Date: Fri, 10 Jul 2020 11:40:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, xiexiangyou@huawei.com
Subject: Re: [PATCH v1] qmp: don't hold ctx lock while querying blockstats
Message-ID: <20200710094026.GC6641@linux.fritz.box>
References: <20200710085400.343-1-yezhenyu2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200710085400.343-1-yezhenyu2@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Jul 2020 09:40:39 -0000

Am 10.07.2020 um 10:54 hat Zhenyu Ye geschrieben:
> Because the QMP command runs in the main thread, and changes
> to the aio context of iothread will only be executed in the
> main thread (they will not be in parallel), so there is no
> need a lock protection while querying blockstats.
> 
> If we hold the lock here, while the I/O pressure is high in
> vm and the I/O returns slowly, the main thread will be stuck
> until the lock is released, which will affect the vcpu operation
> and finall cause the vm to be stuck.
> 
> Signed-off-by: Zhenyu Ye <yezhenyu2@huawei.com>

Are you saying that you think qmp_query_blockstats() runs in the
iothread? This is not true, it runs in the main thread.

This makes dropping the lock wrong, and even dropping it shouldn't make
a difference for other things that should run in the main thread because
the main thread is still busy executing the QMP command.

Am I missing something?

(Also, a change like this is most definitely *not* trivial.)

Kevin


