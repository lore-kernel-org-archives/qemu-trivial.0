Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpV0D-0002LM-5i
	for mharc-qemu-trivial@gnu.org; Wed, 16 Dec 2020 06:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpV0B-0002Jp-7F
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 06:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpV09-0002Lw-Ht
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 06:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l3sGHDVzynwgeHiWhVHH5wP5GYNRY5jvtRklqtNuUQI=;
 b=OssQ1FxvD7zaE7AQqyq+tjeNCCr283BpHQZXp5FLOLFj16f+vVXTtzyvlfCfWqCzWJAolm
 E0SJW6BZ8aEMeJnHKRcECWMp3Tg1RGzsYcxNWZM0iClzMdSwnvP3xTp7ZjSZhOfnmtMCui
 uemnqyFgAeuZLkISpshuTvKFSi2AXWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-0euvqCY4Oe-lnyhG3l4tVQ-1; Wed, 16 Dec 2020 06:29:44 -0500
X-MC-Unique: 0euvqCY4Oe-lnyhG3l4tVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B53190A7A1;
 Wed, 16 Dec 2020 11:29:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57D7D10013C1;
 Wed, 16 Dec 2020 11:29:42 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:29:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] block: report errno when flock fcntl fails
Message-ID: <20201216112940.GB7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20201215190127.1765595-1-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 11:29:51 -0000

Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
> When a call to fcntl(2) for the purpose of manipulating file locks
> fails, report the error returned by fcntl.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Is appending "Resource temporarily unavailable" in the common case (a
file locked by another process) actually an improvement for the message
or more confusing? It would be good to mention the motivation for the
change in the commit message.

Either way, this breaks some qemu-iotests cases whose reference output
needs to be updated.

Kevin


