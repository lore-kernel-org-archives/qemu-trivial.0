Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eMp2P-0007tY-QS
	for mharc-qemu-trivial@gnu.org; Thu, 07 Dec 2017 00:48:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eMp2J-0007qN-KO
	for qemu-trivial@nongnu.org; Thu, 07 Dec 2017 00:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eMp2G-0006Y3-Pv
	for qemu-trivial@nongnu.org; Thu, 07 Dec 2017 00:47:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eMp2A-0006T8-J6; Thu, 07 Dec 2017 00:47:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 207F5C054C44;
	Thu,  7 Dec 2017 05:47:45 +0000 (UTC)
Received: from [10.36.116.87] (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F917C54E;
	Thu,  7 Dec 2017 05:47:41 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <1512457825-3847-1-git-send-email-thuth@redhat.com>
	<ee0ee3e4-f8d4-048f-b772-49d15ada4254@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2b2dd271-451c-04cb-044e-ee5b8619559e@redhat.com>
Date: Thu, 7 Dec 2017 06:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <ee0ee3e4-f8d4-048f-b772-49d15ada4254@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 07 Dec 2017 05:47:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/ide: Remove
 duplicated definitions from ahci_internal.h
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
X-List-Received-Date: Thu, 07 Dec 2017 05:47:59 -0000

On 06.12.2017 23:16, John Snow wrote:
> I tweaked this again, sorry:
> 
> The names need to stay public, but the wrappers to manipulate the
> objects can stay internal. Minor difference.
> 
> If that's okay, I'll just merge this in.
> OK?

Sure. Feel also free to replace my "Signed-off-by" with "Reported-by" in
that case if you like.

 Thomas

