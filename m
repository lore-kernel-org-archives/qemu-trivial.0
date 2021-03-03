Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHUgy-0006b7-6e
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 11:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHUgw-0006Yz-G4
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 11:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHUgv-0002mv-2a
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 11:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614790180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyVm1r5DjCLydFJiTMAsO7huugRPaWPKcpKE3GGh3do=;
 b=F7cC/KEHiELAFjoRjZt6b4vHebGjS086gucSR4522yQ9FE8dWs5dgaI64AT+Gs2Lz0EFK7
 xYICWs8PNhfWD5Ui1xOlRDV3vxBXtQtdeiaSLOKG36sldqBwNANF2/cleUp3nyglTaizUW
 KvU6DBsUIuzQ9IepyRHlUO6roycpMCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-dH4nBf5oMsGpvW0dR26DIg-1; Wed, 03 Mar 2021 11:49:36 -0500
X-MC-Unique: dH4nBf5oMsGpvW0dR26DIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10025107ACC7;
 Wed,  3 Mar 2021 16:49:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0118510013D6;
 Wed,  3 Mar 2021 16:49:32 +0000 (UTC)
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: lvivier@redhat.com, zhang.zhanghailiang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, ganqixin@huawei.com
References: <20210226081414.205946-1-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] qtest: delete superfluous inclusions of qtest.h
Message-ID: <f007c0fe-1d9c-ec63-5e92-1f788e87970a@redhat.com>
Date: Wed, 3 Mar 2021 17:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226081414.205946-1-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 03 Mar 2021 16:49:42 -0000

On 26/02/2021 09.14, Chen Qun wrote:
> There are 23 files that include the "sysemu/qtest.h",
> but they do not use any qtest functions.
> 
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> 
> ---
> v1->v2: Change the subject base on Markus's suggestion.
> Cc: Markus Armbruster <armbru@redhat.com>
> ---

Thanks, queued to my testing-next branch:

https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


