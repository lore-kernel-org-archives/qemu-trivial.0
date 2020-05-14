Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZGa0-0001Jj-DA
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2020 12:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZGZz-0001JN-JV
 for qemu-trivial@nongnu.org; Thu, 14 May 2020 12:19:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48141
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZGZy-0005rC-4m
 for qemu-trivial@nongnu.org; Thu, 14 May 2020 12:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589473164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLqJCySUNX45WU2F3jU3H8WwsE/kf862knzxAgJZJwY=;
 b=S/ndab66pkHAy55dBFwqvMfZXZK4XuKO9DM3KnWAEFZmI61rfpdIDe6/M6MNem+4pvaKop
 aNnl0Aqkq1qmzizqJXkf4X0XcwTlwKWzBKc/dRGVSozbwREP5gd2V5A4AKjeIMZawrk1dU
 /I0pG0otDbcfL/GFInobGUp0C2LgnNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-e8Tj2Pd-ODKAdmRK0OvlQQ-1; Thu, 14 May 2020 12:19:23 -0400
X-MC-Unique: e8Tj2Pd-ODKAdmRK0OvlQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8720D8015CF;
 Thu, 14 May 2020 16:19:21 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6737D5C1D3;
 Thu, 14 May 2020 16:19:20 +0000 (UTC)
Date: Thu, 14 May 2020 18:19:18 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
Message-ID: <20200514161918.GN5518@linux.fritz.box>
References: <20200507121129.29760-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 12:05:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 14 May 2020 16:19:27 -0000

Am 07.05.2020 um 14:11 hat Philippe Mathieu-Daudé geschrieben:
> block_copy_task_entry() might be written differently to avoid
> the initialization. This silents the warning and let me build.

Thanks, applied to the block branch.

Kevin


