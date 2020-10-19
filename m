Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUTpX-0001uo-CJ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 07:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUTpV-0001sN-L5
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 07:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUTpU-0002EN-5K
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 07:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603108794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ge6Uqu/uP5YhwNY3l8LcQgQKlJPd6dM7i3DD+Dv9iM=;
 b=LbE4BuEjSAdrZAnEQjuJvaOeM5f+53bkTnP1PEprVKChqUzwqHFcx0X3/DjPZd3/7wllyx
 lK2tOwl9OuXTkSGrBY/mELPru88pgpSrPm//pqU1E0Nqo8cjOLAzMe22D1WzfMoQ75XAWQ
 AW0fFWMjP+v0zSoPPgj07kc4eDGcX/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-Xl9vZ474N4GFmNsqDElNdw-1; Mon, 19 Oct 2020 07:59:51 -0400
X-MC-Unique: Xl9vZ474N4GFmNsqDElNdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0965B1015C98;
 Mon, 19 Oct 2020 11:59:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC5010016DA;
 Mon, 19 Oct 2020 11:59:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A39771132A08; Mon, 19 Oct 2020 13:59:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  alex.chen@huawei.com,
 quintela@redhat.com,  qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,
 zhengchuan@huawei.com,  wanghao232@huawei.com
Subject: Re: [PATCH v2 3/8] migration: Add spaces around operator
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-4-git-send-email-yubihong@huawei.com>
 <20201013101003.GC2920@work-vm> <87a6wi1v4b.fsf@dusky.pond.sub.org>
 <90d55347-0f39-1ac7-f1a1-3982684b2213@huawei.com>
Date: Mon, 19 Oct 2020 13:59:47 +0200
In-Reply-To: <90d55347-0f39-1ac7-f1a1-3982684b2213@huawei.com> (Bihong Yu's
 message of "Mon, 19 Oct 2020 17:43:36 +0800")
Message-ID: <87h7qq4ea4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 19 Oct 2020 11:59:57 -0000

Bihong Yu <yubihong@huawei.com> writes:

> Yes, I used to think "const VMStateDescription *[]" was right, but when I search
> similar expressions, most of all are "xxx * []". Such as:
> fsdev/qemu-fsdev.c:54:        .opts = (const char * [])
> hw/intc/s390_flic_kvm.c:567:    .subsections = (const VMStateDescription * [])
> ...

All three variations occur in the code: no space, space on both sides,
space only on the left.

> So, I keep the same style. Should I change it to "const VMStateDescription *[]"?

Dropping the change to savevm.c should be fine.

Changing it to "VMStateDescription *[]" should be also fine.

I figure you can keep David's R-by in both cases.

[...]


