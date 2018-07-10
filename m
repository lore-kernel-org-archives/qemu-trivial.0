Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fctmE-0000LC-3K
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jul 2018 10:38:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fctmC-0000Jt-P8
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 10:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fctmC-0007KJ-0H
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 10:38:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53612)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fctm6-0007IF-9w; Tue, 10 Jul 2018 10:37:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D9D93084030;
	Tue, 10 Jul 2018 14:37:53 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5F9A60BE0;
	Tue, 10 Jul 2018 14:37:52 +0000 (UTC)
Date: Tue, 10 Jul 2018 11:37:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, imammedo@redhat.com
Message-ID: <20180710143751.GI7451@localhost.localdomain>
References: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 10 Jul 2018 14:37:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/machine: Remove the Zero check of
 nb_numa_nodes for numa_complete_configuration() follow-up
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2018 14:38:01 -0000

On Tue, Jul 10, 2018 at 06:51:29PM +0800, Dou Liyang wrote:
> This Commit 7747abf11487 misses the curly brackets. Follow Igor's and Eduardo's suggestion,
> 
> Add a follow-up patch for it.
> 
> Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>

I'm queueing this for 3.1, but the subject line didn't make sense
(this patch doesn't remove zero check of nb_numa_nodes), so I
rewrote the commit message as:

    machine: Fix coding style at machine_run_board_init()

    Commit 7747abf11487 ("hw/machine: Remove the Zero check of
    nb_numa_nodes for numa_complete_configuration()") removed the
    curly brackets.  Re-add them.

    Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
    Message-Id: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
    [ehabkost: rewrote commit message]
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

