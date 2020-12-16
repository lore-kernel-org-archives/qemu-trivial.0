Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpVRR-0001BR-KG
	for mharc-qemu-trivial@gnu.org; Wed, 16 Dec 2020 06:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpVRO-0001At-EM
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 06:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpVRM-0003F3-0R
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 06:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608119874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubqAnZsA6rvL3fOKSX1fYzqBXOnn4Ul0yTm2zrsA3bc=;
 b=PXsOvpWui0F94qHal9FeWcUMpoVAv5MiMWybNAK9FbgRIaZKUwPPr4zEtuNc4NTl3UnZ7P
 oIFC0wcbjJIJ7WrBoy6QEIhXUEXcg26bD8d7JLq24gc/aIkfPUn+aC6YtubmP8aIfegufs
 qhQAUklRkbfA8JYRiMJ3eA48TvTF6JQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-RIjE4ycBNbSOD_HhTECy8w-1; Wed, 16 Dec 2020 06:57:51 -0500
X-MC-Unique: RIjE4ycBNbSOD_HhTECy8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B319801B16;
 Wed, 16 Dec 2020 11:57:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660821975F;
 Wed, 16 Dec 2020 11:57:48 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:57:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: David Edmondson <dme@dme.org>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] block: report errno when flock fcntl fails
Message-ID: <20201216115746.GC7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
In-Reply-To: <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-List-Received-Date: Wed, 16 Dec 2020 11:57:58 -0000

Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
> 
> > Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
> >> When a call to fcntl(2) for the purpose of manipulating file locks
> >> fails, report the error returned by fcntl.
> >> 
> >> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> >
> > Is appending "Resource temporarily unavailable" in the common case (a
> > file locked by another process) actually an improvement for the message
> > or more confusing? It would be good to mention the motivation for the
> > change in the commit message.
> 
> Distinguishing between the common case and others is at least a start
> when trying to figure out why it failed. We have potentially useful
> information to assist in diagnosis, why throw it away?

I agree in principle, just when I saw the result, it felt more confusing
than helpful. Maybe the best option would be to include the errno only
if it's different from EAGAIN? Then the qemu-iotests reference output
would probably stay unchanged, too.

> In the case I encountered the failure appears to have been caused by
> SELinux misconfiguration.

Ah, so you got EPERM?

It can useful information in the future, let's include it in the commit
message.

> > Either way, this breaks some qemu-iotests cases whose reference output
> > needs to be updated.
> 
> Will fix and send a v2.

Thanks!

Kevin


