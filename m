Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUQTA-0004GS-5g
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 04:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQT4-0004ED-On
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 04:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQSz-0002YB-JH
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 04:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603095867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iF4ff05saBkB2aPT0emZyOTKcWts7Lj1LnVvjLqiYok=;
 b=aRXY6rpUpAtARgcQc/eEHi9xxOJ+bkPYKx8F5WHU+AsrtSDxALWFkiOyiTq1eRvpGreVUz
 Fh0sf5LRG6quBvCz66bp/PZWQ/ygwDP5QzPOAZPDJ3cdvPP4Y/InejDYJJjQKRik0PToKr
 JBi+NS86dtLV2gvWyQoF44xj1WPLmkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-zLoPxgqZM7KPLQHeJlHNiA-1; Mon, 19 Oct 2020 04:24:24 -0400
X-MC-Unique: zLoPxgqZM7KPLQHeJlHNiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B746D10A0B81;
 Mon, 19 Oct 2020 08:24:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C1155775;
 Mon, 19 Oct 2020 08:24:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CD9C91132A08; Mon, 19 Oct 2020 10:24:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Bihong Yu <yubihong@huawei.com>,  zhengchuan@huawei.com,
 quintela@redhat.com,  qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,
 alex.chen@huawei.com,  wanghao232@huawei.com
Subject: Re: [PATCH v2 3/8] migration: Add spaces around operator
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-4-git-send-email-yubihong@huawei.com>
 <20201013101003.GC2920@work-vm>
Date: Mon, 19 Oct 2020 10:24:20 +0200
In-Reply-To: <20201013101003.GC2920@work-vm> (David Alan Gilbert's message of
 "Tue, 13 Oct 2020 11:10:03 +0100")
Message-ID: <87a6wi1v4b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 19 Oct 2020 08:24:35 -0000

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Bihong Yu (yubihong@huawei.com) wrote:
>> Signed-off-by: Bihong Yu <yubihong@huawei.com>
>> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
>
> Yes that's OK, I'm a bit sturprised we need the space afte rthe * in the
> VMStateDescription case, I wouldn't necessarily go and change them all.

We don't: it's not the binary multiplication operator *, where we want a
space on both sides, it's a pointer declarator, where we want a space on
the left only.

Example:

    int *pa, *pb, *pc;
    *pa = *pb * *pc;

Note the space on both side of binary operator * (multiplication), but
only on the left side of the pointer declarator's * and the unary
operator * (indirection).

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
[...]
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index d2e141f..9e95df1 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -521,7 +521,7 @@ static const VMStateDescription vmstate_configuration = {
>>          VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, len),
>>          VMSTATE_END_OF_LIST()
>>      },
>> -    .subsections = (const VMStateDescription*[]) {
>> +    .subsections = (const VMStateDescription * []) {
>>          &vmstate_target_page_bits,
>>          &vmstate_capabilites,
>>          &vmstate_uuid,

Should be

   .subsections = (const VMStateDescription *[]) {

[...]


