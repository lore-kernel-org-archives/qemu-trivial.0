Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZwy1-0003Ta-5D
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 09:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZwxr-0003Qd-NK
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 09:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZwxn-0004mH-0q
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 09:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604412426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/WqzCSGXJ+A5Qk4+03iMLobXja4XoZVBskFYbcwRQk=;
 b=KSY9ZxfPEhMd5CfxGa2FtYP5LWgikvgWItFmtn/mriDujR8Bv1c1wm+/FQ+LF42+xjPd64
 W3aj5ouQnXipROXuo4Yqak8bkOweiZp7klj4FhJ4c/LQwrwC089aswZe77Jhr5GDF6PDU/
 Vl9w4mpqSb4pKGisdDKJ+41g82piaYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-uznlF40KO2iuiYwNuiNDLQ-1; Tue, 03 Nov 2020 09:07:01 -0500
X-MC-Unique: uznlF40KO2iuiYwNuiNDLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3FC100738B;
 Tue,  3 Nov 2020 14:07:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5BDD6266E;
 Tue,  3 Nov 2020 14:06:58 +0000 (UTC)
Date: Tue, 3 Nov 2020 15:06:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: AlexChen <alex.chen@huawei.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, QEMU <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH V2] block/vvfat: Fix bad printf format specifiers
Message-ID: <20201103140657.GD5509@merkur.fritz.box>
References: <5FA12620.6030705@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5FA12620.6030705@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 14:07:12 -0000

Am 03.11.2020 um 10:42 hat AlexChen geschrieben:
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
> In addition, fix two error format problems found by checkpatch.pl:
> ERROR: space required after that ',' (ctx:VxV)
> +        fprintf(stderr,"%s attributes=0x%02x begin=%u size=%d\n",
>                        ^
> ERROR: line over 90 characters
> +        fprintf(stderr, "%d, %s (%u, %d)\n", i, commit->path ? commit->path : "(null)", commit->param.rename.cluster, commit->action);
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Thanks, applied to the block branch.

Kevin


