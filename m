Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG41Q-0003mu-Ox
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:27:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gG41P-0003lL-6y
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gG41O-0001fU-En
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:27:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gG41I-0001Z7-4v; Fri, 26 Oct 2018 11:27:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7153130020B8;
	Fri, 26 Oct 2018 15:27:23 +0000 (UTC)
Received: from localhost (unknown [10.33.36.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 091455D76E;
	Fri, 26 Oct 2018 15:27:22 +0000 (UTC)
Date: Fri, 26 Oct 2018 12:27:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
Message-ID: <20181026152721.GH3902@habkost.net>
References: <20181004161852.11673-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004161852.11673-1-crosa@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 26 Oct 2018 15:27:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/10] Trivial fixes and
 clean ups
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
X-List-Received-Date: Fri, 26 Oct 2018 15:27:36 -0000

On Thu, Oct 04, 2018 at 12:18:42PM -0400, Cleber Rosa wrote:
> Just a collection of trivial fixes and clean ups that have been lying
> around here for some time.

I'm queueing patches 07-10 on python-next.  I'm aware that
Laurent already queued some of them (thanks!), but I want to
avoid conflicts in case other patches touching these modules are
queued on python-next.

-- 
Eduardo

