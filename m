Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kndoo-0006zC-Np
	for mharc-qemu-trivial@gnu.org; Fri, 11 Dec 2020 03:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndon-0006yN-1y
 for qemu-trivial@nongnu.org; Fri, 11 Dec 2020 03:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndok-0001MV-C4
 for qemu-trivial@nongnu.org; Fri, 11 Dec 2020 03:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607675420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giZcTNC2eZnF71QeYlzJ8Zny6MwW28xXVJureHbF9do=;
 b=iXdfURrzBfc1zJMNqqGmZm50fBiE2JsOdti+oIXt5tH58ylIC2+n8hGBZ5fP/C6Lpj9p1v
 nJo4R1AU7C/09AqK/jPYvgF4UnuJ9QeIpV1qv2V/Ensx8Uvtm4NGHKjRNJkMsi4W2qbjCd
 I+m97MvJDX/EaQNBtVs0jH2Vmnh5n3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-paY8CdvSOLS6v9PcABUomw-1; Fri, 11 Dec 2020 03:30:15 -0500
X-MC-Unique: paY8CdvSOLS6v9PcABUomw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B77107ACE3;
 Fri, 11 Dec 2020 08:30:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19D619725;
 Fri, 11 Dec 2020 08:30:11 +0000 (UTC)
Subject: Re: [PATCH v3 0/7] silence the compiler warnings
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 ganqixin <ganqixin@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BAEA98B@dggemm531-mbx.china.huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d78cb34-82fd-0bce-4006-316af4781ab6@redhat.com>
Date: Fri, 11 Dec 2020 09:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83BAEA98B@dggemm531-mbx.china.huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Fri, 11 Dec 2020 08:30:25 -0000

On 11/12/2020 03.22, Chenqun (kuhn) wrote:
> Kindly ping!
> 
> Hi all,
>   Patch 1 to Patch 5 are not in the queue.  Could someone pick them up？

 Hi,

yes, I'm currently preparing another patch series that includes your
patches, which will finally turn on -Wimplicit-fallthrough for everybody.
I'll send it out once David's ppc pull request has been merged, so that I
don't have to include the ppc patches again.

 Thomas


