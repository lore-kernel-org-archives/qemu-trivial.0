Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cefbc-0004JG-Qu
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 05:17:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cefba-0004H2-9I
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 05:17:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cefbZ-0006ar-Cy
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 05:17:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cefbV-0006Y1-4y; Fri, 17 Feb 2017 05:17:29 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ECE020265;
	Fri, 17 Feb 2017 10:17:29 +0000 (UTC)
Received: from localhost (ovpn-8-33.pek2.redhat.com [10.72.8.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 756E3B7F84;
	Fri, 17 Feb 2017 10:17:28 +0000 (UTC)
Date: Fri, 17 Feb 2017 18:17:25 +0800
From: Fam Zheng <famz@redhat.com>
To: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, snaipe@arista.com,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20170217101725.GB3468@lemon.lan>
References: <20170216085857.23501-1-snaipe@diacritic.io>
	<20170217085800.28873-1-snaipe@diacritic.io>
	<CAK_MOSfBOJn6Zqo2Z9E8pLZLsuTJZ37HQo_1bp4XdU3iG55D1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK_MOSfBOJn6Zqo2Z9E8pLZLsuTJZ37HQo_1bp4XdU3iG55D1A@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 17 Feb 2017 10:17:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fixed mincore(2)
 not failing with ENOMEM
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
X-List-Received-Date: Fri, 17 Feb 2017 10:17:35 -0000

On Fri, 02/17 09:00, Franklin "Snaipe" Mathieu wrote:
> Ignore this patch, this was sent again by mistake.

Hi Franklin, thanks for the re-submission. Next time please send consecutive
versions as top-level threads instead of replies to previous versions, with
proper 'v2", "v3" tags in the subject.

Fam

