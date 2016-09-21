Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmkNt-0004Yd-SI
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 12:28:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bmkNp-0004S7-GY
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 12:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bmkNo-0001RA-DT
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 12:28:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bmkNg-0001OY-05; Wed, 21 Sep 2016 12:28:20 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D38972D04;
	Wed, 21 Sep 2016 16:28:18 +0000 (UTC)
Received: from localhost (ovpn-116-19.phx2.redhat.com [10.3.116.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8LGSGb4031325; Wed, 21 Sep 2016 12:28:17 -0400
Date: Wed, 21 Sep 2016 13:28:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	peter.maydell@linaro.org, marcel@redhat.com
Message-ID: <20160921162815.GK3233@thinpad.lan.raisama.net>
References: <1474435433-9029-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474435433-9029-1-git-send-email-david@gibson.dropbear.id.au>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 21 Sep 2016 16:28:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [REPOST] sysbus: Remove ignored return value of
 FindSysbusDeviceFunc
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
X-List-Received-Date: Wed, 21 Sep 2016 16:28:32 -0000

On Wed, Sep 21, 2016 at 03:23:53PM +1000, David Gibson wrote:
> Functions of type FindSysbusDeviceFunc currently return an integer.
> However, this return value is always ignored by the caller in
> find_sysbus_device().
> 
> This changes the function type to return void, to avoid confusion over
> the function semantics.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Applying to my machine-next branch.

-- 
Eduardo

