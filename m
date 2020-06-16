Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlD5r-0007OB-3z
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2020 11:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlD5p-0007Ky-SH
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 11:01:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlD5m-0006IE-Ez
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 11:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592319696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HqczRbAwPx+vKqu+Y3gRIXJ8X0tDsQL0G2N8oNctokM=;
 b=QjehAuXQpc77efktphs4yrTNMoFVwlnzwmE4uhMgvRfdNOHVi3FcPR3/l1kAsRKNran8aZ
 /tzMe1tIOhgYdfIXaY6p0bchfVJvw9BoZaew3etmieJXtMOxvg3PTdu8Y1DZJe3zIi2+iF
 QrckcgTgwnlyZH2PPo/MRI/w/Vdu/UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-2sdhp2BqPYSrEIhtCiUjdA-1; Tue, 16 Jun 2020 11:01:32 -0400
X-MC-Unique: 2sdhp2BqPYSrEIhtCiUjdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46057100A8C1;
 Tue, 16 Jun 2020 15:01:31 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 596CE60C05;
 Tue, 16 Jun 2020 15:01:30 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:01:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: qemu-trivial@nongnu.org,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] .gitignore: Ignore storage-daemon files
Message-ID: <20200616150128.GE4305@linux.fritz.box>
References: <20200612105830.17082-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20200612105830.17082-1-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 16 Jun 2020 15:01:42 -0000

Am 12.06.2020 um 12:58 hat Roman Bolshakov geschrieben:
> The files are generated.
> 
> Fixes: 2af282ec51a ("qemu-storage-daemon: Add --monitor option")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks, applied to the block branch.

Kevin


